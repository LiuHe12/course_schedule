package edu.pku.course_schedule.dao;

public class Teacher_salary {

	
	private String teacher_ID; // pk,fk
	
	private String salary_time; // pk, 工资时间，如201706
	
	private int bonus; // 当月奖金，默认为0
	
	private int salary; // 工资，默认为空，由课时数与奖金的和得出后更新

	
	
	/**********Getter and Setter**********/
	
	public String getTeacher_ID() {
		return teacher_ID;
	}

	public void setTeacher_ID(String teacher_ID) {
		this.teacher_ID = teacher_ID;
	}

	public String getSalary_time() {
		return salary_time;
	}

	public void setSalary_time(String salary_time) {
		this.salary_time = salary_time;
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
