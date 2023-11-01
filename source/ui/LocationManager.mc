import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

class LocationManager {

    public var colorBlock as GraphicsElement;

    public var mainDataLabel as GraphicsElement;

    public var mainDataText as GraphicsElement;

    public var minorTopData as GraphicsElement or Null;

    public var minorBottomData as GraphicsElement or Null;

    public var minorTopLabel as GraphicsElement or Null;

    public var minorBottomLabel as GraphicsElement or Null;

    public function initialize(dc as Dc) {
        var w = dc.getWidth();
        var h = dc.getHeight();

        if (w <= 150) {
            self.colorBlock = new GraphicsElement(0, 0, 20, h);
            self.mainDataLabel = new GraphicsElement(colorBlock.x() + colorBlock.w() + 8, 0, 94, 10);
            self.mainDataText = new GraphicsElement(colorBlock.x() + colorBlock.w() + 8, (h * 0.3).toNumber(), 94, 50);
            self.minorTopData = null;
            self.minorBottomData = null;
            self.minorTopLabel = null;
            self.minorBottomLabel = null;
            return;
        }

        self.colorBlock = new GraphicsElement(0, 0, 36, h);
        self.mainDataLabel = new GraphicsElement(colorBlock.x() + colorBlock.w() + 16, 0, 94, 10);
        self.mainDataText = new GraphicsElement(colorBlock.x() + colorBlock.w() + 16, (h * 0.3).toNumber(), 94, 50);

        self.minorTopData = new GraphicsElement(w - 5, 0, 0, 0);
        self.minorBottomData = new GraphicsElement(w - 5, (h * 0.5).toNumber(), 0, 0);

        self.minorTopLabel = new GraphicsElement(mainDataLabel.x() + mainDataLabel.w() + 5, 0, 0, 0);
        self.minorBottomLabel = new GraphicsElement(mainDataLabel.x() + mainDataLabel.w() + 5, (h * 0.5).toNumber(), 0, 0);
    }
}