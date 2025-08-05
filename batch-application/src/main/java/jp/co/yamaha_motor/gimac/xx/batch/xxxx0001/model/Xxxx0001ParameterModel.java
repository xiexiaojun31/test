package jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.model;

import jp.co.yamaha_motor.gimac.tools.batch.model.YnsBatchParameterModel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Xxxx0001ParameterModel extends YnsBatchParameterModel {

    private String arg1;
    private String arg2;
    private String out1;

    private int sampleId;
    private String sampleName;

    private int arg2TxtFileInputCount;
    private int out1TxtFileOutputCount;
}
