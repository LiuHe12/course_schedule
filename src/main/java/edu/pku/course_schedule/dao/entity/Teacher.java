package edu.pku.course_schedule.dao.entity;

public class Teacher {

	private String teacher_ID; // pk
	
	private String teacher_Name;
	
	private int teacher_kind; // şı™åşıç§ç±»ï¼ˆåŠ©şı™ä¸º0ï¼Œæ­£å¸¸æşıå¸ˆä¸º1ï¼Œäşışıªæşıå¸ˆä¸º2ï¼şı	
	
	private int teacher_baseSalary; // şıºçşıå·¥èşı
	
	private int password;
	
	private String identify_Id;
	
	
	


	/**********Getter and Setter**********/

	public String getTeacher_ID() {
		return teacher_ID;
	}

	public void setTeacher_ID(String teacher_ID) {
		this.teacher_ID = teacher_ID;
	}

	public String getTeacher_Name() {
		return teacher_Name;
	}

	public void setTeacher_Name(String teacher_Name) {
		this.teacher_Name = teacher_Name;
	}

	public int getTeacher_kind() {
		return teacher_kind;
	}

	public void setTeacher_kind(int teacher_kind) {
		this.teacher_kind = teacher_kind;
	}

	public int getTeacher_baseSalary() {
		return teacher_baseSalary;
	}

	public void setTeacher_baseSalary(int teacher_baseSalary) {
		this.teacher_baseSalary = teacher_baseSalary;
	}

	public String getIdentify_Id() {
		return identify_Id;
	}

	public void setIdentify_Id(String identify_Id) {
		this.identify_Id = identify_Id;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

}
