package edu.pku.course_schedule.dao.entity;

public class Teacher {

	private String teacher_ID; // pk
	
	private String teacher_Name;
	
	private int teacher_kind; // şı™åşıç§ç±»ï¼ˆåŠ©şı™ä¸º0ï¼Œæ­£å¸¸æşıå¸ˆä¸º1ï¼Œäşışıªæşıå¸ˆä¸º2ï¼şı	
	private int teacher_baseSalary; // şıºçşıå·¥èşı
	
	private int teacher_baseCourse; // å¿…é¡»è¯¾æ—¶şışı	
	private int teacher_speakprice;
	
	private int teacher_readprice;
	
	private int teacher_writeprice;
	
	private int teacher_listenprice;
	
	
	
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

	public int getTeacher_baseCourse() {
		return teacher_baseCourse;
	}

	public void setTeacher_baseCourse(int teacher_baseCourse) {
		this.teacher_baseCourse = teacher_baseCourse;
	}

	public int getTeacher_speakprice() {
		return teacher_speakprice;
	}

	public void setTeacher_speakprice(int teacher_speakprice) {
		this.teacher_speakprice = teacher_speakprice;
	}

	public int getTeacher_readprice() {
		return teacher_readprice;
	}

	public void setTeacher_readprice(int teacher_readprice) {
		this.teacher_readprice = teacher_readprice;
	}

	public int getTeacher_writeprice() {
		return teacher_writeprice;
	}

	public void setTeacher_writeprice(int teacher_writeprice) {
		this.teacher_writeprice = teacher_writeprice;
	}

	public int getTeacher_listenprice() {
		return teacher_listenprice;
	}

	public void setTeacher_listenprice(int teacher_listenprice) {
		this.teacher_listenprice = teacher_listenprice;
	}

}
