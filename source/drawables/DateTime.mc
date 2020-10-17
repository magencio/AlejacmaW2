using Toybox.Lang;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class DateTime extends Ui.Drawable {

    var _y;

    function initialize() {
        Drawable.initialize({ :identifier => "DateTime" });
        
        _y = 101;
    }
    
    function draw(dc) {
        
        drawTime(dc);
        drawDate(dc);
        drawAlarm(dc);
    }
      
    function drawTime(dc) {
        var x = $.SCREEN_WIDTH / 2, y = _y;

        var clockTime = System.getClockTime();
        var is24Hour = System.getDeviceSettings().is24Hour;

        var hours = clockTime.hour;
        hours = !is24Hour && hours > 12 ? hours - 12 : hours; 
        var time = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        
        dc.setColor($.colorMain, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.fontNumberHot, time, Graphics.TEXT_JUSTIFY_CENTER);
        
        if (!is24Hour) {
            var text = clockTime.hour > 12 ? "PM" : "AM";
            var timeWidth = dc.getTextWidthInPixels(time, $.fontNumberHot);
            dc.drawText(x + timeWidth / 2 + 2, y + 62, $.fontXTiny, text, Graphics.TEXT_JUSTIFY_LEFT);
        }
    } 
      
    function drawDate(dc) {
        var x = 14, y = _y + 62;

        var date = Gregorian.info(Time.now(), Time.FORMAT_LONG);
        var day = date.day_of_week.toUpper();
        
        dc.setColor($.colorMain, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.fontXTiny, day, Graphics.TEXT_JUSTIFY_LEFT);      
    }
      
    function drawAlarm(dc) {    
        var x = 266, y = _y + 23;
          
        var color = System.getDeviceSettings().alarmCount > 0 ? $.colorMain: $.colorBackground;
        
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, $.fontIcons, $.ICON_ALARM, Graphics.TEXT_JUSTIFY_RIGHT);
    }
}