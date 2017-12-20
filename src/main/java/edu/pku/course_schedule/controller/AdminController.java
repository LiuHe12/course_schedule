package edu.pku.course_schedule.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.CSS;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.pku.course_schedule.dao.entity.Course;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Student_course;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.services.Course_Service;
import edu.pku.course_schedule.services.User_Service;
import edu.pku.course_schedule.services.impl.Course_Service_Imp;
import edu.pku.course_schedule.services.impl.User_Service_Imp;

@Controller
public class AdminController {
	private static Logger logger = Logger.getLogger(AdminController.class);
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@RequestMapping(value = "/admin", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView setAdminHome(ModelAndView mav, HttpServletRequest request) {
		logger.info("enter /admin");
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/login");
			return mav;
		}

		User_Service us = new User_Service_Imp();
		if (request.getSession().getAttribute("teachers") == null) {
			logger.info("teachers null");
			ArrayList<Object> object_t = us.getAllUser(1);
			ArrayList<Teacher> teachers = new ArrayList<Teacher>();
			for (Object obj : object_t) {
				teachers.add((Teacher) obj);
			}
			request.getSession().setAttribute("teachers", teachers);
		}
		if (request.getSession().getAttribute("students") == null) {
			logger.info("students null");
			ArrayList<Object> object_s = us.getAllUser(2);
			ArrayList<Student> students = new ArrayList<Student>();
			for (Object obj : object_s) {
				students.add((Student) obj);
			}
			request.getSession().setAttribute("students", students);
		}
		
		mav.addObject("teachers", request.getSession().getAttribute("teachers"));

		mav.addObject("students", request.getSession().getAttribute("students"));

		Course_Service cs = new Course_Service_Imp();
		if (request.getSession().getAttribute("student_courses") == null) {
			logger.info("student_courses null");
			List<Student_course> student_courses = cs.getStudentCourses();
			
			request.getSession().setAttribute("student_courses", student_courses);
		}
		mav.addObject("student_courses", request.getSession().getAttribute("student_courses"));
		if (request.getSession().getAttribute("courses") == null) {
			logger.info("courses null");
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			c1.add(Calendar.MONTH, -1); // 得到前一个月
			String lastmonth = df.format(c1.getTime());
			c2.add(Calendar.MONTH, +1); // 得到后一个月
			String nextmonth = df.format(c2.getTime());
			List<Course> courses;
			try {
				courses = cs.getCoursesByTime(new Timestamp(df.parse(lastmonth).getTime()),
						new Timestamp(df.parse(nextmonth).getTime()));
				request.getSession().setAttribute("courses", courses);
			} catch (ParseException e) {
				logger.error(e.toString());
				e.printStackTrace();
			}
			
		}
		ArrayList<Course> courses = (ArrayList<Course>) request.getSession().getAttribute("courses");
		StringBuilder sb = new StringBuilder();
		int index = 0;
		for (Course course : courses) {
			String title = course.getCourse_ID() + "/" + course.getStudent_ID() + "/" + course.getTeacher_ID();
			String start = df.format(course.getTime()).replace(' ', 'T');
			String end = df.format(course.getRest_time()).replace(' ', 'T');
			String color = null;
			if (course.getStatus() > 0) {
				color = "red";
			} else {
				color = "blue";
			}
			forAdminshow ads = new forAdminshow(title, start, end, color);
			sb.append(ads.toString());
			index++;
			if (index != courses.size())
				sb.append(",");
		}
		mav.addObject("courses", sb.toString());
		
		return mav;
	}

	@RequestMapping(value = "/addCourse", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addCourse(ModelAndView mav, HttpServletRequest request) {
		logger.info("enter addCourse");
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/login");
			return mav;
		}
//		try {
//			request.setCharacterEncoding("utf-8");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		Student_course student_course = new Student_course();
		student_course.setStudent_id(request.getParameter("student_id"));
		student_course.setCourse_name(request.getParameter("course_name"));
		student_course.setTeacher_id(request.getParameter("teacher_id"));
		student_course.setNum(Integer.parseInt(request.getParameter("number")));
		student_course.setPrice(Integer.parseInt(request.getParameter("price")));
		Course_Service cs = new Course_Service_Imp();
		boolean r = cs.addCourse(student_course);
		mav.setViewName("redirect:/admin");
		if (!r) {
			mav.addObject("error", "添加课程失败！");
		} else {
			mav.addObject("error", "添加课程成功！");
		}
		return mav;
	}

	@RequestMapping(value = "/arrangeCourse", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView arrangeCourse(ModelAndView mav, HttpServletRequest request) {
		logger.info("enter /arrangeCourse");
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/login");
			return mav;
		}
		Course course = new Course();
		course.setStudent_ID(request.getParameter("student_id"));
		course.setTeacher_ID(request.getParameter("teacher_id"));
		// TODO coursename
		logger.info("classDate"+request.getParameter("classDate"));
		String classDate = request.getParameter("classDate").replace("/", "-");
		String time = request.getParameter("time") + ":00";
		String rest_time = request.getParameter("rest_time") + ":00";
		course.setName(request.getParameter("course_id"));

		try {
			course.setTime(new Timestamp(df.parse(classDate + " " + time).getTime()));
			course.setRest_time(new Timestamp(df.parse(classDate + " " + rest_time).getTime()));
		} catch (ParseException e) {
			logger.error("时间解析错误！" + e.toString());
			e.printStackTrace();
		}
		Course_Service cs = new Course_Service_Imp();
		ArrayList<Student_course> student_courses=null;
		if(request.getSession().getAttribute("student_courses")==null) {
			student_courses=cs.getStudentCourses();
			request.getSession().setAttribute("student_courses", student_courses);
		}else{
			student_courses = (ArrayList<Student_course>) request.getSession().getAttribute("student_courses");
		}
				
		for (Student_course student_course : student_courses) {
			if (student_course.getTeacher_id().equals(course.getStudent_ID())
					&& student_course.getStudent_id().equals(course.getStudent_ID())
					&& student_course.getCourse_name().equals(course.getName())) {
				course.setPrice(student_course.getPrice());
			} else {
				continue;
			}
		}
		
		boolean r = cs.arrangeCourse(course);
		
		if (!r) {
			mav.addObject("error", "排课失败！");
		} else {
			mav.addObject("error", "排课成功！");
		}
		mav.setViewName("redirect:/admin");
		request.getSession().setMaxInactiveInterval(20*60);
		return mav;
	}
	@RequestMapping(value = "/changePwd", method = { RequestMethod.GET,RequestMethod.POST})
	private ModelAndView changePwd(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/login");
			return mav;
		}
		String userId=request.getParameter("username");
		String newPassword=request.getParameter("password");
		int identity = 0;
		if(userId.substring(0, 1).equals("S")) {
			identity=2;
		}else if(userId.substring(0, 1).equals("T")) {
			identity=1;
		}
		User_Service us=new User_Service_Imp();
		boolean r=us.modifyPassword(userId, identity, newPassword);
		if(!r) {
			//mav.addObject("error","修改密码失败！");
			mav.setViewName("redirect:/change-user-password");
		}else {
			//mav.addObject("error","修改密码成功！");
			mav.setViewName("redirect:/admin");
		}	
		return mav;
	}
}
