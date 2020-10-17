using Toybox.Activity;
using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class HeartRate extends Ui.Drawable {

    var _y;
    
	function initialize() {
		Drawable.initialize({ :identifier => "HeartRate" });
		
		_y = 188;
	}
	
	function draw(dc) {
		drawTitle(dc);
		drawHeartRate(dc);
	}
	
	function drawTitle(dc) {
		var x = 74, y = _y + 24;
		
		var title = Ui.loadResource(Rez.Strings.TitleHeartRate);
		
		dc.setColor($.colorBackground, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontXTiny, title, Graphics.TEXT_JUSTIFY_CENTER);

		dc.drawText(x, y + 16, $.fontIcons, $.ICON_HEART, Graphics.TEXT_JUSTIFY_CENTER);			
	}
	
	function drawHeartRate(dc) {
		var x = $.SCREEN_WIDTH / 2, y = _y;
		
		var heartRate = Activity.getActivityInfo().currentHeartRate;
		if (heartRate == null) {		
			if(ActivityMonitor has :HeartRateIterator)
			{
				var iterator = ActivityMonitor.getHeartRateHistory(1, true);
	    		if (iterator != null) {
	    			var sample = iterator.next();
	    			if (sample.heartRate != ActivityMonitor.INVALID_HR_SAMPLE) {
						heartRate = sample.heartRate; 		
	    			}
				}
			}
		}
		
		heartRate = (heartRate != null) ? heartRate.format("%02d") : "--";
		
		dc.setColor($.colorBackground, Graphics.COLOR_TRANSPARENT);		
		dc.drawText(x, y, $.fontNumberMedium, heartRate, Graphics.TEXT_JUSTIFY_CENTER);	
	}
}