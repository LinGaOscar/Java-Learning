package com.oscar.object;

public class Car {
	private String name;
	private double speed;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getSpeed() {
		return speed;
	}

	public void setSpeed(double speed) {
		this.speed = speed;
	}

	public void speedUp() {
		if (speed > 0) {
			this.speed = speed * 1.1;
			System.out.println("Engine boost!");
		} else {
			this.speed = 10;
			System.out.println("Engine Start!");
		}
	}

	public String toString() {
		return "Car [name=" + name + ", speed=" + speed + "]";
	}

}
