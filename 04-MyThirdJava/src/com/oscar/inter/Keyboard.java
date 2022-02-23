package com.oscar.inter;

public class Keyboard implements InterfaceUsb {
	@Override
	public void plugin() {
		System.out.println("Keyboard ON");

	}

	@Override
	public void unplug() {
		System.out.println("Keyboard OFF");

	}
}
