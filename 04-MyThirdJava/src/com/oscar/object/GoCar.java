package com.oscar.object;

public class GoCar {

	public static void main(String[] args) {
		BMW bmw = new BMW();
		bmw.setModel("X3");
		bmw.showDetial();
		bmw.turboX();
		bmw.showDetial();
		bmw.turboX(4);
		bmw.showDetial();
	}
}
