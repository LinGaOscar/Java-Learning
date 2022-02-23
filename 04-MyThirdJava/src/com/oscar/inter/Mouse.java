package com.oscar.inter;

public class Mouse implements InterfaceUsb {
	@Override
	public void plugin() {
		System.out.println("Mouse ON");
	}

	@Override
	public void unplug() {
		System.out.println("Mouse OFF");
	}
}
