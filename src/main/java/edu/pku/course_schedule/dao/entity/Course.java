package edu.pku.course_schedule.dao.entity;

import java.sql.Date;

public class Course {
	
	
	private int course_ID; // pk
	
	private String student_ID;// fk
	
	private String teacher_ID;// fk
	
	Date course_time; // 上课���间
	
	private int course_size; // 课时���度，������为������
	
	private int course_name; // 课������������为���说读������助����种������别���,2,3,4,5
	
	private int course_room; // 上课���室，���1�����编号

	
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

	public int getCourse_size() {
		return course_size;
	}

	public void setCourse_size(int course_size) {
		this.course_size = course_size;
	}

	public int getCourse_name() {
		return course_name;
	}

	public void setCourse_name(int course_name) {
		this.course_name = course_name;
	}

	public int getCourse_room() {
		return course_room;
	}

	public void setCourse_room(int course_room) {
		this.course_room = course_room;
	}

	

}
