package jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.config;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.step.builder.StepBuilder;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;

import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.model.Xxxx0001ParameterModel;
import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.service.Xxxx0001Service;

@Configuration
public class Xxxx0001BatchConfig {

    // プログラムID(先頭のみ大文字形式)
    public static final String PGM_ID = "Xxxx0001";
    // SpringBatchのStep名
    public static final String STEP_NAME = "step" + PGM_ID;
    // SpringBatchのJob名
    public static final String JOB_NAME = "job" + PGM_ID;

    @Autowired
    private Xxxx0001Service xxxx0001Service;

    /*
     * ステップの設定
     */
    @Bean(name = STEP_NAME)
    Step stepXxxx0001(JobRepository jobRepository, PlatformTransactionManager transactionManager) {
        return new StepBuilder(STEP_NAME, jobRepository)
                .tasklet((contribution, chunkContext) -> {
                    // パラメータモデルを生成
                    Xxxx0001ParameterModel pm = new Xxxx0001ParameterModel();
                    // プログラムIDを設定
                    pm.setPgmId(PGM_ID);
                    // バッチサービスを実行
                    xxxx0001Service.doExecute(pm);
                    return RepeatStatus.FINISHED;
                }, transactionManager)
                .allowStartIfComplete(true)
                .build();
    }

    /*
     * ジョブの設定
     */
    @Bean(name = JOB_NAME)
    Job jobXxxx0001(@Qualifier(STEP_NAME) Step stepXxxx0001, JobRepository jobRepository) {
        return new JobBuilder(JOB_NAME, jobRepository)
                // .validator(getParametersValidator()) // Springの機能で前回パラメータを再利用してしまうため利用不可。
                .incrementer(new RunIdIncrementer())
                .start(stepXxxx0001)
                .build();
    }

    // Springの機能で前回パラメータを再利用してしまうため利用不可。
    // private DefaultJobParametersValidator getParametersValidator() {
    // DefaultJobParametersValidator valid = new DefaultJobParametersValidator();
    // valid.setRequiredKeys(new String[] { "arg1", "out1" });
    // return valid;
    // }

}
