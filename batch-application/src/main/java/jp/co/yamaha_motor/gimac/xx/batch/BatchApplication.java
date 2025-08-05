package jp.co.yamaha_motor.gimac.xx.batch;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.ymsl.solid.jpa.repository.JpaExtensionRepositoryFactoryBean;

@SpringBootApplication
@EntityScan(basePackages = { "jp.co.yamaha_motor.gimac.xx.batch.*.entity" })
@EnableJpaRepositories(basePackages = {
        "jp.co.yamaha_motor.gimac.xx.batch.*.repository" }, repositoryFactoryBeanClass = JpaExtensionRepositoryFactoryBean.class)
@ComponentScan(basePackages = {
        "jp.co.yamaha_motor.gimac.*"
})
public class BatchApplication {

    public static void main(String[] args) {
        System.exit(SpringApplication.exit(SpringApplication.run(BatchApplication.class, args)));
    }
}
