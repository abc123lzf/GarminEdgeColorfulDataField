import Toybox.Lang;
import Toybox.System;

class DisplayedData {

    /**
     * 区间
     */
    protected var zone as Number;
    
    /**
     * 主数据值
     */
    protected var mainText as String or Null;

    /**
     * 右上角数据值
     */
    protected var minorTopText as String or Null;

    /**
     * 右下角数据值
     */
    protected var minorBottomText as String or Null;

    /**
     * 用户配置
     */
    protected var userConfig as UserConfig;

    /**
     * 数据统计容器
     */
    protected var statistics as DataStatistics;


    public function initialize(cfg as UserConfig) {
        userConfig = cfg;
        zone = 1;
        mainText = null;
        minorTopText = null;
        minorBottomText = null;
        statistics = new DataStatistics();
    }

    public function getZone() as Number {
        return zone;
    }

    public function getMainDataText() as String {
        return mainText;
    }

    public function getMinorTopDataText() as String {
        return minorTopText;
    }

    public function getMinorBottomDataText() as String {
        return minorBottomText;
    }

    
    public function acceptData(value as Number or Null) as Void {
        value = transferOriginData(value);
        statistics.accept(value);
        mainText = calcualte(userConfig.getMainDataCalcualteType());
        minorTopText = calcualte(userConfig.getMinorTopDataCalcualteType());
        minorBottomText = calcualte(userConfig.getMinorBottomDataCalcualteType());
        zone = toZone(value);
    }

    protected function transferOriginData(value as Number or Null) as Number {
        return value != null ? value : 0;
    }


    protected function toZone(value as Number) as Number {
        return userConfig.getZone(value);
    }


    private function calcualte(type as Number) as String or Null {
        switch(type) {
            case UserConfig.CALC_DISABLE:
                return null;
            case UserConfig.CALC_CURRENT:
                return parse2String(statistics.getCurrent());
            case UserConfig.CALC_MAX:
                return parse2String(statistics.getMax());
            case UserConfig.CALC_AVG:
                return parse2String(statistics.getAverage());
            case UserConfig.CALC_AVG_3s:
                return parse2String(statistics.getRangeAverage(0, 3));
            case UserConfig.CALC_AVG_5s:
                return parse2String(statistics.getRangeAverage(0, 5));
            case UserConfig.CALC_AVG_10s:
                return parse2String(statistics.getRangeAverage(0, 10));
            case UserConfig.CALC_AVG_30s:
                return parse2String(statistics.getRangeAverage(0, 30));
            case UserConfig.CALC_BEFORE_AVG_3s:
                return parse2String(statistics.getRangeAverage(3, 6));
            case UserConfig.CALC_BEFORE_AVG_5s:
                return parse2String(statistics.getRangeAverage(5, 10));
            case UserConfig.CALC_BEFORE_AVG_10s:
                return parse2String(statistics.getRangeAverage(10, 20));
            case UserConfig.CALC_BEFORE_AVG_30s:
                return parse2String(statistics.getRangeAverage(30, 60));
        }

        return null;
    }


    protected function parse2String(s) as String {
        if (s == null) {
            return "NaN";
        } else if (s instanceof Number || s instanceof Long) {
            return s.toString();
        } else {
            return s.format("%.1f");
        }
    }
}