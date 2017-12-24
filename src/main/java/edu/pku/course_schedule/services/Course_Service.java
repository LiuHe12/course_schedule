package edu.pku.course_schedule.services;

import java.awt.List;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student_course;
//import edu.pku.course_schedule.dao.entity.Course_pass;
/**   
* @Title:  Course_Service
* @Package edu.pku.course_schedule.services;
* @Description: 课程服务类 
* @author Haylee  
* @date 2017/11/15
* @version V1.0   
*/
public interface Course_Service {
	
	public Course getCourse(String course_id);//通过课程号查找课程详细信息
	
	public ArrayList<Course> getCoursesByTime(Timestamp startDate,Timestamp endDate);//查找指定时间段的所有课程
	
	public ArrayList<Course> getCoursesByUserId(String user_id,int courseStatus);//查找用户的课程(0已排，1未排)
	
	public ArrayList<Course> getCoursesByUserId(String user_id);
	public void setSatification(String course_id,int score);//学生进行课程满意度打分
	
	public void setEvaluate(String course_id,String evaluate);//老师进行课程评价内容
	
	public ArrayList<Course> getAllCoursePasses(Timestamp startDate,Timestamp endDate);//查找所有已经上过的课
	
	public boolean addCourse(Student_course student_course);//添加课程
	
	public boolean arrangeCourse(Course course);//添加课程
	public boolean delCourse(String course_id);//根据课程号删除课程
	
	public ArrayList<Course> waitSatisCourses(String student_id);//得到学生已上未评价课程
	
	public ArrayList<Course> waitEvaluateCourses(String teacher_id);//得到老师已上未评价课程
	
	//public boolean delCourse(String teacher_id,String student_id,Date course_time);//根据教师id,学生id和上课时间删除课程
	public ArrayList<Student_course> getStudentCourse(String teacher_id,String student_id );
	
	public Student_course getStudentCourse(String teacher_id,String student_id,String name);
	
	public boolean setCoursePass(String course_id);//通过课程号设置课程已上
	
	public boolean setCoursePass(String teacher_id,String student_id,Timestamp course_time);//根据老师id，学生id和上课时间标记已上课

	public ArrayList<Student_course> getStudentCourses();
	
	public boolean modifyCourse(Course course);
	//TODO邮件提醒上课功能
}
