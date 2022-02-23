package com.oscar.abstra;

public class ABrandCar extends AbstractCar {

	@Override
	public void start() {
		System.out.println("A brand new car run with " + wheelNumber + " wheel");
	}

}