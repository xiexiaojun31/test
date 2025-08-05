ARG JDK_VERSION=17.0.13_11
ARG BASE_IMG_PREFIX=
FROM ${BASE_IMG_PREFIX}eclipse-temurin:${JDK_VERSION}-jdk

# Create a non-root user
ARG USERNAME=appuser
ARG USER_UID=1001
ARG USER_GID=$USER_UID
ARG L_MODULE=blank
ARG L_SYS_OWNER=std

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd -ms /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

# Create necessary directories and set permissions
RUN mkdir -p /app/conf && chown -R ${USER_UID}:${USER_UID} /app

# Create necessary directories
RUN mkdir -p /app/exe/system/shell/env && \
    mkdir -p /app/exe/$L_MODULE/shell && \
    mkdir -p /app/$L_SYS_OWNER/$L_MODULE/shell/env && \
    chmod -R 755 /app/exe && \
    chmod -R 755 /app/$L_SYS_OWNER

# Copy L_FUNCTION.ENV and L_YNS.ENV to exe/system/shell/env
COPY batch-application/src/main/shell/env/L_FUNCTION.ENV /app/exe/system/shell/env/
COPY batch-application/src/main/shell/env/L_YNS.ENV /app/exe/system/shell/env/

# Copy XX_COMMON.ENV to $L_SYS_OWNER/$L_MODULE/shell/env
COPY batch-application/src/main/shell/env/XX_COMMON.ENV /app/$L_SYS_OWNER/$L_MODULE/shell/env/

# Copy all .sh files from shell folder to /app/exe/$L_MODULE/shell/
COPY batch-application/src/main/shell/*.sh /app/exe/$L_MODULE/shell/

# Set permissions for copied files
RUN chmod 644 /app/exe/system/shell/env/L_FUNCTION.ENV && \
    chmod 644 /app/exe/system/shell/env/L_YNS.ENV && \
    chmod 644 /app/$L_SYS_OWNER/$L_MODULE/shell/env/XX_COMMON.ENV && \
    chmod 755 /app/exe/$L_MODULE/shell/*.sh

# Add the application JAR file
ARG BOOT_JAR_DIR=./batch-application/build/libs
ADD ${BOOT_JAR_DIR}/*-boot.jar /app/app.jar
RUN chown ${USER_UID}:${USER_GID} /app/app.jar && \
    chmod 500 /app/app.jar

# Copy Fluent Bit configuration file
COPY fluent-bit.conf /fluent-bit/etc/fluent-bit.conf

# Switch to the non-root user
USER $USERNAME
WORKDIR /app

# Set the default command
CMD ["java", "-jar", "/app/app.jar"]
