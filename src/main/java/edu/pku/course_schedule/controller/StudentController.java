package edu.pku.course_schedule.controller;

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
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.Course_Service;
import edu.pku.course_schedule.services.impl.Course_Service_Imp;
@Controller
public class StudentController {
	private Logger logger=Logger.getLogger(StudentController.class);
	@RequestMapping(value = "/student", method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getAdmin(ModelAndView mav,HttpServletRequest request) {
		Course_Service cs=new Course_Service_Imp();
		Student student=(Student) request.getSession().getAttribute("user");
		 ArrayList<Course> courses=cs.getCoursesByUserId(student.getId());
		 mav.addObject("courses",courses);
		 return mav;
	}

}
