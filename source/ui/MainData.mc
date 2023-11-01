import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;


class MainData extends WatchUi.Drawable {

    private const NAN = "NaN";

    private var label as String or Null; 

    private var text as String;

    private var labelElement as GraphicsElement or Null;

    private var textElement as GraphicsElement or Null;

    function initialize() {
        var dictionary = {
            :identifier => "MainData",
        };
        Drawable.initialize(dictionary);
        text = NAN;
        labelElement = null;
        textElement = null;
    }

    public function setLabel(v as String or Null) as Void {
        label = v;
    }

    public function setText(v as String) as Void {
        text = v;
    }

    public function setGraphicsElement(labelElement as GraphicsElement or Null, textElement as GraphicsElement or Null) as Void {
        self.labelElement = labelElement;
        self.textElement = textElement;
    }

    function draw(dc as Dc) as Void {
        if (labelElement != null && label != null) {
            dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_WHITE);
            dc.drawText(labelElement.x(), labelElement.y(), Graphics.FONT_SYSTEM_XTINY, label, Graphics.TEXT_JUSTIFY_LEFT);
        }
        if (textElement != null && text != null) {
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
            dc.drawText(textElement.x(), textElement.y(), Graphics.FONT_SYSTEM_LARGE, text, Graphics.TEXT_JUSTIFY_LEFT);
        }
        Drawable.draw(dc);
    }
}