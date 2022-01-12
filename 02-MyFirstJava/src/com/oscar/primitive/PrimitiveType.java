package com.oscar.primitive;

public class PrimitiveType {

	public static void main(String[] args) {
		// byte, short, int ,long
		int numInt = 123456; // -2147483648 to +2147483647
		short numShort = 32767; // -32768 to +32767
		long numLong = 888888888888L; // -9223372036854775808 to +9223372036854775807
		byte numByte = 127; // -128 to +127
		System.out.println(numInt);
		System.out.println("numShort add numLong : " + numShort + numLong);
		System.out.println("numByte add numInt : " + numByte + numInt);

		// float, double
		float f = 3.12546f; // -3.40292347E+38 to +3.40292347E+38
		double dou = 12.242; // -1.7976931348623157E+308 to +1.7976931348623157E+308
		System.out.println(f);
		System.out.println("float add double : " + f + dou);

		// boolean
		boolean boo = true;
		System.out.println("boolean boo : " + boo);

		// char Unicode
		char var1 = '\u6211';
		char var2 = '\u6145';
		System.out.println("var1 : " + var1);
		System.out.println("var2 : " + var2);
	}

}
