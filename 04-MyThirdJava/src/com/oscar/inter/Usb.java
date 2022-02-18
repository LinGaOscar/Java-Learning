package com.oscar.inter;

public interface Usb {

	public void plugin();

	public void unplug();
}

class Mouse implements Usb {

	@Override
	public void plugin() {
		System.out.println("Mouse ON");
	}

	@Override
	public void unplug() {
		System.out.println("Mouse OFF");
	}

}

class Keyboard implements Usb {

	@Override
	public void plugin() {
		System.out.println("Keyboard ON");

	}

	@Override
	public void unplug() {
		System.out.println("Keyboard OFF");

	}

}