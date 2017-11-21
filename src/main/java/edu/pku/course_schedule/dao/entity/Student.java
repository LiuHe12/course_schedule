package edu.pku.course_schedule.dao.entity;

import java.sql.Date;


public class Student {
	
	private String id;
	
	private String name;
		
	private Date enroll_time; 

	private String email;
	
	private String password;
	
	private String identify_id;

	
	
	/**********Getter and Setter**********/
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getEnroll_time() {
		return enroll_time;
	}

	public void setEnroll_time(Date enroll_time) {
		this.enroll_time = enroll_time;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		if(email!=null) {
			this.email = email;
		}
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdentify_id() {
		return identify_id;
	}

	public void setIdentify_id(String identify_id) {
		this.identify_id = identify_id;
	}
	
	
	
	
	
	
}
