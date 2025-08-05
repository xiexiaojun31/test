package jp.co.yamaha_motor.gimac.xx.batch.config.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.test.JobLauncherTestUtils;
import org.springframework.batch.test.JobRepositoryTestUtils;
import org.springframework.batch.test.context.SpringBatchTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.batch.JobLauncherApplicationRunner;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;

import jp.co.yamaha_motor.gimac.xx.batch.BatchApplication;


@SpringBootTest(classes = { BatchApplication.class })
@SpringBatchTest
@ActiveProfiles("development-test")
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public abstract class AbstractBatchTestCase {

    protected  final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    protected JobLauncher jobLauncher;

    @Autowired
    protected JobRepository jobRepository;

    @Autowired
    protected JobLauncherTestUtils jobLauncherTestUtils;

    @Autowired
    protected JobRepositoryTestUtils jobRepositoryTestUtils;

    /**
     * Avoid running the job automatically when testing the batch
     */
    @MockBean
    JobLauncherApplicationRunner __runner__;

    boolean isSwitchedToJob = false;


    /**
     * Sets the job to be used by the JobLauncherTestUtils.
     *
     * @param targetJob the job to be set
     */
    protected void switchJobTo(Job targetJob) {
        jobLauncherTestUtils.setJob(targetJob);
        log.info("===> Switched to job: " + targetJob.getName());
        isSwitchedToJob = true;
    }

    /**
     *  Launches the job and returns the JobExecution object.
     *
     * @return the JobExecution object
     * @throws Exception
     */
    protected JobExecution launchJob() throws Exception {
        if(!isSwitchedToJob || jobLauncherTestUtils.getJob() == null) { // if no job is set
            return null;
        }
        log.info("===> Launch job: " + jobLauncherTestUtils.getJob().getName());
        return jobLauncherTestUtils.launchJob();
    }

    /**
     * Launches the job with the given job parameters and returns the JobExecution object.
     *
     * @param jobParameters the job parameters to be used
     * @return the JobExecution object
     * @throws Exception
     */
    protected JobExecution launchJob(JobParameters jobParameters) throws Exception {
        if(!isSwitchedToJob || jobLauncherTestUtils.getJob() == null) { // if no job is set
            return null;
        }
        log.info("===> Launch job: " + jobLauncherTestUtils.getJob().getName());
        return jobLauncherTestUtils.launchJob(jobParameters);
    }

    /**
     * Removes all job executions from the job repository.
     */
    protected void removeAllJobExecutions() {
        jobRepositoryTestUtils.removeJobExecutions();
    }
 

    protected JobParametersBuilder createUniqParametersBuilder() {
        return jobLauncherTestUtils.getUniqueJobParametersBuilder();
    }

    protected JobParameters createUniqParameters() {
        return jobLauncherTestUtils.getUniqueJobParameters();
    }
}
