package com.oscar.object;

public class Chicken extends Bird {
	@Override
	public void showDetial() {
		System.out.println("Chicken is kind of " + this.intro);
	}

	public void cockCrow() {
		System.out.println("cock-crow cock-crow");
	}
}
