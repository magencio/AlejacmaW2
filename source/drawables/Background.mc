using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;

class Background extends WatchUi.Drawable {

    function initialize() {
        Drawable.initialize({ :identifier => "Background" });
    }

    function draw(dc) {
        drawBackground(dc);
        drawActivityBackground(dc);
    }
    
    function drawBackground(dc) {
        dc.setColor(Graphics.COLOR_TRANSPARENT, $.colorBackground);
        dc.clear();
    }
    
    function drawActivityBackground(dc) {
        dc.setColor($.colorMain, Graphics.COLOR_TRANSPARENT);
        dc.fillPolygon([
            [0, 30],
            [$.SCREEN_WIDTH, 30],
            [$.SCREEN_WIDTH, 75],
            [0, 75]
        ]);
        
        dc.fillPolygon([
            [0, 179],
            [$.SCREEN_WIDTH, 179],
            [$.SCREEN_WIDTH, $.SCREEN_HEIGHT - 34],
            [0, $.SCREEN_HEIGHT - 34]
        ]);
    }
}
