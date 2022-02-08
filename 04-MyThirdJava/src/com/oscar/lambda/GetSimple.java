package com.oscar.lambda;

public class GetSimple {

	interface MathFactory {
		int bump(int x, int y);
	}

	public static void main(String[] args) {
		// Reference object class
		// Runnable is Interface
		Runnable runnable = new Runnable() {
			public void run() {
				System.out.println("run");
			}
		};

//		Lambda way
//		Runnable runnable = () -> System.out.println("run");

		runnable.run();

		MathFactory ma1 = (x, y) -> x + y;
		System.out.println(ma1.bump(1, 9));

	}

}
