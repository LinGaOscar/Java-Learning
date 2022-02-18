package com.oscar.abstra;

public abstract class AbstractCar {

	final int wheelNumber = 4;

	public abstract void start();

}

class ANewCar extends AbstractCar {

	@Override
	public void start() {
		System.out.println("A car run with " + wheelNumber + " wheel");
	}

}

class BNewCar extends AbstractCar {

	@Override
	public void start() {
		System.out.println("B car run with " + wheelNumber + " wheel");
	}

}