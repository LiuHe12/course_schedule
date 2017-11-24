package edu.pku.course_schedule.dao.impl;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;

import com.mysql.jdbc.PreparedStatement;

import edu.pku.course_schedule.dao.entity.Administrator;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.dao.entity.Teacher_salary;
import edu.pku.course_schedule.util.JdbcUtil;
import edu.pku.course_schedule.util.MD5Util;

@SuppressWarnings("all")
public class JdbcDao implements Dao {

	private Logger logger = Logger.getLogger(JdbcDao.class);
	private static JdbcUtil jdbcUtil = new JdbcUtil();
	private static String administrator_table_name = "administrator";
	private static String teacher_table_name = "teacher";
	private static String student_table_name = "student";
	private static String studentCourse_table_name = "student_course";
	private static String course_table_name = "course";
	private static String teacherSalary_table_name = "teacher_salary";
	public static final int administrator_identify = 0;
	public static final int teacher_identify = 1;
	public static final int student_identity = 2;
	private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

	@Override
	public Object login(String userId, String password, int identify) throws SQLException {
		if (identify == teacher_identify) {
			Teacher teacher = (Teacher) getUser(userId, identify);
			if (MD5Util.getMD5(password).equals(teacher.getPassword())) {
				return teacher;
			}
		} else if (identify == student_identity) {
			Student student = (Student) getUser(userId, identify);
			if (MD5Util.getMD5(password).equals(student.getPassword())) {
				return student;
			}
		} else if (identify == administrator_identify) {
			Administrator adm = (Administrator) getUser(userId, identify);
			if (MD5Util.getMD5(password).equals(adm.getPassword())) {
				return adm;
			}
		}
		return null;
	}

