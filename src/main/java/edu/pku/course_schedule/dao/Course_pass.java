package edu.pku.course_schedule.dao;

import java.sql.Date;

public class Course_pass {
	
	private int course_ID; // pk
	
	private String student_ID; // fk
	
	private String teacher_ID; // fk
	
	private Date course_time; // 上课时间
	
	private Date rest_time; // 下课时间
	
	private int satification; // 学生满意度，满分为5，默认为5
	
	private String evaluate; // 教师评价，255字以内文档，默认为空

	
	
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
