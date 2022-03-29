package com.oscar.variable;

public class ClassObject {
    String name = "Oscar";
    String lastName = "Lin";
    int height = 200;
    public static void main(String[] args) {
        ClassObject me1 = new ClassObject();
        System.out.println(me1.name +"\t"+ me1.lastName);
        me1.height= 180;
        System.out.println(me1.height);
    }
}
