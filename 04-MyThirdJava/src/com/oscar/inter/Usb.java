package com.oscar.inter;

public interface Usb {

	public void plugin();

	public void unplug();
}

class Port implements Usb {

	@Override
	public void plugin() {
		System.out.println("USB ON");
	}

	@Override
	public void unplug() {
		System.out.println("USB OFF");
	}
}