package edu.pku.course_schedule.controller;

public class forAdminshow {

	private String title;
	private String start;
	private String end;
	private String color;

	public forAdminshow(String title, String start, String end, String color) {
		this.title = title;
		this.start = start;
		this.end = end;
		this.color = color;
	}

	@Override
	public String toString() {
		return "{" + 
				"title:" + "\'" + title + "\', " + 
				"start:" + "\'" + start + "\', " + 
				"end:" + "\'" + end + "\', " + 
				"color:" + "\'" + color + "\'" + 
				"}";
	}

}
