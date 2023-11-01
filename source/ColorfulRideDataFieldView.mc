import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class ColorfulRideDataFieldView extends WatchUi.DataField {

    private var background as Background;

    private var colorBlock as ColorBlock;

    private var mainData as MainData;

    private var minorData as MinorData;

    private var userConfig as UserConfig;

    private var displayedData as DisplayedData;

    function initialize() {
        DataField.initialize();
        
        background = new Background();
        colorBlock = new ColorBlock();
        mainData = new MainData();
        minorData = new MinorData();
        userConfig = new UserConfig();
        displayedData = getDisplayedData(userConfig);
    }


    function onLayout(dc as Dc) as Void {
        var loc = new LocationManager(dc);
        colorBlock.setGraphicsElement(loc.colorBlock);

        mainData.setLabel(getLabelText(userConfig.getDataType()));
        mainData.setGraphicsElement(loc.mainDataLabel, loc.mainDataText);

        minorData.setTextGraphicsElement(loc.minorTopData, loc.minorBottomData);
        minorData.setLabelGraphicsElement(loc.minorTopLabel, loc.minorBottomLabel);
        minorData.setTopLabel(userConfig.getMinorTopLabel());
        minorData.setBottomLabel(userConfig.getMinorBottomLabel());
        View.setLayout([background, colorBlock, mainData, minorData]);
    }


    function compute(info as Activity.Info) as Void {
        acceptData(userConfig.getDataType(), info);
    }


    function onUpdate(dc as Dc) as Void {
        colorBlock.setZone(displayedData.getZone());
        mainData.setText(displayedData.getMainDataText());
        minorData.setTopText(displayedData.getMinorTopDataText());
        minorData.setBottomText(displayedData.getMinorBottomDataText());
        View.onUpdate(dc);
    }


    private function getDisplayedData(cfg as UserConfig) as DisplayedData {
        switch(cfg.getDataType()) {
            case UserConfig.TYPE_POWER:
                return new PowerDisplayedData(cfg);
            case UserConfig.TYPE_SPEED:
                return new SpeedDisplayedData(cfg);
            case UserConfig.TYPE_HEART_RATE:
                return new HeartRateDisplayedData(cfg);
            case UserConfig.TYPE_CADENCE:
                return new CadenceDisplayedData(cfg);
        }
        throw new Exception();
    }


    private function acceptData(type as Number, info as Activity.Info) {
        if (type == UserConfig.TYPE_POWER) {
            if (info has :currentPower) {
                displayedData.acceptData(info.currentPower);
            } else {
                displayedData.acceptData(0);
            }
        } else if (type == UserConfig.TYPE_SPEED) {
            if (info has :currentSpeed) {
                displayedData.acceptData(info.currentSpeed);
            } else {
                displayedData.acceptData(0);
            }
        } else if (type == UserConfig.TYPE_HEART_RATE) {
            if (info has :currentHeartRate) {
                displayedData.acceptData(info.currentHeartRate);
            } else {
                displayedData.acceptData(0);
            }
        } else if (type == UserConfig.TYPE_CADENCE) {
            if (info has :currentCadence) {
                displayedData.acceptData(info.currentCadence);
            } else {
                displayedData.acceptData(0);
            }
        }
    }


    private function getLabelText(type as Number) as String {
        switch(type) {
            case UserConfig.TYPE_POWER:
                return "Power";
            case UserConfig.TYPE_SPEED:
                return "Speed";
            case UserConfig.TYPE_HEART_RATE:
                return "Heart Rate";
            case UserConfig.TYPE_CADENCE:
                return "Cadence";
        }
        throw new Exception();
    }
}
