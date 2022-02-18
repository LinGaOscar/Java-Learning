package com.oscar.object;

public abstract class AbstraBird {

	private String color;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public abstract void fly();
}
