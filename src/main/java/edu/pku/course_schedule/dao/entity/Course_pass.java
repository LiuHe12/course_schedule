package edu.pku.course_schedule.dao.entity;

import java.sql.Date;

public class Course_pass {
	
	private int course_ID; // pk
	
	private String student_ID; // fk
	
	private String teacher_ID; // fk
	
	private Date course_time; // ä¸Šè¯¾þý¶é—´
	
	private Date rest_time; // ä¸‹è¯¾þý¶é—´
	
	private int satification; // å­¦çþýæ»¡æþýåº¦ïþýæ»¡åþýä¸þýï¼Œéþýè®¤ä¸º5
	
	private String evaluate; // þý™åþýè¯„ä»·ï¼þý55å­—ä»¥þý…æþýæ¡þýþýé»˜è®¤ä¸ºç©º

	
	
	/**********Getter and Setter**********/
	
	public int getCourse_ID() {
		return course_ID;
	}

	public void setCourse_ID(int course_ID) {
		this.course_ID = course_ID;
	}

	public String getStudent_ID() {
		return student_ID;
	}

	public void setStudent_ID(String student_ID) {
		this.student_ID = student_ID;
	}

	public String getTeacher_ID() {
		return teacher_ID;
	}

	public void setTeacher_ID(String teacher_ID) {
		this.teacher_ID = teacher_ID;
	}

	public Date getCourse_time() {
		return course_time;
	}

	public void setCourse_time(Date course_time) {
		this.course_time = course_time;
	}

	public Date getRest_time() {
		return rest_time;
	}

	public void setRest_time(Date rest_time) {
		this.rest_time = rest_time;
	}

	public int getSatification() {
		return satification;
	}

	public void setSatification(int satification) {
		this.satification = satification;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	

}
