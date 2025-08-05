package jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.repository.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ymsl.solid.jpa.query.JpaNativeQuerySupportRepository;

import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.model.Xxxx0001ParameterModel;
import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.repository.Xxxx0001Repository;

@Repository
public class Xxxx0001RepositoryImpl extends JpaNativeQuerySupportRepository implements Xxxx0001Repository {

    @Override
    public Xxxx0001ParameterModel getXxxData(Xxxx0001ParameterModel pm) {

        StringBuilder sql = new StringBuilder();

        Map<String, Object> map = new HashMap<>();

        // テーブルがなくてもOKなサンプルSQL
        sql.append(" SELECT :param1 AS sample_id, :param2 AS sample_name");

        // パラメータを設定
        map.put("param1", 1);
        map.put("param2", "sample");

        return queryForSingle(sql.toString(), map, Xxxx0001ParameterModel.class);
    }
}
