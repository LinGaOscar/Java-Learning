package com.oscar.encapsulation;

public class GoCar {

	public static void main(String[] args) {
		Car car1 = new Car();
		car1.setName("GLE-SUV");
		car1.upSpeed();
		System.out.println(car1.toString());
		car1.upSpeed();
		car1.upSpeed();
		System.out.println(car1.toString());
		car1.downSpeed();
		car1.downSpeed();
		System.out.println(car1.toString());
	}

}
