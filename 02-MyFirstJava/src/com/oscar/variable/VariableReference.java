package com.oscar.variable;

public class VariableReference {

	public static void main(String[] args) {
		String str1 = "Hello";
		String str2 = "World";
		String str3 = "HelloWorld";
		String str4;

		str4 = str1 + str2;
		System.out.println(str3 == str4);

		str4 = (str1 + str2).intern(); // find string in spring pool and return
		System.out.println(str3 == str4);

		String str11 = "HelloWorld";
		String str12 = new String("HelloWorld");
		String str13 = "HelloWorld";
		System.out.println(str11 == str12); // different Reference in spring pool memory
		System.out.println(str11 == str13); // same Reference in spring pool memory
		System.out.println(str11.equals(str12)); // same value

	}

}
