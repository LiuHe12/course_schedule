package edu.pku.course_schedule.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import edu.pku.course_schedule.dao.entity.Administrator;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.dao.entity.Teacher_salary;
import edu.pku.course_schedule.services.Salary_Service;
import edu.pku.course_schedule.services.User_Service;
import edu.pku.course_schedule.services.impl.Salary_Service_Imp;
import edu.pku.course_schedule.services.impl.User_Service_Imp;
import edu.pku.course_schedule.util.MD5Util;

@Controller
public class CommonController {
	private Logger logger = Logger.getLogger(CommonController.class);

	// @RequestMapping(value = "/", method = {
	// RequestMethod.GET,RequestMethod.POST})
	// public ModelAndView index(ModelAndView mav,HttpServletRequest request) {
	// request.getSession().
	// return mav;
	// }
	@RequestMapping(value = "/change-my-pwd", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView changePwd(ModelAndView mav, HttpServletRequest request) {
		Object user = request.getSession().getAttribute("user");
		if (user == null) {
			mav.addObject("error", "请先登录！");
			mav.setViewName("forward:/login");
			return mav;
		}
		int identity = (Integer) request.getSession().getAttribute("identity");

		String oldPwd = null;
		String userId = null;
		String newPwd = request.getParameter("password");
		if (identity == 0) {
			Administrator adm = (Administrator) user;
			oldPwd = adm.getPassword();
			userId = adm.getId();
			adm.setPassword(MD5Util.getMD5(newPwd));
			user = adm;
		} else if (identity == 1) {
			Teacher teacher = (Teacher) user;
			oldPwd = teacher.getPassword();
			userId = teacher.getId();
			teacher.setPassword(MD5Util.getMD5(newPwd));
			user = teacher;
		} else if (identity == 2) {
			Student student = (Student) user;
			oldPwd = student.getPassword();
			userId = student.getId();
			student.setPassword(MD5Util.getMD5(newPwd));
			user = student;
		}
		mav.setViewName("redirect:/index");
		// logger.info("old" +oldPwd);
		// logger.info("input "+MD5Util.getMD5(request.getParameter("oldpassword")) );
		if (!oldPwd.equals(MD5Util.getMD5(request.getParameter("oldpassword")))) {
			mav.addObject("error", "old password wrong!");
			mav.setViewName("redirect:/change-password");
		} else {

			User_Service us = new User_Service_Imp();
			boolean r = us.modifyPassword(userId, identity, newPwd);
			if (!r) {
				mav.setViewName("redirect:/change-password");
			} else {
				request.getSession().setAttribute("user", user);
			}
		}
		return mav;
	}

	@RequestMapping(value = "/salary", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView allSalary(ModelAndView mav, HttpServletRequest request) {
		Salary_Service ss = new Salary_Service_Imp();
		if ((Integer) request.getSession().getAttribute("identity") == 0) {
			ArrayList<Teacher_salary> teacher_salaries = ss.getAllSalaries();
			mav.addObject("teacher_salaries", teacher_salaries);
		} else if ((Integer) request.getSession().getAttribute("identity") == 1) {
			Teacher teacher = (Teacher) request.getSession().getAttribute("user");
			ArrayList<Teacher_salary> teacher_salaries = ss.getSalariesById(teacher.getId());
			mav.addObject("teacher_salaries", teacher_salaries);
		} else {
			mav.addObject("error", "请先登录！");
			mav.setViewName("forward:/login");
		}
		return mav;
	}

	@RequestMapping(value = "/change-password", method = RequestMethod.GET)
	public String changePassword(Locale locale, Model model) {
		return "change-password";
	}
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView index(ModelAndView mav, HttpServletRequest request) {
		if(request.getSession().getAttribute("identity")==null) {
			mav.setViewName("forward:/");
			return mav;
		}
		int identity = (Integer) request.getSession().getAttribute("identity");
		if(identity==0) {
			mav.setViewName("redirect:/admin");
		}else if(identity==1) {
			mav.setViewName("redirect:/teacher");
		}else if (identity==2){
			mav.setViewName("redirect:/student");
		}
		return mav;
	}

}
