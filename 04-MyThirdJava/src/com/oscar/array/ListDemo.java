package com.oscar.array;

import java.util.ArrayList;
import java.util.List;

public class ListDemo {

	public static void main(String[] args) {
		List<Integer> list = new ArrayList<>();
		list.add(12);
		list.add(34);
		list.add(5);
//		list.add(3.14);   //show error with double
		list.add(26); 
		
		System.out.println(list);
//		list.clear();
		System.out.println(list.size());
		System.out.println(list.get(0));
		System.out.println("===============");
		
		
//		
//		int sum =0;
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i));
//			sum+=list.get(i);
//		}
//		System.out.println(sum);
//		System.out.println("===============");
//		for (Integer i : list) {
//			System.out.println(i);
//		}
	}

}
