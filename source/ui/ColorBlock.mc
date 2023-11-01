import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

class ColorBlock extends WatchUi.Drawable {

    private var zoneIndex as Number;

    private var element as GraphicsElement or Null;

    function initialize() {
        var dictionary = {
            :identifier => "ColorBlock",
        };
        Drawable.initialize(dictionary);
        zoneIndex = 1;
        element = null;
    }

    public function setZone(zone as Number) as Void {
        zoneIndex = zone;
    }

    public function setGraphicsElement(e as GraphicsElement or Null) as Void {
        element = e;
    }

    function draw(dc as Dc) as Void {
        dc.setColor(getColor(), Graphics.COLOR_WHITE);
        dc.fillRectangle(element.x(), element.y(), element.w(), element.h());
        Drawable.draw(dc);
    }

    private function getColor() as ColorValue {
        switch(zoneIndex) {
            case 1:
                return Graphics.COLOR_DK_GRAY;
            case 2:
                return Graphics.COLOR_BLUE;
            case 3:
                return Graphics.COLOR_GREEN;
            case 4:
                return Graphics.COLOR_YELLOW;
            case 5:
                return Graphics.COLOR_ORANGE;
            case 6:
                return Graphics.COLOR_RED;
            case 7:
                return Graphics.COLOR_PURPLE;
            default:
                return Graphics.COLOR_WHITE;
        }
    }
}