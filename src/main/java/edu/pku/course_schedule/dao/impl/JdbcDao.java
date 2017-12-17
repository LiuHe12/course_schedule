package edu.pku.course_schedule.dao.impl;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;

import com.mysql.jdbc.PreparedStatement;

import edu.pku.course_schedule.dao.entity.Administrator;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Student_course;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.dao.entity.Teacher_salary;
import edu.pku.course_schedule.util.JdbcUtil;
import edu.pku.course_schedule.util.MD5Util;
import junit.framework.Test;

@SuppressWarnings("all")
public class JdbcDao implements Dao {

	private Logger logger = Logger.getLogger(JdbcDao.class);
	private static JdbcUtil jdbcUtil = new JdbcUtil();
	private static String administrator_table_name = "adminstrator";
	private static String teacher_table_name = "teacher";
	private static String student_table_name = "student";
	private static String studentCourse_table_name = "student_course";
	private static String course_table_name = "course";
	private static String teacherSalary_table_name = "teacher_salary";
	public static final int administrator_identify = 0;
	public static final int teacher_identify = 1;
	public static final int student_identity = 2;
	public static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

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
		String sql = "update %s set password=? where id=?";
	
		Object obj = getUser(userId, identify);
		if (obj == null) {
			jdbcUtil.releaseConn(conn);
			logger.info(String.format("[ %s ]账户不存在！！", userId));
			return false;
		} else {
			
			if (identify == teacher_identify) {
				sql = String.format(sql, teacher_table_name);

			} else if (identify == student_identity) {
				sql = String.format(sql, student_table_name);
			}
			PreparedStatement preparedStatement = (PreparedStatement) conn.prepareStatement(sql);
			preparedStatement.setString(1, MD5Util.getMD5(newPassword));
			preparedStatement.setString(2, userId);

			int count = preparedStatement.executeUpdate();
			jdbcUtil.release(preparedStatement, conn);
			if (count <= 0) {
				logger.info(String.format("更新 [ %s ]密码失败 ", userId));

				return false;
			}
			logger.info(String.format("更新  [ %s] 密码成功 ", userId));
		}
		return true;
	}

	@Override
	public boolean addStudent(Student student) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = null;
		PreparedStatement st;
		if (student.getEmail() == null) {
			student.setEmail("null");
		}
		if (student.getPassword() == null) {
			student.setPassword("123456");
		}
		sql = "insert into %s (name,enroll_time,email,password,identify_id) values (?,?,?,?,?)";
		sql = String.format(sql, student_table_name);
		st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, student.getName());
		st.setDate(2, student.getEnroll_time());
		st.setString(3, student.getEmail());
		st.setString(4, MD5Util.getMD5(student.getPassword()));
		st.setString(5, student.getIdentify_id());

		st.execute();
		int rs = st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if (rs <= 0) {
			logger.debug(String.format("插入学生[ %s] 失败", student.getName()));
			return false;
		}
		logger.debug(String.format("插入学生 [ %s ]成功", student.getName()));
		return true;
	}

	@Override
	public boolean addTeacher(Teacher teacher) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format(
				"insert into %s (name,kind,base_salary,password,identify_id,entertime)values (?,?,?,?,?,?)",
				teacher_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		if (teacher.getPassword() == null) {
			teacher.setPassword("123456");
		}
		st.setString(1, teacher.getName());
		st.setInt(2, teacher.getKind());
		st.setInt(3, teacher.getBase_salary());
		st.setString(4, MD5Util.getMD5(teacher.getPassword()));
		st.setString(5, teacher.getIdentify_id());
		st.setDate(6, teacher.getEntertime());
		st.execute();
		int r = st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if (r <= 0) {
			logger.debug(String.format("插入教师[ %s] 失败", teacher.getName()));
			return false;
		} else {
			logger.debug(String.format("插入教师 [ %s ]成功", teacher.getName()));
			return true;
		}
	}

	@Override
	public boolean modifyStudent(String student_id, Student student) throws SQLException {
		Student stu = (Student) getUser(student_id, student_identity);
		if (stu == null) {
			logger.info(String.format("学生[ %s ] 不存在！", student_id));
			return false;
		}
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("update %s set name=?,enroll_time=?,email=?,identify_id=? where id=?",
				student_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, student.getName());
		st.setDate(2, student.getEnroll_time());
		st.setString(3, student.getEmail());
		st.setString(4, student.getIdentify_id());
		st.setString(5, student_id);
		st.execute();
		int r = st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if (r <= 0) {
			logger.info(String.format("更新学生[ %s ]信息 失败！", student_id));
			return false;
		} else {
			logger.info(String.format("更新学生[ %s ]信息成功！", student_id));
			return true;
		}

	}

	@Override
	public boolean modifyTeacher(String teacher_id, Teacher teacher) throws SQLException {
		Teacher tch = (Teacher) getUser(teacher_id, teacher_identify);
		if (tch == null) {
			logger.info(String.format("教师[ %s ] 不存在！", teacher_id));
			return false;
		}
		Connection conn = jdbcUtil.getConnection();
		String sql =String.format("update %s set name=?,kind=?,base_salary=?,identify_id=?,incumbency=?,entertime=? where id=?",teacher_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacher.getName());
		st.setInt(2, teacher.getKind());
		st.setInt(3, teacher.getBase_salary());
		st.setString(4, teacher.getIdentify_id());
		st.setInt(5, teacher.getIncumbency());
		st.setDate(6, teacher.getEntertime());
		st.setString(7, teacher_id);
		int r=st.executeUpdate();
		jdbcUtil.release(st, conn);
		if (r<=0) {
			logger.info(String.format("更新教师[ %s ]信息 失败！", teacher_id));
			return false;
		} else {
			logger.info(String.format("更新教师[ %s ]信息成功！", teacher_id));
			return true;
		}
	}

	@Override
	public boolean delUser(String user_id, int identify) throws SQLException {
		Object user = getUser(user_id, identify);
		if (user == null) {
			logger.info(String.format("用户[ %s ] 不存在！", user_id));
			return false;
		}
		Connection conn = jdbcUtil.getConnection();
		String sql = "delete from %s where id=?";
		
		if (identify == teacher_identify) {
			sql=String.format(sql, teacher_table_name);
		} else if (identify == student_identity) {
			sql=String.format(sql, student_table_name);
		}
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, user_id);
		st.execute();
		int r=st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if (r<=0) {
			logger.info(String.format("删除用户[ %s ] 失败！", user_id));
			return false;

		} else {
			logger.info(String.format("删除用户[ %s ] 成功！", user_id));
			return true;
		}

	}

	@Override
	public Object getUser(String user_id, int identify) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from %s where id= ?";
		

		if (identify == administrator_identify) {
			sql=String.format(sql, administrator_table_name);
		} else if (identify == teacher_identify) {
			sql=String.format(sql, teacher_table_name);
		} else if (identify == student_identity) {
			sql=String.format(sql, student_table_name);
		}
		PreparedStatement pStatement = (PreparedStatement) conn.prepareStatement(sql);
		pStatement.setString(1, user_id);
		ResultSet rs = pStatement.executeQuery();
		while (rs.next()) {
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
				teacher.setEntertime(rs.getDate("entertime"));
				teacher.setIncumbency(rs.getInt("Incumbency"));
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
		String sql = "select * from %s";
		
		ArrayList users = null;
		if (identify == administrator_identify) {
			users = new ArrayList<Administrator>();
			sql=String.format(sql, administrator_table_name);
		} else if (identify == teacher_identify) {
			users = new ArrayList<Teacher>();
			sql=String.format(sql, teacher_table_name);
		} else if (identify == student_identity) {
			users = new ArrayList<Student>();
			sql=String.format(sql, student_table_name);
		}
		PreparedStatement pStatement = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pStatement.executeQuery();

		while (rs.next()) {
			if (identify == teacher_identify) {
				Teacher teacher = new Teacher();
				teacher.setId(rs.getString("id"));
				teacher.setPassword(rs.getString("password"));
				teacher.setName(rs.getString("name"));
				teacher.setKind(rs.getInt("kind"));
				teacher.setBase_salary(rs.getInt("base_salary"));
				teacher.setIdentify_id(rs.getString("identify_id"));
				teacher.setEntertime(rs.getDate("entertime"));
				teacher.setIncumbency(rs.getInt("Incumbency"));
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
		String sql = "select * from %s where identify_id= ?";
		
		if (identify == administrator_identify) {
			sql=String.format(sql, administrator_table_name);
		} else if (identify == teacher_identify) {
			sql=String.format(sql, teacher_table_name);
		} else if (identify == student_identity) {
			sql=String.format(sql, student_table_name);
		}
		PreparedStatement pStatement = (PreparedStatement) conn.prepareStatement(sql);
		pStatement.setString(1, identifyId);
		ResultSet rs = pStatement.executeQuery();
		while (rs.next()) {

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
	public Course getCourse(String course_id) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("select * from %s where course_id=?",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course_id);
		ResultSet rs = st.executeQuery();
		Course course = null;
		while (rs.next()) {
			course = new Course();
			course.setCourse_ID(rs.getString("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getTimestamp("time"));
			course.setRest_time(rs.getTimestamp("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setPrice(rs.getInt("price"));
			course.setStatus(rs.getInt("status"));
		}
		jdbcUtil.release(st, rs, conn);
		return course;
	}

	@Override
	public ArrayList<Course> getCoursesByTime(Timestamp startDate, Timestamp endDate) throws SQLException {
		ArrayList<Course> courses = new ArrayList<Course>();
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("select * from %s where time>= ? and rest_time<= ? ",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setTimestamp(1, startDate);
		st.setTimestamp(2, endDate);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getString("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getTimestamp("time"));
			course.setRest_time(rs.getTimestamp("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setPrice(rs.getInt("price"));
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
		String sql = String.format("select * from %s where (student_id =? or teacher_id=?) and status =?",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, user_id);
		st.setString(2, user_id);
		st.setInt(3, courseStatus);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getString("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getTimestamp("time"));
			course.setRest_time(rs.getTimestamp("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setPrice(rs.getInt("price"));
			course.setStatus(rs.getInt("status"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public void setSatification(String course_id, int score) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("update %s set satisfaction = ? where course_id= ? ",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setInt(1, score);
		st.setString(2, course_id);
		int r = st.executeUpdate();
		if (r >= 1) {
			logger.info(String.format("[ %s ] is set satification successfully -> %s", course_id,
					df.format(new java.util.Date())));
		} else {
			logger.info(String.format("[ %s ] is set satification failed -> %s", course_id,
					df.format(new java.util.Date())));
		}
		jdbcUtil.release(st, conn);
	}

	@Override
	public void setEvaluate(String course_id, String evaluate) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("update %s set evaluate=?,status=? where course_id=? and status=1",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, evaluate);
		st.setInt(2, 2);
		st.setString(3, course_id);
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
	public ArrayList<Student_course> getCourse(String teacher_id,String student_id) throws SQLException{
		ArrayList<Student_course> student_courses=new ArrayList<Student_course>();
		Connection conn=jdbcUtil.getConnection();
		String sql=String.format("select * from %s where teacher_id=? and student_id=?",studentCourse_table_name);
		PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacher_id);
		st.setString(2, student_id);
		
		ResultSet rs=st.executeQuery();
		while(rs.next()) {
			Student_course student_course=new Student_course();
			student_course.setCourse_name(rs.getString("course_name"));
			student_course.setStudent_id(rs.getString("student_id"));
			student_course.setTeacher_id(rs.getString("teacher_id"));
			student_course.setPrice(rs.getInt("price"));
			student_course.setNum(rs.getInt("num"));
			student_courses.add(student_course);	
		}
		jdbcUtil.release(st, rs, conn);
		return student_courses;
	}
	@Override
	public ArrayList<Course> getAllCoursePasses(Timestamp startDate, Timestamp endDate) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		ArrayList<Course> courses = new ArrayList<Course>();
		String sql = String.format("select * from %s where time>? and rest_time< ? and status >=1",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setTimestamp(1, startDate);
		st.setTimestamp(2, endDate);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getString("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getTimestamp("time"));
			course.setRest_time(rs.getTimestamp("rest_time"));
			course.setName(rs.getString("name"));
			String satisfactionStr = rs.getString("satisfaction");
			if (satisfactionStr != null) {
				course.setSatisfaction(Integer.parseInt(satisfactionStr));
			}
			course.setEvaluate(rs.getString("evaluate"));
			course.setPrice(rs.getInt("price"));
			course.setStatus(rs.getInt("status"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public boolean addCourse(Student_course student_course) throws SQLException{
		Connection conn=jdbcUtil.getConnection();
		String sql=String.format("insert into %s (course_name,teacher_id,student_id,price,num)values(?,?,?,?,?)", studentCourse_table_name);
		PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, student_course.getCourse_name());
		st.setString(2, student_course.getTeacher_id());
		st.setString(3, student_course.getStudent_id());
		st.setInt(4, student_course.getPrice());
		st.setInt(5, student_course.getNum());
		st.execute();
		int r=st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if(r<=0) {
			logger.info(String.format("add student_course [ %s ] failed -> %s", student_course.getCourse_name(),
					df.format(new java.util.Date())));
			return false;
		}else {
			logger.info(String.format("add student_course [ %s ] successfully -> %s", student_course.getCourse_name(),
					df.format(new java.util.Date())));
			return true;
		}
	}
	@Override
	public boolean arrangeCourse(Course course) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql =String.format( "insert into %s (student_id,teacher_id,time,rest_time,name,price) values (?,?,?,?,?,?)",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, course.getStudent_ID());
		st.setString(2, course.getTeacher_ID());
		st.setTimestamp(3, course.getTime());
		st.setTimestamp(4, course.getRest_time());
		st.setString(5, course.getName());
		st.setInt(6, course.getPrice());
		st.execute();
		int r=st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if (r<=0) {
			logger.info(String.format("add course [ %s ] failed -> %s", course.getCourse_ID(),
					df.format(new java.util.Date())));
			return false;
		} else {
			logger.info(String.format("add course [ %s ] successfully -> %s", course.getCourse_ID(),
					df.format(new java.util.Date())));
			return true;
		}
		
	}

	@Override
	public boolean delCourse(String course_id) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("delete from %s where course_id =?",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareCall(sql);
		st.setString(1, course_id);
		st.execute();
		int r=st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if (r<=0) {
			logger.info(String.format("delete course [ %s ] failed -> %s", course_id,
					df.format(new java.util.Date())));
			return false;
		} else {
			logger.info(String.format("delete course [ %s ] successfully -> %s", course_id, df.format(new java.util.Date())));
			return true;
		}
		
	}

	@Override
	public ArrayList<Course> waitSatisCourses(String student_id) throws SQLException {
		ArrayList<Course> courses = new ArrayList<Course>();
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("select * from %s where satisfaction=-1 and student_id=?",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, student_id);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getString("course_id"));
			course.setTeacher_ID(rs.getString("teacher_id"));
			course.setTime(rs.getTimestamp("time"));
			course.setRest_time(rs.getTimestamp("rest_time"));
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
		String sql = String.format("select * from %s where status=1 and teacher_id=?",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacher_id);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Course course = new Course();
			course.setCourse_ID(rs.getString("course_id"));
			course.setStudent_ID(rs.getString("student_id"));
			course.setTime(rs.getTimestamp("time"));
			course.setRest_time(rs.getTimestamp("rest_time"));
			course.setName(rs.getString("name"));
			courses.add(course);
		}
		jdbcUtil.release(st, rs, conn);
		return courses;
	}

	@Override
	public boolean setCoursePass(String course_id) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("update %s set status = ? where course_id= ? and status=0 ",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setInt(1, 1);// 1
		st.setString(2, course_id);
		int r = st.executeUpdate();
		jdbcUtil.release(st, conn);
		if (r >= 1) {
			logger.info(String.format("[ %s ] is set course pass successfully -> %s", course_id,
					df.format(new java.util.Date())));
			return true;

		} else {
			logger.info(String.format("[ %s ] is set course pass failed -> %s", course_id,
					df.format(new java.util.Date())));
			return false;
		}
	}

	@Override
	public boolean setCoursePass(String teacher_id, String student_id, Timestamp course_time) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("update %s set status = ? where teacher_id= ? and student_id=? and time=? and status=0",course_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setInt(1, 1);
		st.setString(2, teacher_id);
		st.setString(3, student_id);
		st.setTimestamp(4, course_time);
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
		String sql = String.format("select * from %s where teacher_id= ? and time= ?",teacher_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
	
		st.setString(1, teacher_id);
		st.setString(2, salary_time);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			Teacher_salary teacher_salary = new Teacher_salary();
			teacher_salary.setTeacher_id(rs.getString("teacher_id"));
			teacher_salary.setTime(rs.getString("time"));
			teacher_salary.setBonus(rs.getInt("bonus"));
			teacher_salary.setSalary(rs.getInt("salary"));
			jdbcUtil.release(st, rs, conn);
			return teacher_salary;
		}
		jdbcUtil.release(st, rs, conn);
		return null;
	}

	@Override
	public ArrayList<Teacher_salary> getSalaries(String teacher_id, String startTime, String endTime)
			throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql =String.format("select * from %s where time between ? and ?",teacherSalary_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		//st.setString(1, teacherSalary_table_name);
		st.setString(1, startTime);
		st.setString(2, endTime);
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
		String sql = String.format("select * from %s where time=?",teacherSalary_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		//st.setString(1, teacherSalary_table_name);
		st.setString(1, time);
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
		String sql = String.format("select * from %s where time between ? and ?",teacherSalary_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		//st.setString(1, teacherSalary_table_name);
		st.setString(1, startTime);
		st.setString(2, endTime);
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
		String sql = String.format("update %s set bonus=? where teacher_id=?, time=?",teacherSalary_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		//st.setString(1, teacherSalary_table_name);
		st.setInt(1, bonus);
		st.setString(2, teacher_id);
		st.setString(3, salary_time);
		st.execute();
		int r=st.getUpdateCount();
		jdbcUtil.release(st, conn);
		if (r<=0) {
			logger.info(String.format("set [ %s ] %s 奖金 [ %d ] 成功 ->%s", teacher_id, salary_time, bonus,
					df.format(new java.util.Date())));
			return false;
		} else {
			logger.info(String.format("set [ %s ] %s 奖金 [ %d ] 失败->%s", teacher_id, salary_time, bonus,
					df.format(new java.util.Date())));
			return true;
		}
	}

	public void test() throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = "select * from student";
		PreparedStatement st = (PreparedStatement) conn.prepareCall(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			System.out.println(rs.toString());

		}
		jdbcUtil.release(st, conn);
	}

	@Override
	public ArrayList<Teacher_salary> getSalariesById(String teacher_id) throws SQLException {
		Connection conn = jdbcUtil.getConnection();
		String sql = String.format("select * from %s where teacher_id=?",teacherSalary_table_name);
		PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
		st.setString(1, teacher_id);
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

}
