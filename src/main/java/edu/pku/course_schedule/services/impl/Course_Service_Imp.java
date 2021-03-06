package edu.pku.course_schedule.services.impl;
import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student_course;
import edu.pku.course_schedule.dao.impl.JdbcDao;
import edu.pku.course_schedule.services.Course_Service;
@SuppressWarnings("all")
public class Course_Service_Imp implements Course_Service {
	private Logger logger = Logger.getLogger(Course_Service_Imp.class);
	private static JdbcDao dao=new JdbcDao();
	private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// �z�m����榡
	@Override
	public Course getCourse(String course_id) {
		Course course=null;
		try {
			course=dao.getCourse(course_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return course;
		}
		
	}

	@Override
	public ArrayList<Course> getCoursesByTime(Timestamp startDate, Timestamp endDate) {
		ArrayList<Course> courses=null;
		try {
			courses=dao.getCoursesByTime(startDate, endDate);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return courses;
		}
		
	}

	@Override
	public ArrayList<Course> getCoursesByUserId(String user_id, int courseStatus) {
		ArrayList<Course> courses=null;
		try {
			courses=dao.getCoursesByUserId(user_id, courseStatus);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return courses;
		}
		
	}

	@Override
	public void setSatification(String course_id, int score) {
		try {
			dao.setSatification(course_id, score);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}

	}

	@Override
	public void setEvaluate(String course_id, String evaluate) {
		try {
			dao.setEvaluate(course_id, evaluate);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}

	}

	@Override
	public ArrayList<Course> getAllCoursePasses(Timestamp startDate, Timestamp endDate) {
		ArrayList<Course> courses=null;
		try {
			courses=dao.getAllCoursePasses(startDate, endDate);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return courses;
		}
		
	}
	@Override
	public boolean addCourse(Student_course student_course) {
		boolean r=false;
		try {
			r=dao.addCourse(student_course);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return r;
		}
		
	}
	
	@Override
	public boolean arrangeCourse(Course course) {
		boolean r=false;
		try {
			r=dao.arrangeCourse(course);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return r;
		}
	}
	@Override
	public ArrayList<Student_course> getStudentCourse(String teacher_id,String student_id ){
		ArrayList<Student_course> student_courses=null;
		try {
			student_courses=dao.getCourse(teacher_id, student_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return student_courses;
		}
	}

	@Override
	public boolean delCourse(String course_id) {
		boolean r=false;
		try {
			r=dao.delCourse(course_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return r;
		}
	}

	@Override
	public ArrayList<Course> waitEvaluateCourses(String teacher_id) {
		ArrayList<Course> courses=null;
		try {
			courses=dao.waitEvaluateCourses(teacher_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return courses;
		}
	}

	@Override
	public boolean setCoursePass(String course_id) {
		boolean r=false;
		try {
			r=dao.setCoursePass(course_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return r;
		}
		
	}

	@Override
	public boolean setCoursePass(String teacher_id, String student_id, Timestamp course_time) {
		boolean r=false;
		try {
			r=dao.setCoursePass(teacher_id, student_id, course_time);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return r;
		}
		
	}

	@Override
	public ArrayList<Course> waitSatisCourses(String student_id) {
		ArrayList<Course> courses=null;
		try {
			courses=dao.waitSatisCourses(student_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return courses;
		}
		
	}

	@Override
	public Student_course getStudentCourse(String teacher_id, String student_id, String name) {
		Student_course student_course=null;
		try {
			student_course=dao.getStudentCourse(teacher_id, student_id, name);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}
		return student_course;
	}

	@Override
	public ArrayList<Student_course> getStudentCourses() {
		ArrayList<Student_course> student_courses=null;
		try {
			student_courses=dao.getStudentCourses();
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}
		return student_courses;
	}

	@Override
	public ArrayList<Course> getCoursesByUserId(String user_id) {
		ArrayList<Course> courses=null;
		try {
			courses=dao.getCoursesByUserId(user_id);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}
		return courses;
	}

	@Override
	public boolean modifyCourse(Course course) {
		boolean r=false;
		try {
			r=dao.modifyCourseTime(course);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return r;
		}
	}

	@Override
	public boolean setRemind(String course_id,String remind) {
		boolean r=false;
		try {
			r=dao.setRemind(course_id,remind);
		} catch (SQLException e) {
			logger.info(String.format("%s -> %s", e.toString(),df.format(new java.util.Date())));
			e.printStackTrace();
		}finally {
			return r;
		}
	}

}
