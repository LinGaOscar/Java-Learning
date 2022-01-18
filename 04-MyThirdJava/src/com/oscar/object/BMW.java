package com.oscar.object;

public class BMW extends Car {

	public String autoBreak() {
		this.setSpeed(0);
		return this.getName() + " is stopped" + this.getSpeed();
	}

	@Override
	public String toString() {
		return "BMW :" + this.getName() + " speed :" + this.getSpeed() + "\n I have autoBreak function.";
	}

}
