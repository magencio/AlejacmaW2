using Toybox.System;
using Toybox.WatchUi as Ui;

class Connections extends Ui.Drawable {

    var _x, _y;
	
	function initialize() {
		Drawable.initialize({ :identifier => "Connections" });
		
		_x = 94;
		_y = 252;
	}
	
	function draw(dc) {
		drawPhoneConnected(dc);
		drawBluetoothEnabled(dc);
		drawWifiEnabled(dc);		
		drawDoNotDisturb(dc);
	}
	
	function drawPhoneConnected(dc) {
		var x = _x, y = _y;

		var phoneConnected = System.getDeviceSettings().phoneConnected;

		dc.setColor(phoneConnected ? $.colorMain : $.colorBackground, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_PHONE, Graphics.TEXT_JUSTIFY_CENTER);
	}
	
	function drawBluetoothEnabled(dc) {
		var x = _x + 13, y = _y;
		
		var bluetooth = System.getDeviceSettings().connectionInfo[:bluetooth];
		var bluetoothConnected = bluetooth != null && bluetooth.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(bluetoothConnected ? $.colorMain : $.colorBackground, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_BLUETOOTH, Graphics.TEXT_JUSTIFY_CENTER);	
	}
	
	function drawWifiEnabled(dc) {
		var x = _x + 28, y = _y;
		
		var wifi = System.getDeviceSettings().connectionInfo[:wifi];
		var wifiConnected = wifi != null && wifi.state == System.CONNECTION_STATE_CONNECTED;
		
		dc.setColor(wifiConnected ? $.colorMain : $.colorBackground, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_WIFI, Graphics.TEXT_JUSTIFY_CENTER);		
	}
	
	function drawDoNotDisturb(dc) {
		var x = _x + 46, y = _y;
		
		var doNotDisturb = System.getDeviceSettings().doNotDisturb;
		
		dc.setColor(!doNotDisturb ? $.colorMain : $.colorBackground, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, $.fontIcons, $.ICON_PEOPLE, Graphics.TEXT_JUSTIFY_CENTER);		
	}	
}