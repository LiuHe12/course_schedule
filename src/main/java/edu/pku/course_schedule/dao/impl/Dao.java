package edu.pku.course_schedule.dao.impl;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import edu.pku.course_schedule.dao.entity.Administrator;
import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Student_course;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.dao.entity.Teacher_salary;
import edu.pku.course_schedule.services.Course_Service;

public interface Dao {
	public Object login(String userId,String password,int identify) throws SQLException;//�û���¼
	
	public boolean modifyPassword(String userId,int identify,String newPassword) throws SQLException;//�޸�����
	
	public boolean addStudent(Student student)throws SQLException;//���ѧ��
	
	public boolean addTeacher(Teacher teacher)throws SQLException;//�����ʦ
	
	public boolean addAdmin(Administrator admin)throws SQLException;
	
	public boolean modifyStudent(String student_id,Student student)throws SQLException;//�޸�ѧ����Ϣ
	
	public boolean modifyTeacher(String teacher_id,Teacher teacher)throws SQLException;//�޸���ʦ��Ϣ
	
	public boolean delUser(String user_id,int identify)throws SQLException;//ɾ���û�
	
	public Object getUser(String user_id,int identify)throws SQLException;//��ȡ�û���Ϣ
	
	public ArrayList<Object> getAllUser(int identify)throws SQLException;//��ȡ����ָ������û���Ϣ
	
	public Object getUserByIdentityId(String identifyId,int identify)throws SQLException;//�������֤�Ų����û�
	
	public Course getCourse(String course_id) throws SQLException;//ͨ���γ̺Ų��ҿγ���ϸ��Ϣ
	
	public ArrayList<Course> getCoursesByTime(Timestamp startDate,Timestamp endDate) throws SQLException;//����ָ��ʱ��ε����пγ�
	
	public ArrayList<Course> getCoursesByUserId(String user_id,int courseStatus) throws SQLException;//�����û��Ŀγ�(0���ţ�1δ��)
	
	public void setSatification(String course_id,int score) throws SQLException;//ѧ�����пγ�����ȴ��
	
	public void setEvaluate(String course_id,String evaluate)throws SQLException;//��ʦ���пγ���������
	
	public ArrayList<Course> getAllCoursePasses(Timestamp startDate,Timestamp endDate)throws SQLException;//���������Ѿ��Ϲ��Ŀ�
	
	public boolean arrangeCourse(Course course)throws SQLException;//��ӿγ�
	
	public boolean addCourse(Student_course student_course) throws SQLException;
	
	public boolean delCourse(String course_id)throws SQLException;//���ݿγ̺�ɾ���γ�
	
	public ArrayList<Course> waitSatisCourses(String student_id)throws SQLException;//�õ�ѧ������δ���ۿγ�
	
	public ArrayList<Course> waitEvaluateCourses(String teacher_id)throws SQLException;//�õ���ʦ����δ���ۿγ�
	
	public ArrayList<Student_course> getCourse(String teacher_id,String student_id) throws SQLException;;
	//public boolean delCourse(String teacher_id,String student_id,Date course_time);//���ݽ�ʦid,ѧ��id���Ͽ�ʱ��ɾ���γ�
	
	public boolean setCoursePass(String course_id)throws SQLException;//ͨ���γ̺����ÿγ�����
	
	public boolean setCoursePass(String teacher_id,String student_id,Timestamp course_time)throws SQLException;//������ʦid��ѧ��id���Ͽ�ʱ�������Ͽ�

	public Teacher_salary getSalary(String teacher_id,String salary_time)throws SQLException;//����ָ��ʱ����ʦ�Ĺ�����ϸ
	
	//��ȡ��ʦָ��ʱ��εĹ�����ϸ
	public ArrayList<Teacher_salary> getSalaries(String teacher_id,String startTime,String endTime)throws SQLException;
	
	public List<Teacher_salary> getAllSalaries(String time)throws SQLException;////����ָ��ʱ��������ʦ�Ĺ�����ϸ
	
	public List<Teacher_salary> getAllSalaries() throws SQLException;
	
	//��ȡ������ʦָ��ʱ��εĹ�����ϸ
	public ArrayList<Teacher_salary> getAllSalaries(String startTime,String endTime)throws SQLException;
	
	public boolean setBonus(String teacher_id,String salary_time,int bonus)throws SQLException;;//�趨��ʦָ��ʱ��Ľ���
	
	public ArrayList<Teacher_salary> getSalariesById(String teacher_id) throws SQLException;
	//public int calSalary(String teacher_id,String salary_time)throws SQLException;//������ʦָ��ʱ��Ĺ���
	public Student_course getStudentCourse(String teacher_id,String student_id,String name)  throws SQLException;

	public ArrayList<Student_course> getStudentCourses() throws SQLException;
	
	public ArrayList<Course> getCoursesByUserId(String user_id)throws SQLException;
	
	public boolean modifyCourseTime(Course course)throws SQLException;
	
	public boolean setRemind(String course_id,String remind) throws SQLException;
}
