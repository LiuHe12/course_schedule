package edu.pku.course_schedule.dao;

public class Teacher {
	
	/*
	 * ��ɦA�令�M��Ʈw���W�٤@��
	 * */
	
	private String id;
	
	private String name;
	
	private int basicCourseHours;
	
	private double salaryBasic;

	
//	private double salaryListen;
	
//	private double salarySpeak;
	
//	private double salaryRead;
	
//	private double salaryWrite;
	
	
	
	
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

	public int getBasicCourseHours() {
		return basicCourseHours;
	}

	public void setBasicCourseHours(int basicCourseHours) {
		this.basicCourseHours = basicCourseHours;
	}

	public double getSalaryBasic() {
		return salaryBasic;
	}

	public void setSalaryBasic(double salaryBasic) {
		this.salaryBasic = salaryBasic;
	}
	


	
	
}
