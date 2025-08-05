package jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.boot.ApplicationArguments;
import org.springframework.stereotype.Service;

import com.ymsl.solid.base.exception.ApplicationException;

import jp.co.yamaha_motor.gimac.tools.batch.core.YnsBaseTaskletService;
import jp.co.yamaha_motor.gimac.tools.tool.FileIoTool;
import jp.co.yamaha_motor.gimac.xx.batch.common.constant.XxAppProperties;
import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.model.Xxxx0001ParameterModel;
import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.model.Xxxx0001TextFileModel;
import jp.co.yamaha_motor.gimac.xx.batch.xxxx0001.repository.Xxxx0001Repository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Xxxx0001
 * ＜ 雛型サンプル ＞
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class Xxxx0001Service extends YnsBaseTaskletService<Xxxx0001ParameterModel> {

    // データデリミタ
    private static final String DELIMITER = "|";

    private final ApplicationArguments applicationArguments;
    private final Xxxx0001Repository xxxx0001Repository;
    private final FileIoTool fileIoTool;

    /**
     * 引数取得
     */
    @Override
    public void setParameter(Xxxx0001ParameterModel pm) throws ApplicationException {
        // ※雛型の実装サンプル含みます。不要な場合は削除してください。

        // 実行時引数を Map<String, Object> に変換
        Map<String, Object> map = convertArgsToMap(applicationArguments.getSourceArgs());

        // 引数の値を取得
        pm.setArg1(map.get("arg1").toString()); // 引数1
        pm.setArg2(map.get("arg2").toString()); // 引数2(雛型では入力ファイル)
        pm.setOut1(map.get("out1").toString()); // 出力1(雛型では出力ファイル)

        // 引数の値をログ出力する
        log.info("arg1: {}", pm.getArg1());
        log.info("arg2: {}", pm.getArg2());
        log.info("out1: {}", pm.getOut1());
    }

    /**
     * 引数取得後処理
     */
    @Override
    public void prepareParameterAfter(Xxxx0001ParameterModel pm) throws ApplicationException {
        // ※雛型の実装サンプル含みます。不要な場合は削除してください。

        // 必要に応じて引数に対するチェック処理などを実装する
        StringBuilder errorMessages = new StringBuilder();

        // 必須チェック: 引数2(雛型では入力ファイル)
        if (pm.getArg1() == null || pm.getArg1().isEmpty()) {
            errorMessages.append("Mandatory parameter 'input file path' is not specified.\n");
        }

        // 必須チェック: 出力1(雛型では出力ファイル)
        if (pm.getOut1() == null || pm.getOut1().isEmpty()) {
            errorMessages.append("Mandatory parameter 'output file path' is not specified.\n");
        }

        // エラーメッセージが存在する場合、例外をスロー
        if (errorMessages.length() > 0) {
            throw new ApplicationException(errorMessages.toString().trim());
        }
    }

    /**
     * 初期処理
     */
    @Override
    public void init(Xxxx0001ParameterModel pm) throws ApplicationException {
        // ※雛型の実装サンプル含みます。不要な場合は削除してください。

        // 必要に応じて、パラメータモデルで持ち回る情報(引数以外)の取得処理を実装する。

        // DBからデータを取得
        Xxxx0001ParameterModel sampleInfo = xxxx0001Repository.getXxxData(pm);
        log.info("Sample ID: {}, Sample Name: {}", sampleInfo.getSampleId(), sampleInfo.getSampleName());

        // パラメータモデルで持ち回る情報を設定
        pm.setSampleId(sampleInfo.getSampleId());
        pm.setSampleName(sampleInfo.getSampleName());
    }

    /**
     * 主処理
     */
    @Override
    public void main(Xxxx0001ParameterModel pm) throws ApplicationException {
        // ※雛型の実装サンプル含みます。不要な場合は削除してください。

        // 主処理の実装

        // 入力ファイルからデータを読み込み、Xxxx0001TextFileModelのリストを取得
        List<Xxxx0001TextFileModel> inputList = getTextDataList(pm);

        // ファイル出力
        outputTextDataFile(pm, inputList);
    }

    /**
     * 後処理
     */
    @Override
    public void term(Xxxx0001ParameterModel pm) throws ApplicationException {
        // ※雛型の実装サンプル含みます。不要な場合は削除してください。

        // 処理結果をログ出力
        log.info("[arg2] Input Count  = {}", pm.getArg2TxtFileInputCount());
        log.info("[out1] Output Count = {}", pm.getOut1TxtFileOutputCount());
    }

    /**
     * 入力ファイルからデータを読み込み、Xxxx0001TextFileModelのリストに詰めて返す。
     * ※雛型上の実装サンプルのため、不要な場合はメソッドごと削除してください。
     *
     * @param pm
     *            パラメータモデル
     * @return 入力ファイルから取得したデータのリスト
     */
    private List<Xxxx0001TextFileModel> getTextDataList(Xxxx0001ParameterModel pm) {
        List<Xxxx0001TextFileModel> list = new ArrayList<>();
        String inputFile = pm.getArg2(); // 入力ファイルパス

        try (var reader = fileIoTool.getBufferedReader(inputFile)) {
            String line;

            // 入力件数を初期化
            int inputCnt = 0;

            while ((line = reader.readLine()) != null) {
                // デリミタで分割（例: | 区切り）
                String[] cols = line.split("\\Q" + DELIMITER + "\\E", -1);
                Xxxx0001TextFileModel model = new Xxxx0001TextFileModel();

                // モデルのフィールドに合わせてセット
                if (cols.length >= 2) {
                    int colCnt = 0;
                    model.setData1(cols[colCnt++]);
                    model.setData2(cols[colCnt++]);
                }
                list.add(model);
                inputCnt++;
            }

            // 入力件数をパラメータモデルに設定
            pm.setArg2TxtFileInputCount(inputCnt);

        } catch (IOException e) {
            e.printStackTrace();
            throw new ApplicationException("Failed to read the input file: " + e.getMessage());
        }
        return list;
    }

    /**
     * 入力データリストを指定された出力ファイルへ書き出す。
     * ※雛型上の実装サンプルのため、不要な場合はメソッドごと削除してください。
     *
     * @param pm
     *            パラメータモデル
     * @param inputDataList
     *            出力対象のデータリスト
     */
    private void outputTextDataFile(Xxxx0001ParameterModel pm, List<Xxxx0001TextFileModel> inputDataList) {

        StringBuilder writeRec = new StringBuilder();

        // ファイル出力
        try (PrintWriter fileWriter = fileIoTool.getPrintWriter(pm.getOut1())) {

            // 出力件数を初期化
            int outputCnt = 0;

            for (Xxxx0001TextFileModel model : inputDataList) {

                writeRec.setLength(0);

                // テキストファイルへ出力
                writeRec.append(XxAppProperties.SITE_CD.get());
                writeRec.append(DELIMITER);
                writeRec.append(model.getData1());
                writeRec.append(DELIMITER);
                writeRec.append(model.getData2());

                fileWriter.println(writeRec);
                outputCnt++;
            }

            // 出力件数をパラメータモデルに設定
            pm.setOut1TxtFileOutputCount(outputCnt);

        } catch (IOException e) {
            e.printStackTrace();
            throw new ApplicationException(e.getMessage());
        }
    }
}
