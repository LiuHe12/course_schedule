package edu.pku.course_schedule.services;

import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;

/**   
* @Title:  User_Service
* @Package edu.pku.course_schedule.services;
* @Description: 用户服务类 
* @author Haylee  
* @date 2017/11/15
* @version V1.0   
*/
public interface User_Service {

	public boolean login(String userId,String password);//用户登录
	
	public void modifyPassword();//修改密码
	
	public boolean addStudent(Student student);//添加学生
	
	public boolean addTeacher(Teacher teacher);//添加老师
	
	public boolean modifyStudent(String student_id,Student student);//修改学生信息
	
	public boolean modifyTeacher(String teacher_id,Teacher teacher);//修改老师信息
	
	//TODO 建议整合一下用户表，添加身份信息
	public boolean delUser(String user_id);//删除用户
}
