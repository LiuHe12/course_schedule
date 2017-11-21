package edu.pku.course_schedule.services;

import java.util.ArrayList;

import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;

/**   
* @Title:  User_Service
* @Package edu.pku.course_schedule.services;
* @Description: şı¨æˆ·şıåŠ¡ç±şı
* @author Haylee  
* @date 2017/11/15
* @version V1.0   
*/
public interface User_Service {

	public Object login(String userId,String password,int identify);//şı¨æˆ·şı»åşı
	
	public void modifyPassword(String userId,int identify,String newPassword);//ä¿®æ”¹å¯†çşı
	
	public boolean addStudent(Student student);//æ·»åşıå­¦çşı
	
	public boolean addTeacher(Teacher teacher);//æ·»åşışıåşı
	
	public boolean modifyStudent(String student_id,Student student);//ä¿®æ”¹å­¦çşıä¿¡æ¯
	
	public boolean modifyTeacher(String teacher_id,Teacher teacher);//ä¿®æ”¹şıåşıä¿¡æ¯
	
	public boolean delUser(String user_id,int identify);//şı é™¤şı¨æˆ·
	
	public Object getUser(String user_id,int identify);//şı·åşışı¨æˆ·ä¿¡æ¯
	
	public ArrayList<Object> getAllUser(int identify);//şı·åşışışışışı‡åşıèº«ä»½şı¨æˆ·ä¿¡æ¯
	
	public Object getUserByIdentityId(String identifyId,int identify);//şı¹æ®èº«ä»½è¯å·şı¥æ‰¾şı¨æˆ·
	
}
