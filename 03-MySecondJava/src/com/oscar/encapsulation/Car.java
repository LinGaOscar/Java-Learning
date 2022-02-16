package com.oscar.encapsulation;

public class Car {

	private String name;
	private double speed;
	//alt + Shift + s
	@Override
	public String toString() {
		return "Car [name=" + name + ", speed=" + speed + "]";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public void upSpeed() {
		speed = speed < 1 ? 1 : speed * 1.2;
	}
	public void downSpeed() {
		speed = speed < 1 ? 0 : speed * 0.8;
	}
	
	
}
