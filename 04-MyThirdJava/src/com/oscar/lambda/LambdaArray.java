package com.oscar.lambda;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class LambdaArray {

	public static void main(String[] args) {
		//Generics
		List list = new ArrayList();
		list.add("Hello");
		list.add("World");
		list.add("We Love Java");

//		for (Object i : list) {
//			System.out.println(i);
//		}

		list.forEach(i -> System.out.println(i));

		Map map = new HashMap<>();
		map.put("map1", 1111);
		map.put("map2", "WE fix BUGS");
		map.put("map3", "WE produce BUG");

//		Set<String>keySey =map.keySet();
//		for (String key : keySey) {
//			System.out.println(map.get(key));
//		}

		map.forEach((k, v) -> System.out.println(k + " : " + v));
	}

}
