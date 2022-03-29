package com.oscar.homework;

public class GoExam {
	public static void main(String[] args) {
		LittleExam little = new LittleExam();
		little.setStudent("Oscar");
		little.examSet("1+1=?", "2");
		
		little.setResponse("2");
		little.examCheck();
		System.out.println(little.toString());
		
		little.setResponse("5");
		little.examCheck();
		System.out.println(little.toString());
	}
}
