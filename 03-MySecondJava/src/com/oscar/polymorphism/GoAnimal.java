package com.oscar.polymorphism;

public class GoAnimal {

	public static void main(String[] args) {
		Animal animal1 = new Animal();
		animal1.run();
		
		animal1 = new Wolf();
		animal1.run();
		
		animal1 = new Dog();
		animal1.run();
		((Dog) animal1).bark();
		
		System.out.println(animal1 instanceof Wolf);
		System.out.println(animal1 instanceof Dog);
		System.out.println(animal1 instanceof Animal);
	}

}
