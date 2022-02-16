package com.oscar.homework;

import java.util.Scanner;

public class HW1 {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		int answer = 15;
		System.out.println("guess start");

		// use try n catch to prevent crush that input isn't number
		while (true) {
			int input = s.nextInt();
			if (input == answer) {
				System.out.println("Well Done !");
				System.out.println("Good Game !");
				break;
			}
			if (input > answer) {
				System.out.println("too high");
			} else {
				System.out.println("too low");
			}
		}
		s.close();
	}

}
