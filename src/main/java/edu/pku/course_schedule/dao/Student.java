package edu.pku.course_schedule.dao;

import java.sql.Date;


public class Student {
	
	private String student_ID; // pk
	
	private String student_Name;
	
	private int student_listen; // 听力课时数，默认为0
	
	private String student_listen_teacher; // fk, 听力老师ID，默认为空
	
	private int student_ID_speak; // 口语课时数，默认为0
	
	private String student_ID_speak_teacher; // fk, 默认为空
	
	private int student_read; // 阅读课时数，默认为0
	
	private String student_read_teacher; // fk, 默认为空
	
	private int student_write; // 写作课时数，默认为0
	
	private String student_write_teacher; // fk, 默认为空
	
	private int student_support; // 助教课时数，默认为0
	
	private String student_support_teacher; // fk, 助教ID，默认为空
	
	private Date enrolltime; // 报名时间

	
	
	/**********Getter and Setter**********/
	
	public String getStudent_ID() {
		return student_ID;
	}

	public void setStudent_ID(String student_ID) {
		this.student_ID = student_ID;
	}

	public String getStudent_Name() {
		return student_Name;
	}

	public void setStudent_Name(String student_Name) {
		this.student_Name = student_Name;
	}

	public int getStudent_listen() {
		return student_listen;
	}

	public void setStudent_listen(int student_listen) {
		this.student_listen = student_listen;
	}

	public String getStudent_listen_teacher() {
		return student_listen_teacher;
	}

	public void setStudent_listen_teacher(String student_listen_teacher) {
		this.student_listen_teacher = student_listen_teacher;
	}

	public int getStudent_ID_speak() {
		return student_ID_speak;
	}

	public void setStudent_ID_speak(int student_ID_speak) {
		this.student_ID_speak = student_ID_speak;
	}

	public String getStudent_ID_speak_teacher() {
		return student_ID_speak_teacher;
	}

	public void setStudent_ID_speak_teacher(String student_ID_speak_teacher) {
		this.student_ID_speak_teacher = student_ID_speak_teacher;
	}

	public int getStudent_read() {
		return student_read;
	}

	public void setStudent_read(int student_read) {
		this.student_read = student_read;
	}

	public String getStudent_read_teacher() {
		return student_read_teacher;
	}

	public void setStudent_read_teacher(String student_read_teacher) {
		this.student_read_teacher = student_read_teacher;
	}

	public int getStudent_write() {
		return student_write;
	}

	public void setStudent_write(int student_write) {
		this.student_write = student_write;
	}

	public String getStudent_write_teacher() {
		return student_write_teacher;
	}

	public void setStudent_write_teacher(String student_write_teacher) {
		this.student_write_teacher = student_write_teacher;
	}

	public int getStudent_support() {
		return student_support;
	}

	public void setStudent_support(int student_support) {
		this.student_support = student_support;
	}

	public String getStudent_support_teacher() {
		return student_support_teacher;
	}

	public void setStudent_support_teacher(String student_support_teacher) {
		this.student_support_teacher = student_support_teacher;
	}

	public Date getEnrolltime() {
		return enrolltime;
	}

	public void setEnrolltime(Date enrolltime) {
		this.enrolltime = enrolltime;
	}
	
	


}
