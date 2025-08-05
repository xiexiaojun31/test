package jp.co.yamaha_motor.gimac.xx.batch.common.constant;

import jp.co.yamaha_motor.gimac.tools.tool.AppProperties;
import lombok.extern.slf4j.Slf4j;

/**
 * application.yml の app:properties: 直下の項目を管理する Enum
 */
@Slf4j
public enum XxAppProperties {
    SITE_CD("site-cd"); // 拠点コード

    private final String key;

    XxAppProperties(String key) {
        this.key = key;
    }

    /**
     * プロパティ値を取得する
     * 
     * @return プロパティ値
     */
    public String get() {
        String value = AppProperties.getProperty(key);
        if (value == null) {
            log.warn("{}({}): Property not found.", name(), key);
        }
        return value;
    }
}