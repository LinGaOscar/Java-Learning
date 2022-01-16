package com.oscar.logic;

public class BreakAndContinue {

	public static void main(String[] args) {
		for (int i = 0; i < 10; i++) {
			if (i == 3) {
				break;
			}
			System.out.print(i + "\t");
		}
		System.out.println("==============");
		for (int i = 0; i < 10; i++) {
			if (i % 2 == 0) {
				continue;
			}
			System.out.print(i + "\t");
		}
	}

}
