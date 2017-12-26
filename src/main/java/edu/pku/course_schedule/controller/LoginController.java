package edu.pku.course_schedule.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	private Logger logger=Logger.getLogger(LoginController.class);
	// private static final Logger logger =
	// LoggerFactory.getLogger(LoginController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = {"/" , "/login"}, method = RequestMethod.GET)
	public String getlogin(HttpServletRequest request, HttpServletResponse response,HttpSession httpSession) {
		request.getSession().invalidate();//TODO 返回登录界面清空session，带商榷
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView postlogin(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userID");
		String password = request.getParameter("password");
		String iden=request.getParameter("identity");
		int identify=0;
		if(iden!=null) {
			identify = Integer.parseInt(iden);
		}
		
		try {
			User_Service us = new User_Service_Imp();
			Object object = us.login(userId, password, identify);
			ModelAndView mav = null;
			if (object != null) {
				
				if (identify == 0) {
					Administrator admin = (Administrator) object;
					request.getSession().setAttribute("user", admin);
					request.getSession().setAttribute("identity", 0);
					request.getSession().setAttribute("userId", admin.getId());
					mav=new ModelAndView("redirect:/admin");
					mav.addObject("admain",admin);
					
				} else if (identify == 1) {
					Teacher teacher = (Teacher) object;
					request.getSession().setAttribute("user", teacher);
					request.getSession().setAttribute("identity",1);
					request.getSession().setAttribute("userId", teacher.getId());
					mav=new ModelAndView("redirect:/teacher");
					mav.addObject("teacher",teacher);
				} else if (identify == 2) {
					Student student = (Student) object;
					request.getSession().setAttribute("user", student);
					request.getSession().setAttribute("identity",2);	
					request.getSession().setAttribute("userId", student.getId());
					mav=new ModelAndView("redirect:/student");
					mav.addObject("student",student);
				}
			}else {
				mav=new ModelAndView("login");
				mav.addObject("error","密码或用户名错误！");
			}
			return mav;
		} catch (Exception e) {
			ModelAndView mav=new ModelAndView("login");
			mav.addObject("error","系统异常！");
			return new ModelAndView("login");
		}

		
	}

}