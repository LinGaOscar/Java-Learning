package com.oscar.abstra;

public class BBrandCar extends AbstractCar {

	@Override
	public void start() {
		System.out.println("B brand new car run with " + wheelNumber + " wheel");
	}

}