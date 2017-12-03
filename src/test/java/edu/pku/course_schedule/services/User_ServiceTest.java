package edu.pku.course_schedule.services;

import static org.junit.Assert.*;
import java.sql.Date;

import org.junit.Test;

import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.impl.User_Service_Imp;

public class User_ServiceTest {
	User_Service_Imp us=new User_Service_Imp();
	@Test
	public void testLogin() {
		//us.login("", "1", identify)
		fail("Not yet implemented");
	}

	@Test
	public void testModifyPassword() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddStudent() {
		//fail("Not yet implemented");
		Student student=new Student();
		student.setId("test");
		student.setName("test");
		student.setEnroll_time(new Date(2017, 11,31));
		//student.setEmail("99@qq.com");
		student.setPassword("pw");
		student.setIdentify_id("628123723209487");
		System.out.println(us.addStudent(student));
		
		
	}

	@Test
	public void testAddTeacher() {
		Teacher teacher=new Teacher();
		teacher.setName("罗老");
		teacher.setKind(0);
		teacher.setIdentify_id("123");
		teacher.setBase_salary(100);
		teacher.setEntertime(new Date(2017, 07, 02));
		System.out.print(us.addTeacher(teacher));
	}

	@Test
	public void testModifyStudent() {
		fail("Not yet implemented");
	}

	@Test
	public void testModifyTeacher() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetAllUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUserByIdentityId() {
		fail("Not yet implemented");
	}

}
