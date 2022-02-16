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

	@Override
	public void speedUp() {
		if (this.getSpeed() > 0) {
			this.setSpeed(getSpeed()*1.5);
			System.out.println("BMW function boost!");
		} else {
			this.setSpeed(20);
			System.out.println("BMW Start!");
		}
	}

	public void showDetial() {
		System.out.println(this.toString());
	}

}
