package com.oscar.abstra;

public class GoCar {

	public static void main(String[] args) {
		ABrandCar aCar = new ABrandCar();
		aCar.start();
		BBrandCar bCar = new BBrandCar();
		bCar.start();
	}
}
