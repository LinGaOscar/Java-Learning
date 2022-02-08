package com.oscar.object;

public class BMW extends Car {

	public void setModel(String model) {
		this.setName("BMW " + model);
	}

	public void turboX() {
		this.speedUp();
		this.speedUp();
	}

	public void turboX(int time) {
		for (int i = 0; i < time; i++) {
			this.speedUp();
		}
	}

	public void showDetial() {
		System.out.println(this.toString());
	}

}
