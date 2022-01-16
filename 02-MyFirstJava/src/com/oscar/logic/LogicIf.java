package com.oscar.logic;

public class LogicIf {

	public static void main(String[] args) {
		int score = 90;

		if (score < 60) {
			System.out.println("Fail");
		} else {
//			if (score <= 80) {
//				System.out.println("not bad");
//			} else {
//				System.out.println("Great");
//			}
			System.out.println("Passed");
		}
		System.out.println("end");
	}

}
