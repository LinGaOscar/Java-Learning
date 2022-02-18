package com.oscar.object;

public class Chicken extends Bird {
	@Override
	public void showDetial() {
		System.out.println("Chicken color: " + this.getColor());
	}

	public void cockCrow() {
		System.out.println("cock-crow cock-crow");
	}
}
