package edu.pku.course_schedule.controller;

import java.util.ArrayList;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.User_Service;
import edu.pku.course_schedule.services.impl.User_Service_Imp;

@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String charts(Locale locale, Model model) {
		logger.info("in charts function");
		return "charts";
	}
	
	@RequestMapping(value = "/widgets", method = RequestMethod.GET)
	public String widgets(Locale locale, Model model) {
		logger.info("in widgets function");
		return "widgets";
	}
	
	@RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) {
		logger.info("in tables function");
		return "tables";
	}
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public ModelAndView doModelAndView(ModelAndView mav){
		logger.info("in calendar function");
//        mav.addObject("name", name);
//        mav.addObject("password", password);
        mav.setViewName("/calendar");
        return mav;
    }
	@RequestMapping(value = "/form-common", method = RequestMethod.GET)
	public String formCommon(Locale locale, Model model) {
		logger.info("in form-common function");
		return "form-common";
	}
	
	@RequestMapping(value = "/form-validation", method = RequestMethod.GET)
	public String formValidation(Locale locale, Model model) {
		logger.info("in form-validation function");
		return "form-validation";
	}
	
	@RequestMapping(value = "/form-wizard", method = RequestMethod.GET)
	public String formWizard(Locale locale, Model model) {
		logger.info("in form-wizard function");
		return "form-wizard";
	}
	
//	@RequestMapping(value = "/student", method = RequestMethod.GET)
//	public String student(Locale locale, Model model) {
//		logger.info("in student function");
//		return "student";
//	}
//	@RequestMapping(value = "/teacher", method = RequestMethod.GET)
//	public String teacher(Locale locale, Model model) {
//		logger.info("in teacher function");
//		return "teacher";
//	}
	
	
	
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public String comment(Locale locale, Model model) {
		logger.info("in comment function");
		return "comment";
	}
	
	
	

	
	
//	@RequestMapping(value = "/all-salary", method = {RequestMethod.GET,RequestMethod.POST})
//	public String allSalary(Locale locale, Model model) {
//		logger.info("in all-salary function");
//		return "all-salary";
//	}
	
//	@RequestMapping(value = "/salary", method = {RequestMethod.GET,RequestMethod.POST})
//	public String salary(Locale locale, Model model) {
//		logger.info("in salary function");
//		return "salary";
//	}
}
