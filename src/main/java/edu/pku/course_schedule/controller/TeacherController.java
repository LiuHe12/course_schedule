package edu.pku.course_schedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	@RequestMapping(value = { "/teacher" }, method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView teacherHome(HttpServletRequest request, ModelAndView mav) {
		Course_Service cs=new Course_Service_Imp();
		Teacher teacher=(Teacher) request.getSession().getAttribute("user");
		 ArrayList<Course> courses=cs.getCoursesByUserId(teacher.getId());
		 mav.addObject("courses",courses);
		 return mav;
	}

//	@RequestMapping(value = { "/salary" }, method = {RequestMethod.POST,RequestMethod.GET})
//	private ModelAndView getSalary(ModelAndView mav, HttpServletRequest request) {
//		Salary_Service ss = new Salary_Service_Imp();
//		if ((Integer) request.getSession().getAttribute("identity") == 1) {
//			Teacher teacher = (Teacher) request.getSession().getAttribute("user");
//			ArrayList<Teacher_salary> teacher_salaries = ss.getSalariesById(teacher.getId());
//			mav.addObject("teacher_salaries", teacher_salaries);
//		} else {
//			mav.addObject("error", "请以老师身份登录！");
//			mav.setViewName("forward:/login");
//		}
//		return mav;
//	}
}
