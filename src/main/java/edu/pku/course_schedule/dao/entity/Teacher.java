package edu.pku.course_schedule.dao.entity;

public class Teacher {

	private String id; // pk
	
	private String name;
	
	private int kind; 
	
	private int base_salary; 
	
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

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getBase_salary() {
		return base_salary;
	}

	public void setBase_salary(int base_salary) {
		this.base_salary = base_salary;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password2) {
		this.password = password2;
	}

	public String getIdentify_id() {
		return identify_id;
	}

	public void setIdentify_id(String identify_id) {
		this.identify_id = identify_id;
	}
	
	
	
	
}
