using Toybox.WatchUi as Ui;

class Steps extends Ui.Drawable {
	
	function initialize() {
		Drawable.initialize({ :identifier => "Steps" });
	}
	
	function draw(dc) {
        var x = 96 - 16, y = 79 - 20;
        
        var steps = ActivityMonitor.getInfo().steps;
        steps = steps.format("%d");
        
        dc.setColor($.colorBackground, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.fontXTiny, steps, Graphics.TEXT_JUSTIFY_RIGHT);
        var textWidth = dc.getTextWidthInPixels(steps, $.fontXTiny);
        dc.drawText(x - textWidth - 5, y - 2, $.fontIcons, $.ICON_STEPS, Graphics.TEXT_JUSTIFY_RIGHT);
	}	
}