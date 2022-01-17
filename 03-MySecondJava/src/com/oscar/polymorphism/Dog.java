package com.oscar.polymorphism;

public class Dog extends Animal{

	public void bark() {
		System.out.println("Dog is bark");
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("Dog is running");
	}

}
