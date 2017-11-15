package edu.pku.course_schedule.services;

import java.util.ArrayList;
import java.util.List;
import edu.pku.course_schedule.dao.entity.Teacher_salary;

/**   
* @Title:  Salary_Service
* @Package edu.pku.course_schedule.services;
* @Description: 工资服务类 
* @author Haylee  
* @date 2017/11/15
* @version V1.0   
*/
public interface Salary_Service {

	public Teacher_salary getSalary(String teacher_id,String salary_time);//查找指定时间老师的工资明细
	
	//获取老师指定时间段的工资明细
	public ArrayList<Teacher_salary> getSalaries(String teacher_id,String startTime,String endTime);
	
	public List<Teacher_salary> getAllSalaries(String time);////查找指定时间所有老师的工资明细
	
	//获取所有老师指定时间段的工资明细
	public ArrayList<Teacher_salary> getAllSalaries(String startTime,String endTime);
	
	public boolean setBonus(String teacher_id,String salary_time);//设定老师指定时间的奖金
	
	public int calSalary(String teacher_id,String salary_time);//计算老师指定时间的工资
	
}
