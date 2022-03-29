package com.oscar.homework;

public class LittleExam extends Exam {
	private String Student;

	public String getStudent() {
		return Student;
	}

	public void setStudent(String student) {
		Student = student;
	}

	@Override
	public String toString() {
		return "LittleExam 學生: " + Student + "\n 是否及格: " + examCheck();
	}

}
