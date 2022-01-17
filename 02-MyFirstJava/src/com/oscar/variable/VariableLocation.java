package com.oscar.variable;

public class VariableLocation {
	static int a =123;
	public static void main(String[] args) {
		int b =567;
		checker();
	}
	//create function
	static void checker() {
		System.out.println(a);
		// System.out.println(b);
	}
}
