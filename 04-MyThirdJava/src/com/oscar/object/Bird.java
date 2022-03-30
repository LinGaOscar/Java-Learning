package com.oscar.object;

public class Bird extends AbstraBird implements InterfaceAnimal {

	@Override
	public void eat() {
		System.out.println("eating");
	}

	@Override
	public void fly() {
		System.out.println("flying");
	}

	@Override
	public void move() {
		System.out.println("moving , try to fly.");
		this.fly();
	}

	public void showDetial() {
		System.out.println(this.intro);
	}

}
