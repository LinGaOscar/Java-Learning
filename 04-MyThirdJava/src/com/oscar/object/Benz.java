package com.oscar.object;

public class Benz extends Car{
	public String quickSpeedUp() {
		this.setSpeed(100);
		return this.getName()+" boost speed "+ this.getSpeed();
	}
	
	@Override
	public String toString() {
		return "Benz :" + this.getName() +" Speed :" + this.getSpeed() +"\n I have quickSpeedUp function.";
	}
}
