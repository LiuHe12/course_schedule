package edu.pku.course_schedule.dao.entity;

public class Teacher_salary {

	
	private String teacher_id; 
	
	private String time; 
	
	private int bonus; 
	
	private int salary;

	
	
	
	/**********Getter and Setter**********/
	
	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	
	
}
