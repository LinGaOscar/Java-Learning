package com.oscar.logic;

public class LogicSwitch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int input = 2;
		switch (input) {
		case 1:
			System.out.println("input==1");
			break;
		case 2:
			System.out.println("input==2");
			break; 
		case 3:
			System.out.println("input==3");
			break;
		case 4:
			System.out.println("input==4");
			break;
		default:
			System.out.println(input);
		}
		System.out.println("switch end");
	}
}
