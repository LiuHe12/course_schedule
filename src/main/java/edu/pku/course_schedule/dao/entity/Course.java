package edu.pku.course_schedule.dao.entity;

import java.sql.Date;

public class Course {
	
	
	private String course_ID; // pk
	
	private String student_ID;// fk
	
	private String teacher_ID;// fk
	
	private Date time; 
	
	private Date rest_time;
	
	private String name; 
	
	private int satisfaction;
	
	private String evaluate;
	
	private int price;
	
	private int status;
	
	
	
	
	/**********Getter and Setter**********/

	public String getCourse_ID() {
		return course_ID;
	}

	public void setCourse_ID(String course_ID) {
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

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Date getRest_time() {
		return rest_time;
	}

	public void setRest_time(Date rest_time) {
		this.rest_time = rest_time;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSatisfaction() {
		return satisfaction;
	}

	public void setSatisfaction(int satisfaction) {
		this.satisfaction = satisfaction;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		if(evaluate!=null)
			this.evaluate = evaluate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
