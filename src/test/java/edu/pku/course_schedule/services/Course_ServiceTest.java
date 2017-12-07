package edu.pku.course_schedule.services;

import static org.junit.Assert.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.services.impl.Course_Service_Imp;

public class Course_ServiceTest {
	Course_Service_Imp cs = new Course_Service_Imp();
	SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	@Test
	public void testGetCourse() {
		Course course = cs.getCourse("201711250001");
		assertEquals("好！", course.getEvaluate());
	}

	@Test
	public void testGetCoursesByTime() {
		Timestamp time1 = null;
		Timestamp time2 = null;
		try {
			time1 = new Timestamp(sp.parse("2017-12-29 11:04:00").getTime());
			time2 = new Timestamp(sp.parse("2017-12-29 11:05:06").getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Course> courses = cs.getCoursesByTime(time1, time2);
		assertEquals(1, courses.size());
	}

	@Test
	public void testGetCoursesByUserId() {
		List<Course> courses = cs.getCoursesByUserId("T0003", 2);
		assertEquals(2, courses.size());
	}

	@Test
	public void testSetSatification() {
		cs.setSatification("201711250002", 1);

	}

	@Test
	public void testSetEvaluate() {
		cs.setEvaluate("201711250003", "test");
	}

	@Test
	public void testGetAllCoursePasses() {
		Timestamp time1 = null;
		Timestamp time2 = null;
		try {
			time1 = new Timestamp(sp.parse("2017-12-29 11:05:00").getTime());
			time2 = new Timestamp(sp.parse("2018-02-08 16:05:32").getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Course> courses = cs.getAllCoursePasses(time1, time2);
		assertEquals(3, courses.size());
	}

	// @Test
	// public void testAddCourse() {
	// Course course=cs.getCourse("201711250002");
	// assertTrue(cs.addCourse(course));
	// }

	// @Test
	// public void testDelCourse() {
	// assertTrue(cs.delCourse("201712050002"));
	// }

	@Test
	public void testWaitSatisCourses() {
		List<Course> courses = cs.waitSatisCourses("S1711250002");
		assertEquals(1, courses.size());
	}

	@Test
	public void testWaitEvaluateCourses() {
		List<Course> courses = cs.waitEvaluateCourses("T0001");// '201712050001'
		assertEquals(1, courses.size());
	}

	@Test
	public void testSetCoursePass() {
		boolean r = cs.setCoursePass("201712060003");
		assertTrue(r);
		assertTrue(!cs.setCoursePass("201712050001"));
	}

	@Test
	public void testSetCoursePassStringStringDate() {
		// Date time= Date.valueOf("2018-01-01");
		java.util.Date du = null;
		try {
			du = sp.parse("2017-12-07 14:32:25");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp time = new Timestamp(du.getTime());
		assertTrue(cs.setCoursePass("T0001", "S1711250002", time));
	}

}
