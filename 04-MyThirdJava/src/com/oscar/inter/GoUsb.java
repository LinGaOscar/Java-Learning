package com.oscar.inter;


public class GoUsb {

	public static void main(String[] args) {
		// Usb usb1 = new Usb(); //不能實體化
		Mouse port1 = new Mouse();
		port1.plugin();
		port1.unplug();
		
		Keyboard port2 = new Keyboard();
		port2.plugin();
		port2.unplug();
	}

}
