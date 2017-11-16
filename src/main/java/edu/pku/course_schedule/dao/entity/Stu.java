package edu.pku.course_schedule.dao.entity;

import java.sql.Date;


public class Student {
	
	private String student_ID; // pk
	
	private String student_Name;
	
	private int student_course1_price;
	private String student_course1_teacher;
	private String student_course1;
	
	private int student_course2_price;
	private String student_course2_teacher;
	private String student_course2;
	
	private int student_course3_price;
	private String student_course3_teacher;
	private String student_course3;
	
	private int student_course4_price;
	private String student_course4_teacher;
	private String student_course4;
	
	private int student_course5_price;
	private String student_course5_teacher;


	private String student_course5;
	
	
	private Date enrolltime; 

	private String email;
	
	private String password;
	
	private String identify_Id;
	
	
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

	public Date getEnrolltime() {
		return enrolltime;
	}

	public void setEnrolltime(Date enrolltime) {
		this.enrolltime = enrolltime;
	}
	
	public int getStudent_course1_price() {
		return student_course1_price;
	}

	public void setStudent_course1_price(int student_course1_price) {
		this.student_course1_price = student_course1_price;
	}

	public String getStudent_course1_teacher() {
		return student_course1_teacher;
	}

	public void setStudent_course1_teacher(String student_course1_teacher) {
		this.student_course1_teacher = student_course1_teacher;
	}

	public String getStudent_course1() {
		return student_course1;
	}

	public void setStudent_course1(String student_course1) {
		this.student_course1 = student_course1;
	}

	public int getStudent_course2_price() {
		return student_course2_price;
	}

	public void setStudent_course2_price(int student_course2_price) {
		this.student_course2_price = student_course2_price;
	}

	public String getStudent_course2_teacher() {
		return student_course2_teacher;
	}

	public void setStudent_course2_teacher(String student_course2_teacher) {
		this.student_course2_teacher = student_course2_teacher;
	}

	public String getStudent_course2() {
		return student_course2;
	}

	public void setStudent_course2(String student_course2) {
		this.student_course2 = student_course2;
	}

	public int getStudent_course3_price() {
		return student_course3_price;
	}

	public void setStudent_course3_price(int student_course3_price) {
		this.student_course3_price = student_course3_price;
	}

	public String getStudent_course3_teacher() {
		return student_course3_teacher;
	}

	public void setStudent_course3_teacher(String student_course3_teacher) {
		this.student_course3_teacher = student_course3_teacher;
	}

	public String getStudent_course3() {
		return student_course3;
	}

	public void setStudent_course3(String student_course3) {
		this.student_course3 = student_course3;
	}

	public int getStudent_course4_price() {
		return student_course4_price;
	}

	public void setStudent_course4_price(int student_course4_price) {
		this.student_course4_price = student_course4_price;
	}

	public String getStudent_course4_teacher() {
		return student_course4_teacher;
	}

	public void setStudent_course4_teacher(String student_course4_teacher) {
		this.student_course4_teacher = student_course4_teacher;
	}

	public String getStudent_course4() {
		return student_course4;
	}

	public void setStudent_course4(String student_course4) {
		this.student_course4 = student_course4;
	}

	public int getStudent_course5_price() {
		return student_course5_price;
	}

	public void setStudent_course5_price(int student_course5_price) {
		this.student_course5_price = student_course5_price;
	}

	public String getStudent_course5_teacher() {
		return student_course5_teacher;
	}

	public void setStudent_course5_teacher(String student_course5_teacher) {
		this.student_course5_teacher = student_course5_teacher;
	}

	public String getStudent_course5() {
		return student_course5;
	}

	public void setStudent_course5(String student_course5) {
		this.student_course5 = student_course5;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdentify_Id() {
		return identify_Id;
	}

	public void setIdentify_Id(String identify_Id) {
		this.identify_Id = identify_Id;
	}


}
