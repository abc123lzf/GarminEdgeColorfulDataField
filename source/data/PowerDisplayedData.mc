import Toybox.Lang;
import Toybox.System;

class PowerDisplayedData extends DisplayedData {

    public function initialize(cfg as UserConfig) {
        DisplayedData.initialize(cfg);
    }

    protected function parse2String(s) as String {
        System.println("OVER");
        if (s == null) {
            return "NaN";
        } else if (s instanceof Number || s instanceof Long) {
            return s.toString();
        } else {
            return s.toNumber().toString();
        }
    }
}