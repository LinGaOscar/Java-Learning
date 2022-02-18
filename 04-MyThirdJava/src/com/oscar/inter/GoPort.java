package com.oscar.inter;

public class GoPort {

	public static void main(String[] args) {
		// Usb usb1 = new Usb(); //不能實體化
		Port port1 = new Port();
		port1.plugin();
		port1.unplug();
	}

}
