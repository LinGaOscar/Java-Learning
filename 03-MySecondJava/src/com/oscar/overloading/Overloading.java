package com.oscar.overloading;

public class Overloading {

	static void greeting() {
		System.out.println("Hello !!");
	}

	static void greeting(String name) {
		System.out.println("Hello !! " + name + " !!");
	}

	static void greeting(String name, int num) {
		for (int i = 0; i < num; i++) {
			System.out.println("Hello !! " + name + ", you are great !!");
		}
	}

	static String greetingWorld(String name) {
		return name + ", I shall return!";
	}

	public static void main(String[] args) {
		greeting();
		greeting("Oscar");
		greeting("Java", 3);
		String greetingWorld = greetingWorld("ant-man");
		System.out.println(greetingWorld);
	}

}
