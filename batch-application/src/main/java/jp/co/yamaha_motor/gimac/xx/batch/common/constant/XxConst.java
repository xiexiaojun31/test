package jp.co.yamaha_motor.gimac.xx.batch.common.constant;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

/**
 * 定数クラス
 * <p>
 * 定数を定義するクラスです。
 * </p>
 */
@Component // アプリケーション起動時にSpringの機能でクラスロードさせる。（SYS_DATE設定のため）
public final class XxConst {

    private XxConst() {
        // インスタンス化を防ぐためのプライベートコンストラクタ。処理不要。
    }

    // 業務システムコード
    public static final String BIZ_SYS_CD = "X";

    // システムコード
    public static final String SYS_CD = "XX";

    // バッチ起動時間（クラスに@Componentを付与して、アプリケーション起動時に初期化する）
    public static final LocalDateTime SYS_DATE;

    // 静的初期化ブロックで初期化
    static {
        // LocalDateTime を使用して現在時刻（サーバのタイムゾーン）を取得し、Instant に変換
        SYS_DATE = LocalDateTime.now();
    }

}
