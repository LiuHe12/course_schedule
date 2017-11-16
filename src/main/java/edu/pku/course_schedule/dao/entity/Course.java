package edu.pku.course_schedule.dao.entity;

import java.sql.Date;

public class Course {
	
	
	private int course_ID; // pk
	
	private String student_ID;// fk
	
	private String teacher_ID;// fk
	
	private Date course_time; 
	
	private Date rest_time;
	
	private String course_name; 
	
	private int satification;
	
	private String evaluate;
	
	private int course_price;
	
	private int status;

	
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

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
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

	public int getCourse_price() {
		return course_price;
	}

	public void setCourse_price(int course_price) {
		this.course_price = course_price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	

}
