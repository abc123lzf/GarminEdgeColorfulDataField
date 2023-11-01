import Toybox.Lang;

class GraphicsElement {

    private var lx as Number;

    private var ly as Number;

    private var width as Number;

    private var height as Number;

    public function initialize(x as Number, y as Number, width as Number, height as Number) {
        self.lx = x;
        self.ly = y;
        self.width = width;
        self.height = height;
    }

    public function x() as Number {
        return lx;
    }

    public function y() as Number {
        return ly;
    }

    public function w() as Number {
        return width;
    }

    public function h() as Number {
        return height;
    }
}