package com.oscar.variable;

public class ClassObject {
    String name = "Oscar";
    String lastName = "Lin";
    String gender = "male";
    int height = 200;
    double weight = 100.58;
    public static void main(String[] args) {
        ClassObject me1 = new ClassObject();
        System.out.println(me1.name +"\t"+ me1.lastName);
        me1.height= 180;
        System.out.println(me1.height);
    }
}
