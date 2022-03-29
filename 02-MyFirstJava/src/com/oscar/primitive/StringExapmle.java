package com.oscar.primitive;

public class StringExapmle {

	public static void main(String[] args) {
		// String class type
		char data[] = { 'a', 'b', 'c' };
		String str = new String(data);
		System.out.println(str);

		String s1 = "123";
		String s2 = "Hello World";
		String s3 = "你好";

		System.out.println(s1.length());
		System.out.println(s2.equals(s3));
		System.out.println(s2.toUpperCase());
	}

}
