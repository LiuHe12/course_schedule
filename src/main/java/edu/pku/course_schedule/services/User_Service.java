package edu.pku.course_schedule.services;

import java.util.ArrayList;

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

	public Object login(String userId,String password,int identify);//用户登录
	
	public void modifyPassword(String userId,int identify,String newPassword);//修改密码
	
	public boolean addStudent(Student student);//添加学生
	
	public boolean addTeacher(Teacher teacher);//添加老师
	
	public boolean modifyStudent(String student_id,Student student);//修改学生信息
	
	public boolean modifyTeacher(String teacher_id,Teacher teacher);//修改老师信息
	
	public boolean delUser(String user_id,int identify);//删除用户
	
	public Object getUser(String user_id,int identify);//获取用户信息
	
	public ArrayList<Object> getAllUser(int identify);//获取所有指定身份用户信息
	
	public ArrayList<Object> getUserByName(String identifyId,int identify);//根据身份证号查找用户
	
}
