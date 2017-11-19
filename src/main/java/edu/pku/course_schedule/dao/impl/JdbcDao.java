package edu.pku.course_schedule.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class JdbcDao implements Dao{

	private Logger logger=Logger.getLogger(JdbcDao.class);
	private static JdbcUtil jdbcUtil=new JdbcUtil();
	private static String administrator_table_name="administrator";
	private static String teacher_table_name="teacher";
	private static String student_table_name="student";
	private static String studentCourse_table_name="student_course";
	private static String course_table_name="course";
	private static String teacherSalary_table_name="teacher_salary";
	private static final int administrator_identify=0;
	private static final int teacher_identify=1;
	private static final int student_identity=2;
	
	@Override
	public Object login(String userId, String password, int identify) throws SQLException {
		Connection conn=jdbcUtil.getConnection();
		String sql="select * from ? where id= ?";
		PreparedStatement pStatement=(PreparedStatement)conn.prepareStatement(sql);
		
		if(identify==administrator_identify) {
			pStatement.setString(1, administrator_table_name);
		}	
		else if(identify==teacher_identify) {
			pStatement.setString(1, teacher_table_name);
		}else if(identify==student_identity) {
			pStatement.setString(1, student_table_name);
		}
		pStatement.setString(2, userId);
		ResultSet rs=pStatement.executeQuery();
		if(rs.next()) {
			if(!rs.getString("password").equals(MD5Util.getMD5(password))) {
				return null;
			}else {
				if(identify==administrator_identify) {
					Administrator administrator=new Administrator();
					administrator.setId(userId);
					administrator.setPassword(password);
					jdbcUtil.release(pStatement, rs, conn);
					return administrator;
				}else if(identify==teacher_identify) {
					 Teacher teacher=new Teacher();
					 teacher.setId(userId);
					 teacher.setPassword(password);
					 teacher.setName(rs.getString("name"));
					 teacher.setKind(rs.getInt("kind"));
					 teacher.setBase_salary(rs.getInt("base_salary"));
					 teacher.setIdentify_id(rs.getString("identify_id"));
					 jdbcUtil.release(pStatement, rs, conn);
					 return teacher;
				}else if(identify==student_identity) {
					Student student=new Student();
					student.setId(userId);
					student.setName(rs.getString("name"));
					student.setPassword(password);
					student.setEnroll_time(rs.getDate("enroll_time"));
					String email=rs.getString("email");
					if(email!=null) {
						student.setEmail(email);
					}
					student.setIdentify_id(rs.getString("identify_id"));
					jdbcUtil.release(pStatement, rs, conn);
					return student;
				}
			}
		}	
		jdbcUtil.release(pStatement, rs, conn);
		return null;
	}

	@Override
	public boolean modifyPassword(String userId, int identify, String newPassword) throws SQLException {
		Connection conn=jdbcUtil.getConnection();
		String sql="update ? set password=? where id=?";
		PreparedStatement preparedStatement=(PreparedStatement) conn.prepareStatement(sql);
		Object obj=getUser(userId, identify);
		if(obj!=null) {
			jdbcUtil.release(preparedStatement, conn);
			logger.info(String.format("[ %s ]账户不存在！！", userId));
			return false;
		}else {
			if(identify==teacher_identify) {
				preparedStatement.setString(1, teacher_table_name);

			}else if(identify==student_identity) {
				preparedStatement.setString(1, student_table_name);
			}
			preparedStatement.setString(2, newPassword);
			preparedStatement.setString(3, userId);
			
			int count=preparedStatement.executeUpdate();
			if(count<=0) {
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
		Connection conn=jdbcUtil.getConnection();
		String sql=null;
		PreparedStatement st;
		if(student.getEmail()!=null) {
			sql="insert into ? values (?,?,?,?,?)";
			st=(PreparedStatement)conn.prepareStatement(sql);
			st.setString(2, student.getName());
			st.setDate(3, student.getEnroll_time());
			st.setString(4,student.getEmail());
			st.setString(5, student.getIdentify_id());
		}else {
			sql="insert into ? (name,enroll_time,password,identify_id) values (?,?,?,?)";
			st=(PreparedStatement)conn.prepareStatement(sql);
			st.setString(2, student.getName());
			st.setDate(3, student.getEnroll_time());
			st.setString(4, student.getIdentify_id());
		}
		st.setString(1, student_table_name);
		boolean r=st.execute();
		jdbcUtil.release(st, conn);
		if(!r) {
			logger.debug(String.format("插入学生[ %s] 失败", student.getName()));
			return false;
		}
		logger.debug(String.format("插入学生 [ %s ]成功", student.getName()));
		return true;
	}

	@Override
	public boolean addTeacher(Teacher teacher) throws SQLException {
		Connection conn=jdbcUtil.getConnection();
		String sql="insert into ? values (?,?,?,?,?)";
		PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
		
		st.setString(1, teacher_table_name);
		st.setString(2, teacher.getName());
		st.setInt(3, teacher.getKind());
		st.setInt(4, teacher.getBase_salary());
		st.setString(5, MD5Util.getMD5(teacher.getPassword()));
		st.setString(6, teacher.getIdentify_id());
		boolean r=st.execute();
		jdbcUtil.release(st, conn);
		if(!r) {
			logger.debug(String.format("插入教师[ %s] 失败", teacher.getName()));
			return false;
		}
		logger.debug(String.format("插入教师 [ %s ]成功", teacher.getName()));
		return true;
	}

	@Override
	public boolean modifyStudent(String student_id, Student student) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modifyTeacher(String teacher_id, Teacher teacher) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delUser(String user_id, int identify) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object getUser(String user_id, int identify) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getAllUser(int identify) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getUserByName(String identifyId, int identify) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Course getCourse(int course_id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Course> getCoursesByTime(Date startDate, Date endDate) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Course> getCoursesByUserId(String user_id, int courseStatus) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setSatification(int course_id, int score) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setEvaluate(int course_id, String evaluate) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Course> getAllCoursePasses(Date startDate, Date endDate) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addCourse(Course course) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delCourse(int course_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Course> waitEvaluateCourses(String teacher_id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean setCoursePass(int course_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean setCoursePass(String teacher_id, String student_id, Date course_time) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Teacher_salary getSalary(String teacher_id, String salary_time) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Teacher_salary> getSalaries(String teacher_id, String startTime, String endTime)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Teacher_salary> getAllSalaries(String time) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Teacher_salary> getAllSalaries(String startTime, String endTime) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean setBonus(String teacher_id, String salary_time) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int calSalary(String teacher_id, String salary_time) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
