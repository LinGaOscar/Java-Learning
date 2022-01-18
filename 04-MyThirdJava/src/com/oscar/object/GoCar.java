package com.oscar.object;

import static java.lang.System.out; //import static member

public class GoCar {

	public static void main(String[] args) {
		Benz benz = new Benz();
		benz.setName("GLE");
		BMW bmw = new BMW();
		bmw.setName("X3");

		print(benz.toString());
		print(bmw.toString());

		benz.start();
		bmw.start();

		print(benz.toString());
		print(bmw.toString());

		print(benz.quickSpeedUp());
		print(bmw.autoBreak());

	}
	
	static void print(String string) {
		out.println(string);
		out.println("===============");
	}

}
