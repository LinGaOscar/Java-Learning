package com.oscar.tryncatch;

public class MustError {

	public static void main(String[] args) {
		String[] greetings = { "Hello", "Hi! ", "greeting" };

		try {
			for (int i = 0; i <= greetings.length; i++) {
				System.out.println(greetings[i]);
			}
//		} catch (ArrayIndexOutOfBoundsException e) {
//			System.out.println("ArrayIndexOutOfBoundsException happened!");
		} catch (Exception e) {
			System.out.println("e" + e);
		} finally {
			System.out.println("Always printed");
		}
		System.out.println("Program end!");

	}
}
