package edu.pku.course_schedule.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.Course_Service;
import edu.pku.course_schedule.services.User_Service;
import edu.pku.course_schedule.services.impl.Course_Service_Imp;
import edu.pku.course_schedule.services.impl.User_Service_Imp;

@Controller
public class AdminController {
	private static Logger logger = Logger.getLogger(AdminController.class);
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@RequestMapping(value = "/admin", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView setAdminHome(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer)(request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/login");
			return mav;
		}
		
		
		User_Service us = new User_Service_Imp();
		ArrayList<Object> object_t = us.getAllUser(1);
		ArrayList<Object> object_s = us.getAllUser(2);
		ArrayList<Teacher> teachers = new ArrayList<Teacher>();
		ArrayList<Student> students = new ArrayList<Student>();
		for (Object obj : object_s) {
			students.add((Student) obj);
		}
		for (Object obj : object_t) {
			teachers.add((Teacher) obj);
		}
		mav.addObject("teachers", teachers);
		mav.addObject("students", students);
		
		
		Course_Service cs=new Course_Service_Imp();
		Calendar c1 = Calendar.getInstance();  
		Calendar c2 = Calendar.getInstance();  
	    c1.add(Calendar.MONTH, -1);    //得到前一个月 
	    String lastmonth = df.format(c1.getTime()); 
	    c2.add(Calendar.MONTH, +1);    //得到后一个月 
	    String nextmonth = df.format(c2.getTime()); 
	    //System.out.println(new Timestamp(df.parse(end).getTime()));
	    try {
	    	List<Course> courses=cs.getCoursesByTime(new Timestamp(df.parse(lastmonth).getTime()),new Timestamp(df.parse(nextmonth).getTime()));
	    	StringBuilder sb=new StringBuilder();
	    	int index=0;
	    	for(Course course:courses) {
	    		String title=course.getCourse_ID()+"/"+course.getStudent_ID()+"/"+course.getTeacher_ID();
	    		String start=df.format(course.getTime()).replace(' ', 'T');
	    		String end=df.format(course.getRest_time()).replace(' ', 'T');
	    		String color=null;
	    		if(course.getStatus()>0) {
	    			color="red";
	    		}else {
	    			color="blue";
	    		}
	    		forAdminshow ads=new forAdminshow(title, start, end, color);
	    		sb.append(ads.toString());
	    		index++;
	    		if(index!=courses.size())
	    			sb.append(",");
	    	}
	    	//TODO 删除注释
	    	//mav.addObject("courses", sb.toString());
	    	//logger.info(sb.toString());
	    } catch (ParseException e) {
			logger.info(e.toString());
			e.printStackTrace();
		}
			
		return mav;
	}

}
