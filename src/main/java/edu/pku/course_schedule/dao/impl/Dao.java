package edu.pku.course_schedule.dao.impl;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.dao.entity.Teacher_salary;

public interface Dao {
public Object login(String userId,String password,int identify) throws SQLException;//用户登录
	
	public boolean modifyPassword(String userId,int identify,String newPassword) throws SQLException;//修改密码
	
	public boolean addStudent(Student student)throws SQLException;//添加学生
	
	public boolean addTeacher(Teacher teacher)throws SQLException;//添加老师
	
	public boolean modifyStudent(String student_id,Student student)throws SQLException;//修改学生信息
	
	public boolean modifyTeacher(String teacher_id,Teacher teacher)throws SQLException;//修改老师信息
	
	public boolean delUser(String user_id,int identify)throws SQLException;//删除用户
	
	public Object getUser(String user_id,int identify)throws SQLException;//获取用户信息
	
	public ArrayList<Object> getAllUser(int identify)throws SQLException;//获取所有指定身份用户信息
	
	public ArrayList<Object> getUserByName(String identifyId,int identify)throws SQLException;//根据身份证号查找用户
	
	public Course getCourse(int course_id)throws SQLException;//通过课程号查找课程详细信息
	
	public ArrayList<Course> getCoursesByTime(Date startDate,Date endDate)throws SQLException;//查找指定时间段的所有课程
	
	public ArrayList<Course> getCoursesByUserId(String user_id,int courseStatus)throws SQLException;//查找用户的课程(0已排，1未排)
	
	public void setSatification(int course_id,int score)throws SQLException;//学生进行课程满意度打分
	
	public void setEvaluate(int course_id,String evaluate)throws SQLException;//老师进行课程评价内容
	
	public ArrayList<Course> getAllCoursePasses(Date startDate,Date endDate)throws SQLException;//查找所有已经上过的课
	
	public boolean addCourse(Course course)throws SQLException;//添加课程
	
	public boolean delCourse(int course_id)throws SQLException;//根据课程号删除课程
	
	public ArrayList<Course> waitEvaluateCourses(String teacher_id)throws SQLException;//得到老师已上未评价课程
	
	//public boolean delCourse(String teacher_id,String student_id,Date course_time);//根据教师id,学生id和上课时间删除课程
	
	public boolean setCoursePass(int course_id)throws SQLException;//通过课程号设置课程已上
	
	public boolean setCoursePass(String teacher_id,String student_id,Date course_time)throws SQLException;//根据老师id，学生id和上课时间标记已上课

	public Teacher_salary getSalary(String teacher_id,String salary_time)throws SQLException;//查找指定时间老师的工资明细
	
	//获取老师指定时间段的工资明细
	public ArrayList<Teacher_salary> getSalaries(String teacher_id,String startTime,String endTime)throws SQLException;
	
	public List<Teacher_salary> getAllSalaries(String time)throws SQLException;////查找指定时间所有老师的工资明细
	
	//获取所有老师指定时间段的工资明细
	public ArrayList<Teacher_salary> getAllSalaries(String startTime,String endTime)throws SQLException;
	
	public boolean setBonus(String teacher_id,String salary_time)throws SQLException;//设定老师指定时间的奖金
	
	public int calSalary(String teacher_id,String salary_time)throws SQLException;//计算老师指定时间的工资
}
