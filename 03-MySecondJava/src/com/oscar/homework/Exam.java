package com.oscar.homework;

public class Exam {
	private String question;
	private String response;
	private String answer;
	private boolean questionCheck = false;

	// 利用小考概念作出封裝繼承多型的練習
	public void examSet(String question, String answer) {
		this.answer = answer;
		this.question = question;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public boolean examCheck() {
		if (this.answer.equals(this.response)) {
			this.questionCheck = true;
			return true;
		} else {
			this.questionCheck = false;
			return false;
		}
	}
}
