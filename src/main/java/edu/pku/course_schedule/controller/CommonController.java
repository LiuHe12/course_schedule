package edu.pku.course_schedule.controller;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Administrator;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.User_Service;
import edu.pku.course_schedule.services.impl.User_Service_Imp;
import edu.pku.course_schedule.util.MD5Util;
@Controller
public class CommonController {
	private Logger logger=Logger.getLogger(CommonController.class);
	@RequestMapping(value = "/change-my-pwd", method = { RequestMethod.GET,RequestMethod.POST})
	public ModelAndView changePwd(ModelAndView mav,HttpServletRequest request) {
		
		int identity=(Integer) request.getSession().getAttribute("identity");
		String oldPwd=null;
		String userId=null;
		if(identity==0) {
			Administrator adm=(Administrator) request.getSession().getAttribute("user");
			oldPwd=adm.getPassword();
			userId=adm.getId();		
			mav.setViewName("redirect:/admin");
		}else if(identity==1){
			Teacher teacher=(Teacher) request.getSession().getAttribute("user");
			oldPwd=teacher.getPassword();
			userId=teacher.getId();
			mav.setViewName("redirect:/teacher");
		}else if(identity==2){
			Student student=(Student) request.getSession().getAttribute("user");
			oldPwd=student.getPassword();
			userId=student.getId();
			mav.setViewName("redirect:/student");
		}
		if(!oldPwd.equals(MD5Util.getMD5(request.getParameter("oldPwd")))) {
			mav.addObject("error","原密码错误！请重试！");
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
