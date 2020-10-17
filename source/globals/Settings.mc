using Toybox.Application;

var colorBackground;
var colorMain;
var colorStepsGoal;
var colorMoveBarActive;
var colorMoveBarInactive;

function updateSettings() {
    $.colorBackground = Application.getApp().getProperty("ColorBackground");
    $.colorMain = Application.getApp().getProperty("ColorMain");  
    $.colorStepsGoal = Application.getApp().getProperty("ColorStepsGoal");
    $.colorMoveBarActive = Application.getApp().getProperty("ColorMoveBarActive");
    $.colorMoveBarInactive = Application.getApp().getProperty("ColorMoveBarInactive");
}