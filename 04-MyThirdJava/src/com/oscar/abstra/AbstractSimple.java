package com.oscar.abstra;

public class AbstractSimple {
	abstract class Animal {
		abstract void run();
	}

	class Dog extends Animal {
		@Override
		public void run() {
			System.out.println("run");
		}
	}

	class Bird extends Animal {
		@Override
		public void run() {
			System.out.println("fly");
		}
	}
}
