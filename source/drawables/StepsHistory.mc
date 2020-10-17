using Toybox.ActivityMonitor;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class StepsHistory extends Ui.Drawable {

	const MAX_BARS = 8;
	const BAR_HEIGHT = 30;
	const BAR_WIDTH = 15;
	const PADDING = 5;
	
	var _x, _y;
	
	function initialize() {
		Drawable.initialize({ :identifier => "StepsHistory" });
		
		_x = 104 - 16;
		_y = 65 - 20;
	}

	function draw(dc) {
		var topSteps = getTopSteps();		
        drawTodayBar(dc, topSteps);
		drawHistoryBars(dc, topSteps);
        drawDays(dc);
	}
	
	function getTopSteps() {
		// Calculates number of steps represented by the top of the bars		
		var history = ActivityMonitor.getHistory();
		var activity = ActivityMonitor.getInfo();
		
		var topSteps = 0;
		
		if (history != null) {
			for (var i = 0; i < history.size(); i += 1) {
				if (history[i].steps != null) {
					topSteps = history[i].steps > topSteps ? history[i].steps : topSteps;
					topSteps = history[i].stepGoal > topSteps ? history[i].stepGoal : topSteps;
				}	
			}
		}
				
		topSteps = activity.steps > topSteps ? activity.steps : topSteps;
		topSteps = activity.stepGoal > topSteps ? activity.stepGoal : topSteps;		
		return topSteps;
	}

    function drawTodayBar(dc, topSteps) {
        var x = _x, y = _y;
    
        var activity = ActivityMonitor.getInfo();
        
        // Goal bar
        dc.setColor($.colorStepsGoal, Graphics.COLOR_TRANSPARENT);
        var goalHeight = BAR_HEIGHT * activity.stepGoal / topSteps;
        dc.fillRectangle(x + 2, y + BAR_HEIGHT - goalHeight, BAR_WIDTH - 2, goalHeight);

        // Bar
        dc.setColor($.colorBackground, Graphics.COLOR_TRANSPARENT);
        var stepHeight = BAR_HEIGHT * activity.steps / topSteps;
        dc.fillRectangle(x, y + BAR_HEIGHT - stepHeight, BAR_WIDTH - 2, stepHeight);
    }
    	
	function drawHistoryBars(dc, topSteps) {	
		var x = _x + PADDING + BAR_WIDTH, y = _y;
	
		var history = ActivityMonitor.getHistory();
		if (history == null) {
			return;
		}
		
		var size = MAX_BARS - 1;
		size = history.size() < size ? history.size() : size;

		dc.setPenWidth(2);
		for (var i = 0, barX = x ; i < size; i += 1, barX += BAR_WIDTH + PADDING) {
			if (history[i] != null) {
				if (history[i].steps != null) {		
					
					// Goal bar
                    dc.setColor($.colorStepsGoal, Graphics.COLOR_TRANSPARENT);
					var goalHeight = BAR_HEIGHT * history[i].stepGoal / topSteps;
					dc.fillRectangle(barX + 2, y + BAR_HEIGHT - goalHeight, BAR_WIDTH - 2, goalHeight);
					
					// Bar
					dc.setColor($.colorBackground, Graphics.COLOR_TRANSPARENT);
                    var stepHeight = BAR_HEIGHT * history[i].steps / topSteps; 
        			dc.fillRectangle(barX, y + BAR_HEIGHT - stepHeight, BAR_WIDTH - 2, stepHeight);		        			
				}
			}
		}
	}
	
    function drawDays(dc) {
        var x = _x + BAR_WIDTH / 2, y = _y + BAR_HEIGHT - 1;
        
        var now = Time.now();

        dc.setColor($.colorMain, Graphics.COLOR_TRANSPARENT);
        
        for (var i = 0, textX = x; i < MAX_BARS; i += 1, textX += BAR_WIDTH + PADDING) {
            
            var time = now.subtract(new Time.Duration(60 * 60 * 24 * i));
            var date = Gregorian.info(time, Time.FORMAT_LONG);  
                        
            dc.drawText(textX, y, $.fontXTiny, date.day.format("%02d"), Graphics.TEXT_JUSTIFY_CENTER);
        }
    }	
}