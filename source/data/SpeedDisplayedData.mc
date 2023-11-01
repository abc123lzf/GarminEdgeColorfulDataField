import Toybox.Lang;
import Toybox.System;

class SpeedDisplayedData extends DisplayedData {

    public function initialize(cfg as UserConfig) {
        DisplayedData.initialize(cfg);
    }

    
    protected function parse2String(s) as String {
        if (s == null) {
            return "NaN";
        }
        var n = s.toDouble() / 10;
        return n.format("%.1f");
    }

    protected function toZone(value as Number) as Number {
        return userConfig.getZone(value / 10);
    }

    protected function transferOriginData(value as Number or Null) as Number {
        if (value == null) {
            return 0;
        }
        return value * 36;
    }
}