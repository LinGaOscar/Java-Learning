package com.oscar.array;

import java.util.HashMap;
import java.util.Map;

public class MapDemo {

	public static void main(String[] args) {
		//Map<key, value> 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num",123);
		map.put("String", "done");
		map.put("String", "done");
		map.put("part1", 0.12332);
		map.put("part2", true);
		
		System.out.println(map);
		System.out.println(map.isEmpty());
		System.out.println(map.size());
		System.out.println(map.keySet());
		System.out.println(map.values());
		System.out.println(map.entrySet());
		
	}

}
