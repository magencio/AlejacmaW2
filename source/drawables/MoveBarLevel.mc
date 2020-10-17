using Toybox.ActivityMonitor;
using Toybox.WatchUi as Ui;

class MoveBarLevel extends Ui.Drawable {

	const MAX_BARS = 5;
	
	function initialize() {
		Drawable.initialize({ :identifier => "MoveBarLevel" });
	}
	
	function draw(dc) {
		var x = 200, y = 198, padding = 2;

		var moveBarLevel = ActivityMonitor.getInfo().moveBarLevel;
		var moveReference = ActivityMonitor.MOVE_BAR_LEVEL_MAX - ActivityMonitor.MOVE_BAR_LEVEL_MIN;
		moveBarLevel = (moveBarLevel - ActivityMonitor.MOVE_BAR_LEVEL_MIN) * MAX_BARS / moveReference;
		
		dc.setColor(moveBarLevel == MAX_BARS ? $.colorMoveBarActive : $.colorMoveBarInactive, Graphics.COLOR_TRANSPARENT);
        var barX = x + 52;
		var height = 4;
		dc.fillPolygon([
			[barX, y],
			[$.SCREEN_WIDTH, y],
			[$.SCREEN_WIDTH, y + height],
			[barX, y + height],
        ]);
        
		dc.setColor(moveBarLevel >= 4 ? $.colorMoveBarActive : $.colorMoveBarInactive, Graphics.COLOR_TRANSPARENT);
		barX = x + 42;
		y = y + height + padding;
		height = height + 1;
        dc.fillPolygon([
            [barX, y],
            [$.SCREEN_WIDTH, y],
            [$.SCREEN_WIDTH, y + height],
            [barX, y + height],
        ]);

		dc.setColor(moveBarLevel >= 3 ? $.colorMoveBarActive : $.colorMoveBarInactive, Graphics.COLOR_TRANSPARENT);
        barX = x + 30;
		y = y + height + padding;
		height = height + 2;		
        dc.fillPolygon([
            [barX, y],
            [$.SCREEN_WIDTH, y],
            [$.SCREEN_WIDTH, y + height],
            [barX, y + height],
        ]);

		dc.setColor(moveBarLevel >= 2 ? $.colorMoveBarActive : $.colorMoveBarInactive, Graphics.COLOR_TRANSPARENT);
        barX = x + 15;
		y = y + height + padding;
		height = height + 3;		
        dc.fillPolygon([
            [barX, y],
            [$.SCREEN_WIDTH, y],
            [$.SCREEN_WIDTH, y + height],
            [barX, y + height],
        ]);

		dc.setColor(moveBarLevel >= 1 ? $.colorMoveBarActive : $.colorMoveBarInactive, Graphics.COLOR_TRANSPARENT);
        barX = x;
		y = y + height + padding;
		height = height + 4;		
        dc.fillPolygon([
            [barX, y],
            [$.SCREEN_WIDTH, y],
            [$.SCREEN_WIDTH, y + height],
            [barX, y + height],
        ]);
	}
}