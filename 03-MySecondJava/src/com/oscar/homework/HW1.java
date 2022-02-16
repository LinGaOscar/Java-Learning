package com.oscar.homework;

public class HW1 {
	private long id;
	private String questName;
	private String questAnswer;
	private boolean questCheck;

	//利用大考小考概念作出封裝繼承多型的練習
	public void hwSet(long id, String name, String answer) {
		this.id = id;
		this.questAnswer = answer;
		this.questName = name;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getQuestName() {
		return questName;
	}

	public void setQuestName(String questName) {
		this.questName = questName;
	}

	public String getQuestAnswer() {
		return questAnswer;
	}

	public void setQuestAnswer(String questAnswer) {
		this.questAnswer = questAnswer;
	}

	public boolean isQuestCheck() {
		return questCheck;
	}

	public void setQuestCheck(boolean questCheck) {
		this.questCheck = questCheck;
	}

}
