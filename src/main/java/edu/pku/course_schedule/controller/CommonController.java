package edu.pku.course_schedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
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
	private Logger logger=Logger.getLogger(CommonController.class);
	@RequestMapping(value = "/change-my-pwd", method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView changePwd(ModelAndView mav,HttpServletRequest request) {
		Object user=request.getSession().getAttribute("user");
		if(user==null) {
			mav.addObject("error", "请先登录！");
			mav.setViewName("forward:/login");
			return mav;
		}
		int identity=(Integer) request.getSession().getAttribute("identity");
		
		String oldPwd=null;
		String userId=null;
		if(identity==0) {
			Administrator adm=(Administrator) user;
			oldPwd=adm.getPassword();
			userId=adm.getId();		
			mav.setViewName("redirect:/admin");
		}else if(identity==1){
			Teacher teacher=(Teacher)user;
			oldPwd=teacher.getPassword();
			userId=teacher.getId();
			mav.setViewName("redirect:/teacher");
		}else if(identity==2){
			Student student=(Student)user;
			oldPwd=student.getPassword();
			userId=student.getId();
			mav.setViewName("redirect:/student");
		}
		logger.info("old" +oldPwd);
		logger.info("input "+MD5Util.getMD5(request.getParameter("oldpassword")) );
		if(!oldPwd.equals(MD5Util.getMD5(request.getParameter("oldpassword")))) {
			mav.addObject("error","old password wrong!");
			mav.setViewName("redirect:/change-password");
		}else {
			String newPwd=request.getParameter("password");
			User_Service us=new User_Service_Imp();
			boolean r=us.modifyPassword(userId, identity, newPwd);
			if(!r) {
				mav.setViewName("redirect:/change-password");
			}
		}
		return mav;
	}
	

}
