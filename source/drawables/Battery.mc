using Toybox.System;
using Toybox.WatchUi as Ui;

class Battery extends Ui.Drawable {

	function initialize() {
		Drawable.initialize({ :identifier => "Battery" });
	}
	
	function draw(dc) {	
		drawIcon(dc);
		drawBattery(dc);
	}
	
	function drawIcon(dc) {
		var x = 140, y = 7;
		
		dc.setColor($.colorMain, Graphics.COLOR_TRANSPARENT);
		dc.fillPolygon([
			[x - 13, y + 1],
			[x - 12, y + 0],
			[x + 12, y + 0],
			[x + 13, y + 1],
			[x + 13, y + 3],
            [x + 15, y + 3],
			[x + 16, y + 4],
			[x + 16, y + 10],
            [x + 15, y + 11],
			[x + 13, y + 11],
			[x + 13, y + 13],
			[x + 12, y + 14],
			[x - 12, y + 14],
			[x - 13, y + 13]]);		
	}
	
	function drawBattery(dc) {
		var x = 140, y = 4;
		
		var battery = System.getSystemStats().battery;
		battery = battery.format("%d");
		
    	dc.setColor($.colorBackground, Graphics.COLOR_TRANSPARENT);
	    dc.drawText(x, y, $.fontXTiny, battery, Graphics.TEXT_JUSTIFY_CENTER);	
	}
}