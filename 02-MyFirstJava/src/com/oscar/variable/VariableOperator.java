package com.oscar.variable;

public class VariableOperator {

	public static void main(String[] args) {
		long a = 10;
		long b = 3;
		//算術運算子 arithmetic operator
		System.out.println("a + b =" + (a + b));
		System.out.println("a - b =" + (a - b));
		System.out.println("a * b =" + (a * b));
		System.out.println("a / b =" + (a / b));
		System.out.println("a % b =" + (a % b));
		//相等性及關係運算子 equality and Relational Operator
		System.out.println("a == b :" + (a == b));
		System.out.println("a != b :" + (a != b));
		System.out.println("a >= b :" + (a >= b));
		System.out.println("a <= b :" + (a <= b));
		
		boolean boo = true;
		boolean foo = false;
		//條件運算子 conditional operator
		System.out.println("boo && foo : " + (boo && foo));
		System.out.println("boo || foo : " + (boo || foo));
		System.out.println("boo ?true:false : " + (boo ? "asd":"zxc"));
	}

}
