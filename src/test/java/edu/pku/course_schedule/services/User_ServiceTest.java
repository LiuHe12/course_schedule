package edu.pku.course_schedule.services;

import static org.junit.Assert.*;
import java.sql.Date;
import java.util.List;

import org.junit.Test;

import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.impl.User_Service_Imp;

public class User_ServiceTest {
	User_Service_Imp us=new User_Service_Imp();
	@Test
	public void testLogin() {
		Student student=(Student)us.login("S1712030004", "pw",2 );
		//assertEquals(null,student.getIdentify_id());
		
		Teacher teacher=(Teacher)us.login("T0004", "1", 1);
		assertEquals(1,teacher.getIncumbency());
	}

	@Test
	public void testModifyPassword() {
		us.modifyPassword("T0004", 1, "1");
		
	}

//	@Test
//	public void testAddStudent() {
//		//fail("Not yet implemented");
//		Student student=new Student();
//		student.setId("test");
//		student.setName("test");
//		student.setEnroll_time(new Date(2017,
//				11,31));
//		//student.setEmail("99@qq.com");
//		student.setPassword("pw");
//		student.setIdentify_id("628123723209487");
//		us.addStudent(student);	
//	}

//	@Test
//	public void testAddTeacher() {
//		Teacher teacher=new Teacher();
//		teacher.setName("罗老");
//		teacher.setKind(0);
//		teacher.setIdentify_id("123");
//		teacher.setBase_salary(100);
//		teacher.setEntertime(new Date(2017, 07, 02));
//		System.out.print(us.addTeacher(teacher));
//	}

	@Test
	public void testModifyStudent() {
		Student student=(Student)us.getUser("S1712030001", 2);
		student.setName("test");	
		assertTrue(us.modifyStudent("S1712030001", student));
		
	}

	@Test
	public void testModifyTeacher() {
		Teacher teacher=(Teacher) us.getUser("T0004", 1);
		teacher.setName("段丽华~");
		assertTrue(us.modifyTeacher("T0004", teacher));
	}

	//此方法暂时不用严格要求，可以设置学生的状态位，修改老师在职状态
	@Test
	public void testDelUser() {
//		assertTrue(us.delUser("T0005", 1));
//		assertTrue(!us.delUser("S1712030001", 1));
//		assertTrue(us.delUser("S1712030001", 2));
//		assertTrue(!us.delUser("T0005", 2));
	}


	@Test
	public void testGetAllUser() {
		
		assertEquals(8,us.getAllUser(2).size());
		assertEquals(17,(us.getAllUser(1)).size());
	}

	@Test
	public void testGetUserByIdentityId() {
		Student student=(Student) us.getUserByIdentityId("777", 2);
		assertEquals("S1711250007", student.getId());
		Teacher teacher=(Teacher) us.getUserByIdentityId("1111", 1);
		assertEquals("段莉华", teacher.getName());
	}

}
