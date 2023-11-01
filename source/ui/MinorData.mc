import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;


class MinorData extends WatchUi.Drawable {

    private const NAN = "NaN";

    private var topText as String;

    private var bottomText as String;

    private var topLabel as String or Null;

    private var bottomLabel as String or Null;

    private var topTextElement as GraphicsElement or Null;

    private var bottomTextElement as GraphicsElement or Null;

    private var topLabelElement as GraphicsElement or Null;

    private var bottomLabelElement as GraphicsElement or Null;

    function initialize() {
        var dictionary = {
            :identifier => "MinorData",
        };
        Drawable.initialize(dictionary);
        topText = NAN;
        bottomText = NAN;
        topLabel = null;
        bottomLabel = null;
        topTextElement = null;
        bottomTextElement = null;
        topLabelElement = null;
        bottomLabelElement = null;
    }

    public function setTopText(v as String) as Void {
        topText = v;
    }

    public function setBottomText(v as String) as Void {
        bottomText = v;
    }

    public function setTopLabel(v as String) as Void {
        topLabel = v;
    }

    public function setBottomLabel(v as String) as Void {
        bottomLabel = v;
    }

    public function setTextGraphicsElement(top as GraphicsElement or Null, bottom as GraphicsElement or Null) as Void {
        topTextElement = top;
        bottomTextElement = bottom;
    }

    public function setLabelGraphicsElement(top as GraphicsElement or Null, bottom as GraphicsElement or Null) as Void {
        topLabelElement = top;
        bottomLabelElement = bottom;
    }

    function draw(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        if (topTextElement != null) {
            dc.drawText(topTextElement.x(), topTextElement.y(), Graphics.FONT_MEDIUM, topText, Graphics.TEXT_JUSTIFY_RIGHT);
        }
        
        if (bottomTextElement != null) {
            
            dc.drawText(bottomTextElement.x(), bottomTextElement.y(), Graphics.FONT_MEDIUM, bottomText, Graphics.TEXT_JUSTIFY_RIGHT);
        }

        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_WHITE);
        if (topLabel != null && topLabelElement != null) {
            dc.drawText(topLabelElement.x(), topLabelElement.y(), Graphics.FONT_SYSTEM_XTINY, topLabel, Graphics.TEXT_JUSTIFY_LEFT);
        }

        if (bottomLabel != null && bottomLabelElement != null) {
            dc.drawText(bottomLabelElement.x(), bottomLabelElement.y(), Graphics.FONT_SYSTEM_XTINY, bottomLabel, Graphics.TEXT_JUSTIFY_LEFT);
        }
        
        Drawable.draw(dc);
    }
}