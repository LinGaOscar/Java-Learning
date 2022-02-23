package com.oscar.inter;


public class GoUsb {

	public static void main(String[] args) {
		// InterfaceUsb usb1 = new InterfaceUsb(); //不能實體化
		Mouse port1 = new Mouse();
		port1.plugin();
		port1.unplug();
		
		Keyboard port2 = new Keyboard();
		port2.plugin();
		port2.unplug();
	}

}
