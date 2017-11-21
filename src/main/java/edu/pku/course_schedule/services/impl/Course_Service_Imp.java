package edu.pku.course_schedule.services.impl;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.impl.JdbcDao;
import edu.pku.course_schedule.services.Course_Service;

public class Course_Service_Imp implements Course_Service {
	private Logger logger = Logger.getLogger(Course_Service_Imp.class);
	private static JdbcDao dao=new JdbcDao();
	private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// ‰z¸m¤é´Á®æ¦¡
	@Override
	public Course getCourse(int course_id) {
		Course course=null;
		try {
			course=dao.getCourse(course_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}
		return course;
	}

	@Override
	public ArrayList<Course> getCoursesByTime(Date startDate, Date endDate) {
		ArrayList<Course> courses=null;
		try {
			courses=dao.getCoursesByTime(startDate, endDate);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}
		return courses;
	}

	@Override
	public ArrayList<Course> getCoursesByUserId(String user_id, int courseStatus) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setSatification(int course_id, int score) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setEvaluate(int course_id, String evaluate) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<Course> getAllCoursePasses(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addCourse(Course course) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delCourse(int course_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Course> waitEvaluateCourses(String teacher_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean setCoursePass(int course_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean setCoursePass(String teacher_id, String student_id, Date course_time) {
		// TODO Auto-generated method stub
		return false;
	}

}
