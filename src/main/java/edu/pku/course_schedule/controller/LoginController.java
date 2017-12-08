package edu.pku.course_schedule.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Administrator;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.User_Service;
import edu.pku.course_schedule.services.impl.User_Service_Imp;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(LoginController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String getlogin(HttpServletRequest request, HttpServletResponse response) {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(HttpServletRequest request, HttpServletResponse response) {
		
//		System.out.println(request);
//		System.out.println(request.getParameter("userID"));
		String userId = request.getParameter("userID");
		String password = request.getParameter("password");
		int identify = Integer.parseInt(request.getParameter("identity"));
		try {
			User_Service us = new User_Service_Imp();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
//		Object object = us.login(userId, password, identify);
//		if (object != null) {
//			if (identify == 0) {
//				Administrator admin = (Administrator) object;
//				System.out.println(admin.toString());
//			} else if (identify == 1) {
//				Teacher teacher = (Teacher) object;
//			} else if (identify == 2) {
//				Student student = (Student) object;
//			}
//		}
		return "index";
	}

}