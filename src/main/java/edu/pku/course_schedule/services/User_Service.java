package edu.pku.course_schedule.services;

import java.util.ArrayList;

import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;

/**   
* @Title:  User_Service
* @Package edu.pku.course_schedule.services;
* @Description: ���户���务���
* @author Haylee  
* @date 2017/11/15
* @version V1.0   
*/
public interface User_Service {

	public Object login(String userId,String password,int identify);//���户������
	
	public boolean modifyPassword(String userId,int identify,String newPassword);//修改密���
	
	public boolean addStudent(Student student);//添���学���
	
	public boolean addTeacher(Teacher teacher);//添���������
	
	public boolean modifyStudent(String student_id,Student student);//修改学���信息
	
	public boolean modifyTeacher(String teacher_id,Teacher teacher);//修改������信息
	
	public boolean delUser(String user_id,int identify);//���除���户
	
	public Object getUser(String user_id,int identify);//���������户信息
	
	public ArrayList<Object> getAllUser(int identify);//������������������身份���户信息
	
	public Object getUserByIdentityId(String identifyId,int identify);//���据身份证号���找���户
	
}
