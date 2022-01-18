package com.oscar.array;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class SetDemo {

	public static void main(String[] args) {
		Set set = new HashSet(); // raw type can be any type but easy easy to get error when u try to process
		set.add(12);
		set.add(6.8);
		set.add("Hello");
//		set.add(12); // duplicate, is not added
		set.add(null);
		

		System.out.println(set);
		System.out.println(set.size());

		Iterator itera = set.iterator();

		while (itera.hasNext()) {
			Object object = itera.next();
			System.out.println(object);
		}
	}

}
