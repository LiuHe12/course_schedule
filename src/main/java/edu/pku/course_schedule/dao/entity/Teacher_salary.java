package edu.pku.course_schedule.dao.entity;

public class Teacher_salary {

	
	private String teacher_ID; // pk,fk
	
	private String salary_time; // pk, 工������间，���201706
	
	private int bonus; // 当���奖���，���认为0
	
	private int salary; // 工���，���认为空������课���数与������������������������新

	
	
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
