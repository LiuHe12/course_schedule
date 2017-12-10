package edu.pku.course_schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Student;
@Controller
public class StudentController {
	private Logger logger=Logger.getLogger(StudentController.class);
	@RequestMapping(value = "/student", method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getAdmin(ModelAndView mav) {
		
		return mav;
		//return "/student";
	}

}
