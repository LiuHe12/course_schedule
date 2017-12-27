package edu.pku.course_schedule.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.dao.entity.Teacher_salary;
import edu.pku.course_schedule.services.Course_Service;
import edu.pku.course_schedule.services.Salary_Service;
import edu.pku.course_schedule.services.impl.Course_Service_Imp;
import edu.pku.course_schedule.services.impl.Salary_Service_Imp;

@Controller
public class TeacherController {
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private Logger logger = Logger.getLogger(TeacherController.class);

	@RequestMapping(value = { "/teacher" }, method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView teacherHome(HttpServletRequest request, ModelAndView mav) {
		Course_Service cs = new Course_Service_Imp();
	
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) !=1) {
			mav.addObject("error", "请以老师身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}
		ArrayList<Course> courses = null;
		String userId = (String) request.getSession().getAttribute("userId");
		if (userId != null) {
			courses = cs.getCoursesByUserId(userId);
		}
		StringBuilder sb = new StringBuilder();
		int index = 0;
		for (Course course : courses) {
			String title = course.getName() + "/" + course.getStudent_name() + "/" + course.getTeacher_name() + "/"
					+ course.getCourse_ID() + "/" + course.getStudent_ID() + "/" + course.getTeacher_ID();
			String start = df.format(course.getTime()).replace(' ', 'T');
			String end = df.format(course.getRest_time()).replace(' ', 'T');
			String color = null;
			if (course.getStatus() <= 0) {
				color = "blue";
			} else if(course.getStatus()==1){
				color = "red";
			}else {
				color = "gray";
			}
			String description=course.getRemind();
			if(description==null) {
				description="null";
			}
			forAdminshow ads = new forAdminshow(title, start, end, color,description);
			sb.append(ads.toString());
			index++;
			if (index != courses.size())
				sb.append(",");
		}
		mav.addObject("courses", sb.toString());
		request.getSession().setAttribute("courses", courses);
		return mav;
	}

	@RequestMapping(value = { "/addEvaluate" }, method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addEvaluate(HttpServletRequest request, ModelAndView mav) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) !=1) {
			mav.addObject("error", "请以老师身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}
		String course_id=request.getParameter("course_id");
		String evaluate=request.getParameter("evaluate");
		Course_Service cs = new Course_Service_Imp();
		logger.info(course_id+" "+evaluate);
		//cs.setEvaluate(course_id, evaluate);
		return mav;
	}
	
}
