package jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.repository;

import org.springframework.stereotype.Repository;

import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.model.Xxxx0001ParameterModel;

@Repository
public interface Xxxx0001Repository {

    /**
     * 雛型
     *
     * @param pm
     * @return Xxxx0001ParameterModel
     */
    public Xxxx0001ParameterModel getXxxData(Xxxx0001ParameterModel pm);
}
