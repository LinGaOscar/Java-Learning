package com.oscar.inheritance;

public class GoDog {

	public static void main(String[] args) {
		Animal animal = new Animal();
		animal.run();
		System.out.println();
		
		Dog dog1 = new Dog();
		dog1.bark();
		dog1.run();
		System.out.println();
	}
}
