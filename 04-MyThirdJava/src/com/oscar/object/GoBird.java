package com.oscar.object;

public class GoBird {

	public static void main(String[] args) {
		Chicken cc = new Chicken();
		cc.setColor("red");
		cc.eat();
		cc.move();
		cc.cockCrow();
		cc.showDetial();
		
		System.out.println("");
		
		Eagle ee = new Eagle("yellow");
		ee.move();

	}

}
