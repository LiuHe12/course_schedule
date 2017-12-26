package edu.pku.course_schedule.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import edu.pku.course_schedule.dao.entity.Administrator;
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
			mav.setViewName("forward:/");
			return mav;
		}

		Course_Service cs = new Course_Service_Imp();

		List<Student_course> student_courses = cs.getStudentCourses();
		mav.addObject("student_courses", student_courses);
		request.getSession().setAttribute("student_courses", student_courses);

		Set<Teacher> teahcers = new HashSet<Teacher>();
		List<String> teacher_ids = new ArrayList<String>();
		for (Student_course student_course : student_courses) {
			if (!teacher_ids.contains(student_course.getTeacher_id())) {
				Teacher teacher = new Teacher();
				teacher.setId(student_course.getTeacher_id());
				teacher.setName(student_course.getTeacher_name());
				teacher_ids.add(student_course.getTeacher_id());
				teahcers.add(teacher);
			}
		}
		mav.addObject("teachers", teahcers);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.add(Calendar.MONTH, -1); // 得到前一个月
		String lastmonth = df.format(c1.getTime());
		c2.add(Calendar.MONTH, +1); // 得到后一个月
		String nextmonth = df.format(c2.getTime());
		List<Course> courses = null;
		try {
			courses = cs.getCoursesByTime(new Timestamp(df.parse(lastmonth).getTime()),
					new Timestamp(df.parse(nextmonth).getTime()));
			request.getSession().setAttribute("courses", courses);
		} catch (ParseException e) {
			logger.error(e.toString());
			e.printStackTrace();
		}
		StringBuilder sb = new StringBuilder();
		int index = 0;
		for (Course course : courses) {
			String title = course.getName() + "/" + course.getStudent_name() + "/" + course.getTeacher_name() + "/"
					+ course.getCourse_ID() + "/" + course.getStudent_ID() + "/" + course.getTeacher_ID();
			String start = df.format(course.getTime());
			String end = df.format(course.getRest_time());
			String color = null;
			if (course.getStatus() == 2) {
				color = "red";
			} else if(course.getStatus() == 1) {
				color = "purple";
			} else{
				color = "blue";
			}
			String description = course.getRemind();
			if (description == null) {
				description = "null";
			}
			forAdminshow ads = new forAdminshow(title, start, end, color, description);
			sb.append(ads.toString());
			index++;
			if (index != courses.size())
				sb.append(",");
		}
		mav.addObject("courses", sb.toString());
		request.getSession().setAttribute("courses", courses);

		return mav;
	}

	@RequestMapping(value = "/add-course", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addCourseHome(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}
		User_Service us = new User_Service_Imp();
		ArrayList<Object> object_t = us.getAllUser(1);
		ArrayList<Teacher> teachers = new ArrayList<Teacher>();
		for (Object obj : object_t) {
			teachers.add((Teacher) obj);
		}
		mav.addObject("teachers", teachers);
		request.getSession().setAttribute("teachers", teachers);
		ArrayList<Object> object_s = us.getAllUser(2);
		ArrayList<Student> students = new ArrayList<Student>();
		for (Object obj : object_s) {
			students.add((Student) obj);
		}
		mav.addObject("students", students);
		request.getSession().setAttribute("students", students);

		return mav;
	}

	@RequestMapping(value = "/addCourse", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addCourse(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}

		// Handle ISO-8859-1 to UTF-8
		String cname = "";
		String utf_name = "";
		try {
			request.setCharacterEncoding("utf-8");
			cname = request.getParameter("course_name");
			utf_name = new String(cname.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			logger.error(e.toString());
			e.printStackTrace();
		}

		Student_course student_course = new Student_course();
		student_course.setStudent_id(request.getParameter("student_id"));
		student_course.setCourse_name(utf_name);
		student_course.setTeacher_id(request.getParameter("teacher_id"));
		student_course.setNum(Integer.parseInt(request.getParameter("number")));
		student_course.setPrice(Integer.parseInt(request.getParameter("price")));
		Course_Service cs = new Course_Service_Imp();
		boolean r = cs.addCourse(student_course);
		if (!r) {
			mav.setViewName("redirect:/add-course");
		} else {
			mav.setViewName("redirect:/admin");
		}
		return mav;
	}

	@RequestMapping(value = "/arrangeCourse", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView arrangeCourse(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}
		Course course = new Course();
		course.setStudent_ID(request.getParameter("student_id"));
		course.setTeacher_ID(request.getParameter("teacher_id"));
		try {
			course.setName(new String(request.getParameter("course_name").getBytes("ISO-8859-1"), "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			logger.error(e1.toString());
			e1.printStackTrace();
		}
		String classDate = request.getParameter("classDate");

		try {
			String time = request.getParameter("time") + ":00";
			String rest_time = request.getParameter("rest_time") + ":00";
			course.setTime(new Timestamp(df.parse(classDate + " " + time).getTime()));
			course.setRest_time(new Timestamp(df.parse(classDate + " " + rest_time).getTime()));
		} catch (Exception e) {
			logger.error(e.toString());
			e.printStackTrace();
		}
		Course_Service cs = new Course_Service_Imp();
		ArrayList<Student_course> student_courses = null;
		if (request.getSession().getAttribute("student_courses") == null) {
			student_courses = cs.getStudentCourses();
			request.getSession().setAttribute("student_courses", student_courses);
		} else {
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
		mav.setViewName("redirect:/admin");
		if (!r) {
			// mav.addObject("error", "排课失败！");
			mav.addObject("result", "schedule course failed！");
		}
		// request.getSession().setMaxInactiveInterval(20 * 60);
		return mav;
	}

	@RequestMapping(value = "/add-user", method = RequestMethod.GET)
	public String addUser(HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			return "login";
		} else {
			return "add-user";
		}

	}

	@RequestMapping(value = "/addUser", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView addTeacher(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}
		DateFormat ps = new SimpleDateFormat("yyyy-MM-dd");
		User_Service_Imp us = new User_Service_Imp();
		boolean r = false;
		if (request.getParameter("select_one").equals("add_student")) {
			Student student = new Student();
			String student_name = "";

			try {
				student.setName(new String(request.getParameter("student_name").getBytes("ISO-8859-1"), "UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				logger.error(e1.toString());
				e1.printStackTrace();
			}
			String date = request.getParameter("enroll_time");
			try {
				student.setEnroll_time(new java.sql.Date(ps.parse(date).getTime()));
			} catch (ParseException e) {
				logger.error(e.toString());
				e.printStackTrace();
			}
			student.setEmail(request.getParameter("email"));
			student.setPassword(request.getParameter("student_pwd"));
			student.setIdentify_id(request.getParameter("student_identify_id"));
			r = us.addStudent(student);
		} else if (request.getParameter("select_one").equals("add_teacher")) {
			Teacher teacher = new Teacher();
			try {
				teacher.setName(new String(request.getParameter("teacher_name").getBytes("ISO-8859-1"), "UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				logger.error(e1.toString());
				e1.printStackTrace();
			}
			teacher.setKind(Integer.parseInt(request.getParameter("kind")));
			teacher.setBase_salary(Integer.parseInt(request.getParameter("base_salary")));
			teacher.setPassword(request.getParameter("teacher_pwd"));
			teacher.setIdentify_id(request.getParameter("teacher_identify_id"));
			String enroll_time = request.getParameter("entertime");
			try {
				teacher.setEntertime(new java.sql.Date(ps.parse(enroll_time).getTime()));
			} catch (ParseException e) {
				logger.error(e.toString());
				e.printStackTrace();
			}
			r = us.addTeacher(teacher);
		} else if (request.getParameter("select_one").equals("add_admin")) {
			Administrator admin = new Administrator();
			try {
				admin.setId(new String(request.getParameter("admin_name").getBytes("ISO-8859-1"), "UTF-8"));
				admin.setPassword(new String(request.getParameter("admin_pwd").getBytes("ISO-8859-1"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {

				e.printStackTrace();
			}
			r = us.addAdmin(admin);
		}
		if (!r) {
			// mav.addObject("error", "add user failed");
			mav.setViewName("redirect:/add-user");
		} else {
			mav.setViewName("redirect:/admin");
		}

		return mav;
	}

	@RequestMapping(value = "/change-user-password", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView changeUserPasswordHome(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}
		User_Service us = new User_Service_Imp();
		ArrayList<Object> object_t = us.getAllUser(1);
		ArrayList<Teacher> teachers = new ArrayList<Teacher>();
		for (Object obj : object_t) {
			teachers.add((Teacher) obj);
		}
		mav.addObject("teachers", teachers);
		ArrayList<Object> object_s = us.getAllUser(2);
		ArrayList<Student> students = new ArrayList<Student>();
		for (Object obj : object_s) {
			students.add((Student) obj);
		}
		mav.addObject("students", students);
		return mav;
	}

	@RequestMapping(value = "/changePwd", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView changePwd(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/login");
			return mav;
		}
		String userId = request.getParameter("username");
		String newPassword = "";
		String orgnewPassword = request.getParameter("password");
		try {
			request.setCharacterEncoding("utf-8");
			newPassword = new String(orgnewPassword.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			logger.error(e.toString());
			e.printStackTrace();
		}
		int identity = 0;
		if (userId.substring(0, 1).equals("S")) {
			identity = 2;
		} else if (userId.substring(0, 1).equals("T")) {
			identity = 1;
		}
		User_Service us = new User_Service_Imp();
		boolean r = us.modifyPassword(userId, identity, newPassword);
		if (!r) {
			// mav.addObject("error", "修改密码失败！");
			mav.setViewName("redirect:/change-user-password");
		} else {
			// mav.addObject("error", "修改密码成功！");
			mav.setViewName("redirect:/admin");
		}
		return mav;
	}

	@RequestMapping(value = "/deleteCourse", method = { RequestMethod.GET, RequestMethod.POST })
	private void deleteCourse(HttpServletRequest request, HttpServletResponse response) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0
				|| request.getParameter("course_id") == null) {

			response.setContentType("text/html;charset=utf-8");
			try {
				response.getWriter().print("请先登录");
				response.flushBuffer();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		Course_Service cs = new Course_Service_Imp();
		String course_string = request.getParameter("course_id");
		String course_name = course_string.split("/")[0];
		String course_id = course_string.split("/")[3];
		boolean r = cs.delCourse(course_id);
		try {
			response.setContentType("text/html;charset=utf-8");
			if (r) {
				response.getWriter().print("删除 " + course_name + " 成功!");
			} else {
				response.getWriter().print("删除 " + course_name + " 失败!");
			}
			response.flushBuffer();
		} catch (IOException e) {
			logger.error(e.toString());
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/PassedCourse", method = { RequestMethod.GET, RequestMethod.POST })
	private void PassedCourse(HttpServletRequest request, HttpServletResponse response) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0
				|| request.getParameter("course_id") == null) {

			response.setContentType("text/html;charset=utf-8");
			try {
				response.getWriter().print("请先登录");
				response.flushBuffer();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Course_Service cs = new Course_Service_Imp();
		String course_string = request.getParameter("course_id");
		String course_name = course_string.split("/")[0];
		String course_id = course_string.split("/")[3];
		boolean r = cs.setCoursePass(course_id);
		try {
			response.setContentType("text/html;charset=utf-8");
			if (r) {
				response.getWriter().print("设置 " + course_name + " 已上成功!");
			} else {
				response.getWriter().print("设置 " + course_name + " 已上失败!");
			}
			response.flushBuffer();
		} catch (IOException e) {
			logger.error(e.toString());
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/editCourse", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView editCourse(ModelAndView mav, HttpServletRequest request) {
		if ((request.getSession().getAttribute("identity")) == null
				|| (Integer) (request.getSession().getAttribute("identity")) != 0) {
			mav.addObject("error", "请以管理员身份登录！");
			mav.setViewName("forward:/");
			return mav;
		}
		Course course = new Course();
		course.setStudent_ID(request.getParameter("student_id"));
		course.setTeacher_ID(request.getParameter("teacher_id"));
		course.setCourse_ID(request.getParameter("course_id"));
		try {
			course.setName(new String(request.getParameter("course_name").getBytes("ISO-8859-1"), "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			logger.error(e1.toString());
			e1.printStackTrace();
		}
		String classDate = request.getParameter("classDate");

		try {
			String time = request.getParameter("time") + ":00";
			String rest_time = request.getParameter("rest_time") + ":00";
			course.setTime(new Timestamp(df.parse(classDate + " " + time).getTime()));
			course.setRest_time(new Timestamp(df.parse(classDate + " " + rest_time).getTime()));
		} catch (Exception e) {
			logger.error(e.toString());
			e.printStackTrace();
		}
		Course_Service cs = new Course_Service_Imp();

		boolean r = cs.modifyCourse(course);

		if (!r) {
			// mav.addObject("error", "排课失败！");
			mav.addObject("result", "modify course failed！");
		} else {
			// mav.addObject("error", "排课成功！");
			mav.addObject("result", "modify course success！");
		}
		mav.setViewName("redirect:/admin");
		// request.getSession().setMaxInactiveInterval(20 * 60);
		return mav;
	}

}
