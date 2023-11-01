import Toybox.Lang;
import Toybox.System;
import Toybox.Application.Properties;


class UserConfig {

    public static const TYPE_POWER = 0;
    public static const TYPE_SPEED = 1;
    public static const TYPE_HEART_RATE = 2;
    public static const TYPE_CADENCE = 0;

    public const CALC_DISABLE = 0;
    public const CALC_CURRENT = 1;
    public const CALC_MAX = 2;
    public const CALC_AVG = 3;
    public const CALC_AVG_3s = 4;
    public const CALC_AVG_5s = 5;
    public const CALC_AVG_10s = 6;
    public const CALC_AVG_30s = 7;
    public const CALC_BEFORE_AVG_3s = 8;
    public const CALC_BEFORE_AVG_5s = 9;
    public const CALC_BEFORE_AVG_10s = 10;
    public const CALC_BEFORE_AVG_30s = 11;

    private const ZONE_SIZE = 7;

    private var dataType as Number;

    private var mainDataCalcualteType as Number;

    private var minorTopDataCalcualteType as Number;

    private var minorBottomDataCalcualteType as Number;

    private var minorTopLabel as String or Null;

    private var minorBottomLabel as String or Null;

    private var zoneThresholds as Array<Number>;

    public function initialize() {
        dataType = Properties.getValue("UCFG_DATA_TYPE");
        mainDataCalcualteType = Properties.getValue("UCFG_MAIN_DATA_CALC_TYPE");
        minorTopDataCalcualteType = Properties.getValue("UCFG_MINOR_TOP_DATA_CALC_TYPE");
        minorBottomDataCalcualteType = Properties.getValue("UCFG_MINOR_BOTTOM_DATA_CALC_TYPE");
        minorTopLabel = Properties.getValue("UCFG_MINOR_TOP_LABEL");
        minorBottomLabel = Properties.getValue("UCFG_MINOR_BOTTOM_LABEL");

        zoneThresholds = new Array<Number>[ZONE_SIZE];
        for (var i = 0; i < ZONE_SIZE; i += 1) {
            zoneThresholds[i] = Properties.getValue("UCFG_ZONE" + (i + 1));
        }
    }


    public function getZone(number as Number) as Number {
        for (var i = 0; i < ZONE_SIZE; i += 1 ) {
            if (number <= zoneThresholds[i]) {
                return i + 1;
            }
        }
        return 7;
    }

    
    public function getDataType() as Number {
        return dataType;
    }

    public function getMainDataCalcualteType() as Number {
        return mainDataCalcualteType;
    }


    public function getMinorTopDataCalcualteType() as Number {
        return minorTopDataCalcualteType;
    }

    public function getMinorBottomDataCalcualteType() as Number {
        return minorBottomDataCalcualteType;
    }

    public function getMinorTopLabel() as String or Null {
        return minorTopLabel;
    }

    public function getMinorBottomLabel() as String or Null {
        return minorBottomLabel;
    }
}