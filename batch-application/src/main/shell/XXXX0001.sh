#!/bin/bash
################################################################################
#  << [BASH Template] Sample Exec >>
#    @ID      : XXXX0001.sh
################################################################################
#===============================================================================
#@SEE < PARAMETER DEFINITION >
#===============================================================================
#-------------------------------------------------------------------------------
#@SEE < Module Decision Set >
#-------------------------------------------------------------------------------
#< Module Nicname Set >
L_MODULE="blank"

#-------------------------------------------------------------------------------
#@SEE < System / Shell Parameter Get >
#-------------------------------------------------------------------------------
# < Shell Parameter Get >
for arg in $@; do
    str=`echo ${arg:0:5}`
    case $str in
        base:)
             L_SYS_BASE=`echo $arg | cut -f2 -d':'`
             ;;
        *)
             echo "Make no conditions"
             ;;
    esac
done

#===============================================================================
#@SEE < ENVIRONMENT DEFINITION >
#===============================================================================
#-------------------------------------------------------------------------------
#@SEE < PYMAC+MODULE.ENV Get >
#-------------------------------------------------------------------------------
# < Directory & Shell Get >
L_JOB_BASENAME=`basename $0`
L_JOB_BASEDIR=`dirname $0`
# < Capital Letter Conversion >
L_JOB_ID=`echo $L_JOB_BASENAME | cut -f1 -d'.'`
L_JOB_ID=`echo $L_JOB_ID | tr '[a-z]' '[A-Z]'`
# < Module Decision >
L_JOB_MODULE=`echo ${L_JOB_ID:0:2}`
# < MODULE.ENV Path Set >
L_SYS_BASE_WK=`echo $L_SYS_BASE | tr '[A-Z]' '[a-z]'`
L_MODULE_WK=`echo $L_MODULE | tr '[A-Z]' '[a-z]'`
L_MODULE_ENV_PATH="/../../../std/"$L_MODULE_WK"/shell/env/."
L_MODULE_ENV_PATH=$L_JOB_BASEDIR$L_MODULE_ENV_PATH
L_MODULE_ENV_PATH=$(cd $(dirname $L_MODULE_ENV_PATH) && pwd)
L_MODULE_ENV_FPATH=$L_MODULE_ENV_PATH"/"$L_JOB_MODULE"_COMMON.ENV"
# < File Size Judgment >
if [ -s $L_MODULE_ENV_FPATH ]; then
    source $L_MODULE_ENV_FPATH
else
    echo "***********************( "`date '+%Y-%m-%d %a %T'`" )*"
    echo "* MODULE ENV. Reading File = impossible request ! *"
    echo "***************************************************"
    exit 1
fi

#-------------------------------------------------------------------------------
#@SEE < Variable Definition >
#-------------------------------------------------------------------------------
# < Return Value >
R_SUCCESS=0                             ##(DOC) Success
R_FAILURE=1                             ##(DOC) Failure
# < Status Variable >
L_STATUS=0                              ##(DOC) Process Status
# < System Date >
L_JOB_DATE=`date +%Y%m%d`               ##(DOC) yyyymmdd
L_JOB_DATETIME=`date +%Y%m%d%H%M%S`     ##(DOC) yyyymmddhhmmss
# < Log File >
L_LOG_FILE=$L_JOB_ID"."$L_JOB_DATE      ##(DOC) Log File
L_LOG_FPATH=$L_BDIR_LOG"/"$L_LOG_FILE   ##(DOC) Log File Path

#===============================================================================
#@SEE < INITIAL PROCESS >
#===============================================================================
#-------------------------------------------------------------------------------
#@SEE < Local Variable Definition >
#-------------------------------------------------------------------------------
L_JOB_NAME="[BASH Template] Sample Exec"    ##(DOC) Job Name
#L_SYS_OWNER_CD=""                                      ##(DOC) Owner Code Control
#L_FILE_PROC="OFF"                                      ##(DOC) File Process Control
#L_MAIL_PROC="OFF"                                      ##(DOC) Mail Process Control
#L_LIST_PROC="OFF"                                      ##(DOC) List Process Control

#-------------------------------------------------------------------------------
#@SEE < Start Log Output >
#-------------------------------------------------------------------------------
# < Log File Create >
#touch $L_LOG_FPATH                               ##(DOC) Log File Initialization
# < Start Log Output >
L_JOB_STIME=`date '+%Y-%m-%d_%a_%T'`             ##(DOC) yyyy-mm-dd www hhmmss
F_JOBLOG_JS $L_LOG_FPATH $L_JOB_ID $L_JOB_STIME "$L_JOB_NAME"
                                                 ##(DOC) Start Log Output
# < Environmental Log Output >
F_JOBLOG_JI $L_LOG_FPATH

#-------------------------------------------------------------------------------
#@SEE < STEP6 : XXXX0001 :  Exec Java >
#-------------------------------------------------------------------------------
# < Java Batch Parameter >
L_PGM_ID="jobXxxx0001"                                         ##(DOC) Processing program ID
L_PG_COMMENT="Sample File Output"                             ##(DOC) Processing program Comment
L_PG_ARG0="arg1:sample"
L_PG_ARG1="arg2:/mnt/efs/app/blank/xxxx0001_input.txt"
L_PG_ARG2="out1:/mnt/efs/app/blank/xxxx0001_output.txt"

# < Process Status Judgment >
if [ $L_STATUS -eq $R_SUCCESS ]; then
    # < Step Start Log Output >
    F_JOBLOG_JBS $L_LOG_FPATH $L_PG_ID "$L_PG_COMMENT"

    # < Java Batch Call >
    F_JAVA_BATCH_EXEC $L_PGM_ID     \
                      $L_PG_ARG0    \
                      $L_PG_ARG1    \
                      $L_PG_ARG2

    # < Status Set >
    L_STATUS=$?                                  ##(DOC) Status Keeping

    # < Step End Log Output >
    if [ $L_STATUS -ne $R_SUCCESS ]; then
        F_JOBLOG_JBE $L_LOG_FPATH $L_PG_ID $L_STATUS
    fi
fi
#===============================================================================
#@SEE < TERMINATION PROCESS >
#===============================================================================
#-------------------------------------------------------------------------------
#@SEE < Place the result back in OS >
#-------------------------------------------------------------------------------
# < Finish Time Get >
L_JOB_ETIME=`date '+%Y-%m-%d_%a_%T'`            ##(DOC) yyyy-mm-dd www hhmmss
# < Return Value >
if [ $L_STATUS -eq $R_SUCCESS ]; then
    # < End Log Output >
    F_JOBLOG_JE $L_LOG_FPATH $L_JOB_ID "SUCCESS" $L_JOB_STIME $L_JOB_ETIME
    # < Success >
    exit $R_SUCCESS
else
    # < End Log Output >
    F_JOBLOG_JE $L_LOG_FPATH $L_JOB_ID "FAILURE" $L_JOB_STIME $L_JOB_ETIME
    # < Failure >
    exit $R_FAILURE
fi
