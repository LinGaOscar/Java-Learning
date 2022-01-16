package com.oscar.logic;

public class LogicWhile {

	public static void main(String[] args) {

		int number;

		// Math.random() return a double in 0 < 1.0

		while (true) {
			number = (int) (Math.random() * 10);
			System.out.println(number);
			if (number == 5) {
				break;
			}
		}
		System.out.println("I got the 5");

		// do {
		// number = (int) (Math.random() * 10);
		// System.out.println(number);
		// } while (number != 5);
		// System.out.println("I got the 5");

	}

}
