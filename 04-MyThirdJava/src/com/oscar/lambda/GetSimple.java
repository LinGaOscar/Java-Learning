package com.oscar.lambda;

public class GetSimple {

	public static void main(String[] args) {
		// Reference object class
		// Runnable is Interface
		Runnable runnable = new Runnable() {
			public void run() {
				System.out.print("run");
			}
		};
		
		
//		Lambda way
//		Runnable runnable = () ->System.out.println("run");
		
		
		runnable.run();
	}

}
