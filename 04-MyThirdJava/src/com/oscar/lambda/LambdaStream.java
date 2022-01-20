package com.oscar.lambda;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class LambdaStream {

	public static void main(String[] args) {
		List<String> nameList = new ArrayList<>();
		nameList.add("Oscar");
		nameList.add("John Wick");
		nameList.add("Edward Snowden");

		List<String> tempList = new ArrayList<>();
		for (String i : nameList) {
			tempList.add(i.toUpperCase());
		}
		nameList = tempList;
		System.out.println(nameList);

//		nameList = nameList.stream().map(i -> i.toUpperCase()).collect(Collectors.toList());
//		System.out.println(nameList);
	}

}
