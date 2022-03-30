package com.oscar.object;

public class GoBird {

	public static void main(String[] args) {

		Bird bird = new Bird();
		bird.eat();
		bird.move();
		bird.fly();
		bird.showDetial();

		System.out.println();

		Chicken checken = new Chicken();
		checken.eat();
		checken.move();
		checken.fly();
		checken.cockCrow();
		checken.showDetial();
	}

}
