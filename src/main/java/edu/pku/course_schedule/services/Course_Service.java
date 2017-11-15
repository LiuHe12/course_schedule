package edu.pku.course_schedule.services;

import java.sql.Date;
import java.util.ArrayList;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Course_pass;
/**   
* @Title:  Course_Service
* @Package edu.pku.course_schedule.services;
* @Description: 课程服务类 
* @author Haylee  
* @date 2017/11/15
* @version V1.0   
*/
public interface Course_Service {
	
	public Course getCourse(int course_id);//通过课程号查找课程详细信息
	
	public ArrayList<Course> getCourses(Date startDate,Date endDate);//查找指定时间段的所有课程
	
	public ArrayList<Course> getCourses(String user_id);//查找用户的所有课程
	
	public Course_pass getCourse_Pass(int Course);//通过课程号查找已上过课程的详细信息
	
	public ArrayList<Course_pass> getCourse_Passes(String teacher_id,String student_id);//
	
	public ArrayList<Course> getCourse_Passes(String user_id);//查找用户的所有已上课程
	
	public boolean addCourse(Course course);//添加课程
	
	public boolean delCourse(int course_id);//根据课程号删除课程
	
	//TODO 删除课程只需要老师ID和时间 或者学生ID和时间其实也OK，商量一下
	public boolean delCourse(String teacher_id,String student_id,Date course_time);//根据教师id,学生id和上课时间删除课程
	
	public boolean setCoursePass(int course_id);//通过课程号设置课程已上
	
	//TODO
	public boolean setCoursePass(String teacher_id,String student_id,Date course_time);//根据老师id，学生id和上课时间标记已上课


}
