package edu.pku.course_schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class TeacherController {

	@RequestMapping(value = {"/teacher"}, method = RequestMethod.GET)
	public String getAdmin(HttpServletRequest request, HttpServletResponse response,HttpSession httpSession) {
		return "/teacher";
	}
	@RequestMapping(value = { "/teacher"}, method = RequestMethod.POST)
	public String postAdmin(HttpServletRequest request, HttpServletResponse response,HttpSession httpSession) {
		return "/teacher";
	}
}
