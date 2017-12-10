package edu.pku.course_schedule.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.User_Service;
import edu.pku.course_schedule.services.impl.User_Service_Imp;

@Controller
public class AdminController {
	private Logger logger = Logger.getLogger(AdminController.class);

	@RequestMapping(value = "/admin", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView setAdminHome(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| Integer.parseInt((String) (request.getSession().getAttribute("identity"))) != 0) {
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
		return mav;
	}

}
