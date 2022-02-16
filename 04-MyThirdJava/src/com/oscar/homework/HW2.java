package com.oscar.homework;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class HW2 {

	public static void main(String[] args) {
		// make input form list to set and add Hello World
		String hello = " , nice to meet you ";
		List<String> list = new ArrayList<>();
		list.add("John");
		list.add("Linda");
		list.add("Ouuto");
		list.add("Aiden");
		list.add("John");
		list.add("Linda");
		List<String> nameList = list.stream().map(i -> i.toUpperCase() + hello).collect(Collectors.toList());

		for (String i : nameList) {
			System.out.println(i);
		}

//		Set<String> results = nameList.stream().collect(Collectors.toSet());
//		System.out.println(results);
	}

}