	@Override
	public boolean modifyPassword(String userId, int identify, String newPassword) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set password=? where id=?";
		PreparedStatement preparedStatement = (PreparedStatement) conn.prepareStatement(sql);
		Object obj = getUser(userId, identify);
		if (obj != null) {
			jdbcUtil.release(preparedStatement, conn);
			logger.info(String.format("[ %s ]账户不存在！！", userId));
			return false;
		} else {
			if (identify == teacher_identify) {
				preparedStatement.setString(1, teacher_table_name);

			} else if (identify == student_identity) {
				preparedStatement.setString(1, student_table_name);
			}
			preparedStatement.setString(2, newPassword);
			preparedStatement.setString(3, userId);

			int count = preparedStatement.executeUpdate();
			if (count <= 0) {
				logger.info(String.format("更新 [ %s ]密码失败 ", userId));
				jdbcUtil.release(preparedStatement, conn);
				return false;
			}
			logger.info(String.format("更新  [ %s] 密码成功 ", userId));
			jdbcUtil.release(preparedStatement, conn);
		}
		return true;
	}

	@Override
	public boolean addStudent(Student student) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = null;
		PreparedStatement st;
		if (student.getEmail() != null) {
			sql = "insert into ? values (?,?,?,?,?)";
			st = (PreparedStatement) conn.prepareStatement(sql);
			st.setString(2, student.getName());
			st.setDate(3, student.getEnroll_time());
			st.setString(4, student.getEmail());
			st.setString(5, student.getIdentify_id());
		} else {
			sql = "insert into ? (name,enroll_time,password,identify_id) values (?,?,?,?)";
			st = (PreparedStatement) conn.prepareStatement(sql);
			st.setString(2, student.getName());
			st.setDate(3, student.getEnroll_time());
			st.setString(4, student.getIdentify_id());
		}
		st.setString(1, student_table_name);
		boolean r = st.execute();
		jdbcUtil.release(st, conn);
		if (!r) {
			logger.debug(String.format("插入学生[ %s] 失败", student.getName()));
			return false;
		}
		logger.debug(String.format("插入学生 [ %s ]成功", student.getName()));
		return true;
	}

	@Override
	public boolean addTeacher(Teacher teacher) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "insert into ? values (?,?,?,?,?)";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);

		st.setString(1, teacher_table_name);
		st.setString(2, teacher.getName());
		st.setInt(3, teacher.getKind());
		st.setInt(4, teacher.getBase_salary());
		st.setString(5, MD5Util.getMD5(teacher.getPassword()));
		st.setString(6, teacher.getIdentify_id());
		boolean r = st.execute();
		jdbcUtil.release(st, conn);
		if (!r) {
			logger.debug(String.format("插入教师[ %s] 失败", teacher.getName()));
		} else {
			logger.debug(String.format("插入教师 [ %s ]成功", teacher.getName()));
		}

		return r;
	}

	@Override
	public boolean modifyStudent(String student_id, Student student) throws SQLException {
		Student stu = (Student) getUser(student_id, student_identity);
		if (stu == null) {
			logger.info(String.format("学生[ %s ] 不存在！", student_id));
			return false;
		}
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set name=?,enroll_time=?,email=?,identify_id=? where id=?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, student_table_name);
		st.setString(2, student.getName());
		st.setDate(3, student.getEnroll_time());
		st.setString(4, student.getEmail());
		st.setString(5, student.getIdentify_id());
		st.setString(6, student_id);
		boolean r = st.execute();
		if (!r) {
			logger.info(String.format("更新学生[ %s ]信息 失败！", student_id));
		} else {
			logger.info(String.format("更新学生[ %s ]信息成功！", student_id));
		}
		jdbcUtil.release(st, conn);
		return r;
	}

	@Override
	public boolean modifyTeacher(String teacher_id, Teacher teacher) throws SQLException {
		Student tch = (Student) getUser(teacher_id, teacher_identify);
		if (tch == null) {
			logger.info(String.format("教师[ %s ] 不存在！", teacher_id));
			return false;
		}
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set name=?,kind=?,base_salary=?,identify_id=? where id=?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacher_table_name);
		st.setString(2, teacher.getName());
		st.setInt(3, teacher.getKind());
		st.setInt(4, teacher.getBase_salary());
		st.setString(5, teacher.getIdentify_id());
		st.setString(6, teacher_id);
		boolean r = st.execute();
		if (!r) {
			logger.info(String.format("更新教师[ %s ]信息 失败！", teacher_id));
		} else {
			logger.info(String.format("更新学生[ %s ]教师信息成功！", teacher_id));
		}

		jdbcUtil.release(st, conn);
		return r;
	}

	@Override
	public boolean delUser(String user_id, int identify) throws SQLException {
		Object user = (Student) getUser(user_id, identify);
		if (user == null) {
			logger.info(String.format("用户[ %s ] 不存在！", user_id));
			return false;
		}
		Connection conn = jdbcUtil.getConnection();
		String sql = "delete from ? where id=";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		if (identify == teacher_identify) {
			st.setString(1, teacher_table_name);
		} else if (identify == student_identity) {
			st.setString(1, student_table_name);
		}
		st.setString(2, user_id);
		boolean r = st.execute();
		if (!r) {
			logger.info(String.format("删除用户[ %s ] 失败！", user_id));

		} else {
			logger.info(String.format("删除用户[ %s ] 成功！", user_id));
		}

		return r;
	}

	@Override
	public Object getUser(String user_id, int identify) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where id= ?";
		PreparedStatement pStatement = (PreparedStatement) conn.prepareStatement(sql);

		if (identify == administrator_identify) {
			pStatement.setString(1, administrator_table_name);
		} else if (identify == teacher_identify) {
			pStatement.setString(1, teacher_table_name);
		} else if (identify == student_identity) {
			pStatement.setString(1, student_table_name);
		}
		pStatement.setString(2, user_id);
		ResultSet rs = pStatement.executeQuery();
		if (rs.next()) {
			if (identify == administrator_identify) {
				Administrator administrator = new Administrator();
				administrator.setId(user_id);
				administrator.setPassword(rs.getString("password"));
				jdbcUtil.release(pStatement, rs, conn);
				return administrator;
			} else if (identify == teacher_identify) {
				Teacher teacher = new Teacher();
				teacher.setId(user_id);
				teacher.setPassword(rs.getString("password"));
				teacher.setName(rs.getString("name"));
				teacher.setKind(rs.getInt("kind"));
				teacher.setBase_salary(rs.getInt("base_salary"));
				teacher.setIdentify_id(rs.getString("identify_id"));
				jdbcUtil.release(pStatement, rs, conn);
				return teacher;
			} else if (identify == student_identity) {
				Student student = new Student();
				student.setId(user_id);
				student.setName(rs.getString("name"));
				student.setPassword(rs.getString("password"));
				student.setEnroll_time(rs.getDate("enroll_time"));
				student.setEmail(rs.getString("email"));
				student.setIdentify_id(rs.getString("identify_id"));
				jdbcUtil.release(pStatement, rs, conn);
				return student;
			}
		}
		jdbcUtil.release(pStatement, rs, conn);
		return null;
	}

	@Override
	public ArrayList<Object> getAllUser(int identify) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ?";
		PreparedStatement pStatement = (PreparedStatement) conn.prepareStatement(sql);
		ArrayList users = null;
		if (identify == administrator_identify) {
			users = new ArrayList<Administrator>();
			pStatement.setString(1, administrator_table_name);
		} else if (identify == teacher_identify) {
			users = new ArrayList<Teacher>();
			pStatement.setString(1, teacher_table_name);
		} else if (identify == student_identity) {
			users = new ArrayList<Student>();
			pStatement.setString(1, student_table_name);
		}

		ResultSet rs = pStatement.executeQuery();

		if (rs.next()) {
			if (identify == teacher_identify) {
				Teacher teacher = new Teacher();
				teacher.setId(rs.getString("id"));
				teacher.setPassword(rs.getString("password"));
				teacher.setName(rs.getString("name"));
				teacher.setKind(rs.getInt("kind"));
				teacher.setBase_salary(rs.getInt("base_salary"));
				teacher.setIdentify_id(rs.getString("identify_id"));
				users.add(teacher);
			} else if (identify == student_identity) {
				Student student = new Student();
				student.setId(rs.getString("id"));
				student.setName(rs.getString("name"));
				student.setPassword(rs.getString("password"));
				student.setEnroll_time(rs.getDate("enroll_time"));
				String email = rs.getString("email");
				if (email != null) {
					student.setEmail(email);
				}
				student.setIdentify_id(rs.getString("identify_id"));
				users.add(student);
			}
		}
		jdbcUtil.release(pStatement, rs, conn);
		return users;
	}

	@Override
	public Object getUserByIdentityId(String identifyId, int identify) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where identify_id= ?";
		PreparedStatement pStatement = (PreparedStatement) conn.prepareStatement(sql);

		if (identify == administrator_identify) {
			pStatement.setString(1, administrator_table_name);
		} else if (identify == teacher_identify) {
			pStatement.setString(1, teacher_table_name);
		} else if (identify == student_identity) {
			pStatement.setString(1, student_table_name);
		}
		pStatement.setString(2, identifyId);
		ResultSet rs = pStatement.executeQuery();
		if (rs.next()) {

			if (identify == teacher_identify) {
				Teacher teacher = new Teacher();
				teacher.setId(rs.getString("id"));
				teacher.setPassword(rs.getString("password"));
				teacher.setName(rs.getString("name"));
				teacher.setKind(rs.getInt("kind"));
				teacher.setBase_salary(rs.getInt("base_salary"));
				teacher.setIdentify_id(rs.getString("identify_id"));
				jdbcUtil.release(pStatement, rs, conn);
				return teacher;
			} else if (identify == student_identity) {
				Student student = new Student();
				student.setId(rs.getString("id"));
				student.setName(rs.getString("name"));
				student.setPassword(rs.getString("password"));
				student.setEnroll_time(rs.getDate("enroll_time"));
				String email = rs.getString("email");
				if (email != null) {
					student.setEmail(email);
				}
				student.setIdentify_id(rs.getString("identify_id"));
				jdbcUtil.release(pStatement, rs, conn);
				return student;
			}
		}
		jdbcUtil.release(pStatement, rs, conn);
		return null;
	}

	@Override
	public Course getCourse(int course_id) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where course_id=?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setInt(2, course_id);
		ResultSet rs = st.executeQuery();
		Course course = null;
		while (rs.next()) {
			course = new Course();
			course.setCourse_ID(rs.getInt("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getDate("time"));
			course.setRest_time(rs.getDate("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setCourse_price(rs.getInt("price"));
			course.setStatus(rs.getInt("status"));
		}
		jdbcUtil.release(st, rs, conn);
		return course;
	}

	@Override
	public ArrayList<Course> getCoursesByTime(Date startDate, Date endDate) throws SQLException {
		ArrayList<Course> courses = new ArrayList<Course>();
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where time> ? and rest_time< ? ";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setDate(2, startDate);
		st.setDate(3, endDate);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getInt("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getDate("time"));
			course.setRest_time(rs.getDate("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setCourse_price(rs.getInt("price"));
			course.setStatus(rs.getInt("status"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public ArrayList<Course> getCoursesByUserId(String user_id, int courseStatus) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		ArrayList<Course> courses = new ArrayList<Course>();
		String sql = "select * from ? where (student_id =? or teacher_id=?) and status =?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setString(2, user_id);
		st.setString(3, user_id);
		st.setInt(4, courseStatus);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getInt("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getDate("time"));
			course.setRest_time(rs.getDate("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setCourse_price(rs.getInt("price"));
			course.setStatus(rs.getInt("status"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public void setSatification(int course_id, int score) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set satisfaction = ? where course_id= ? ";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setInt(2, score);
		st.setInt(3, course_id);
		int r = st.executeUpdate();
		if (r >= 1) {
			logger.info(String.format("[ %d ] is set satification successfully -> %s", course_id,
					df.format(new java.util.Date())));
		} else {
			logger.info(String.format("[ %d ] is set satification failed -> %s", course_id,
					df.format(new java.util.Date())));
		}
		jdbcUtil.release(st, conn);
	}

	@Override
	public void setEvaluate(int course_id, String evaluate) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set evaluate=?,status=? where course_id=? and status=1";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setString(2, evaluate);
		st.setInt(3, 2);
		st.setInt(4, course_id);
		int r = st.executeUpdate();
		if (r >= 1) {
			logger.info(
					String.format("[ %s ] evaluate successfully -> %s", course_id, df.format(new java.util.Date())));
		} else {
			logger.info(String.format("[ %s ] evaluate failed -> %s", course_id, df.format(new java.util.Date())));
		}
		jdbcUtil.release(st, conn);

	}

	@Override
	public ArrayList<Course> getAllCoursePasses(Date startDate, Date endDate) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		ArrayList<Course> courses = new ArrayList<Course>();
		String sql = "select * from ? where time>? and rest_time< ? and status >=1";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setDate(2, startDate);
		st.setDate(3, endDate);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getInt("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getDate("time"));
			course.setRest_time(rs.getDate("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setCourse_price(rs.getInt("price"));
			course.setStatus(rs.getInt("status"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public boolean addCourse(Course course) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "insert into ? (student_id,teacher_id,time,rest_time,name) values (?,?,?,?,?)";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setString(2, course.getStudent_ID());
		st.setString(3, course.getTeacher_ID());
		st.setDate(4, course.getTime());
		st.setDate(5, course.getRest_time());
		st.setString(6, course.getName());

		boolean r = st.execute();
		if (r) {
			logger.info(String.format("add course [ %s ] successfully -> %s", course.getCourse_ID(),
					df.format(new java.util.Date())));
		} else {
			logger.info(String.format("add course [ %s ] failed -> %s", course.getCourse_ID(),
					df.format(new java.util.Date())));
		}
		jdbcUtil.release(st, conn);
		return r;
	}

	@Override
	public boolean delCourse(int course_id) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "delete from ? where course_id =?";
		PreparedStatement st = (PreparedStatement) conn.prepareCall(sql);
		st.setString(1, course_table_name);
		st.setInt(2, course_id);
		boolean r = st.execute();
		if (r) {
			logger.info(String.format("delete course [ %s ] successfully -> %s", course_id,
					df.format(new java.util.Date())));
		} else {
			logger.info(String.format("delete course [ %s ] failed -> %s", course_id, df.format(new java.util.Date())));
		}
		jdbcUtil.release(st, conn);
		return r;
	}

	@Override
	public ArrayList<Course> waitSatisCourses(String student_id) throws SQLException {
		ArrayList<Course> courses = new ArrayList<Course>();
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where satisfaction=-1 and student_id=?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setString(2, student_id);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getInt("course_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getDate("time"));
			course.setRest_time(rs.getDate("rest_time"));
			course.setName(rs.getString("name"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public ArrayList<Course> waitEvaluateCourses(String teacher_id) throws SQLException {
		ArrayList<Course> courses = new ArrayList<Course>();
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where status=1 and teacher_id=?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setString(2, teacher_id);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getInt("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTime(rs.getDate("time"));
			course.setRest_time(rs.getDate("rest_time"));
			course.setName(rs.getString("name"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public boolean setCoursePass(int course_id) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set status = ? where course_id= ? and status=0 ";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setInt(2, 1);// 1
		st.setInt(3, course_id);
		int r = st.executeUpdate();
		jdbcUtil.release(st, conn);
		if (r >= 1) {
			logger.info(String.format("[ %d ] is set course pass successfully -> %s", course_id,
					df.format(new java.util.Date())));
			return true;

		} else {
			logger.info(String.format("[ %d ] is set course pass failed -> %s", course_id,
					df.format(new java.util.Date())));
			return false;
		}
	}

	@Override
	public boolean setCoursePass(String teacher_id, String student_id, Date course_time) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set status = ? where teacher_id= ? and student_id=? and time=? and status=0";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_table_name);
		st.setInt(2, 1);
		st.setString(3, teacher_id);
		st.setString(4, student_id);
		st.setDate(5, course_time);
		int r = st.executeUpdate();
		jdbcUtil.release(st, conn);
		if (r >= 1) {
			logger.info(String.format("teacher[ %s ]  student[ %s ] time[ %s ] is set course pass successfully -> %s",
					teacher_id, student_id, df.format(course_time), df.format(new java.util.Date())));
			return true;
		} else {
			logger.info(String.format("teacher[ %s ]  student[ %s ] time[ %s ] is set course pass failed -> %s",
					teacher_id, student_id, df.format(course_time), df.format(new java.util.Date())));
			return false;
		}

		
	}

	@Override
	public Teacher_salary getSalary(String teacher_id, String salary_time) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where teacher_id= ? and time= ?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacher_table_name);
		st.setString(2, teacher_id);
		st.setString(3, salary_time);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Teacher_salary teacher_salary = new Teacher_salary();
			teacher_salary.setTeacher_id(rs.getString("teacher_id"));
			teacher_salary.setTime(rs.getString("time"));
			teacher_salary.setBonus(rs.getInt("bonus"));
			teacher_salary.setSalary(rs.getInt("salary"));
			return teacher_salary;
		}
		return null;
	}

	@Override
	public ArrayList<Teacher_salary> getSalaries(String teacher_id, String startTime, String endTime)
			throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where time between ? and ?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacherSalary_table_name);
		st.setString(2, startTime);
		st.setString(3, endTime);
		ResultSet rs = st.executeQuery();
		ArrayList<Teacher_salary> teacher_salaries = new ArrayList<Teacher_salary>();
		while (rs.next()) {
			Teacher_salary teacher_salary = new Teacher_salary();
			teacher_salary.setTeacher_id(rs.getString("teacher_id"));
			teacher_salary.setTime(rs.getString("time"));
			teacher_salary.setBonus(rs.getInt("bonus"));
			teacher_salary.setSalary(rs.getInt("salary"));
			teacher_salaries.add(teacher_salary);
		}
		jdbcUtil.release(st, rs, conn);
		return teacher_salaries;
	}

	@Override
	public List<Teacher_salary> getAllSalaries(String time) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where time=?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacherSalary_table_name);
		st.setString(2, time);
		ResultSet rs = st.executeQuery();
		ArrayList<Teacher_salary> teacher_salaries = new ArrayList<Teacher_salary>();
		while (rs.next()) {
			Teacher_salary teacher_salary = new Teacher_salary();
			teacher_salary.setTeacher_id(rs.getString("teacher_id"));
			teacher_salary.setTime(rs.getString("time"));
			teacher_salary.setBonus(rs.getInt("bonus"));
			teacher_salary.setSalary(rs.getInt("salary"));
			teacher_salaries.add(teacher_salary);
		}
		jdbcUtil.release(st, rs, conn);
		return teacher_salaries;
	}

	@Override
	public ArrayList<Teacher_salary> getAllSalaries(String startTime, String endTime) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from ? where time between ? and ?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacherSalary_table_name);
		st.setString(2, startTime);
		st.setString(3, endTime);
		ResultSet rs = st.executeQuery();
		ArrayList<Teacher_salary> teacher_salaries = new ArrayList<Teacher_salary>();
		while (rs.next()) {
			Teacher_salary teacher_salary = new Teacher_salary();
			teacher_salary.setTeacher_id(rs.getString("teacher_id"));
			teacher_salary.setTime(rs.getString("time"));
			teacher_salary.setBonus(rs.getInt("bonus"));
			teacher_salary.setSalary(rs.getInt("salary"));
			teacher_salaries.add(teacher_salary);
		}
		jdbcUtil.release(st, rs, conn);
		return teacher_salaries;
	}

	@Override
	public boolean setBonus(String teacher_id, String salary_time, int bonus) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "update ? set bonus=? where teacher_id=?, time=?";
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacherSalary_table_name);
		st.setInt(2, bonus);
		st.setString(3, teacher_id);
		st.setString(4, salary_time);
		boolean r = st.execute();
		jdbcUtil.release(st, conn);
		if (r) {
			logger.info(String.format("set [ %s ] %s 奖金 [ %d ] 成功 ->%s", teacher_id, salary_time, bonus,
					df.format(new java.util.Date())));
		} else {
			logger.info(String.format("set [ %s ] %s 奖金 [ %d ] 失败->%s", teacher_id, salary_time, bonus,
					df.format(new java.util.Date())));
		}
		jdbcUtil.release(st, conn);
		return r;
	}

	// @Override
	// public int calSalary(String teacher_id, String salary_time) throws
	// SQLException {
	// // TODO Auto-generated method stub
	// return 0;
	// }

}
