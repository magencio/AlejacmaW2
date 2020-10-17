using Toybox.Graphics;
using Toybox.WatchUi as Ui;

var fontXTiny, fontTiny, fontSmall, fontMedium, fontLarge;
var fontNumberMild, fontNumberMedium, fontNumberHot, fontNumberThaiHot; 
var fontIcons; 

function loadResources() {
    $.fontXTiny = Graphics.FONT_XTINY;                      // 19
    $.fontTiny = Graphics.FONT_TINY;                        // 30
    $.fontSmall = Graphics.FONT_SMALL;                      // 34
    $.fontMedium = Graphics.FONT_MEDIUM;                    // 39
    $.fontLarge = Graphics.FONT_LARGE;                      // 43
    $.fontNumberMild = Graphics.FONT_NUMBER_MILD;           // 64
    $.fontNumberMedium = Graphics.FONT_NUMBER_MEDIUM;       // 78
    $.fontNumberHot = Graphics.FONT_NUMBER_HOT;             // 107
    $.fontNumberThaiHot = Graphics.FONT_NUMBER_THAI_HOT;    // 122
    $.fontIcons = Ui.loadResource(Rez.Fonts.IconsFont);
}
