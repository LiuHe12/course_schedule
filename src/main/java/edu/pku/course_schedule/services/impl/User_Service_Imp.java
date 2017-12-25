package edu.pku.course_schedule.services.impl;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.log4j.Logger;

import edu.pku.course_schedule.dao.entity.Administrator;
import edu.pku.course_schedule.dao.entity.Student;
import edu.pku.course_schedule.dao.entity.Teacher;
import edu.pku.course_schedule.dao.impl.JdbcDao;
import edu.pku.course_schedule.services.User_Service;

@SuppressWarnings("all")
public class User_Service_Imp implements User_Service {
	private Logger logger = Logger.getLogger(User_Service_Imp.class);
	private static JdbcDao dao = new JdbcDao();
	private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// �z�m����榡

	public void test() throws SQLException {
		dao.test();
	}

	@Override
	public Object login(String userId, String password, int identify) {
		Object obj = null;
		try {
			if (identify == dao.student_identity) {
				obj = (Student) dao.login(userId, password, identify);
			} else if (identify == dao.teacher_identify) {
				obj = (Teacher) dao.login(userId, password, identify);
			} else if (identify == dao.administrator_identify) {
				obj = (Administrator) dao.login(userId, password, identify);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
		} finally {
			return obj;
		}
	}

	@Override
	public boolean modifyPassword(String userId, int identify, String newPassword) {
		boolean r = false;
		try {
			r = dao.modifyPassword(userId, identify, newPassword);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

	@Override
	public boolean addStudent(Student student) {
		boolean r = false;
		try {
			r = dao.addStudent(student);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

	@Override
	public boolean addTeacher(Teacher teacher) {
		boolean r = false;
		try {
			r = dao.addTeacher(teacher);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

	@Override
	public boolean addAdmin(Administrator admin) {
		boolean r = false;
		try {
			r = dao.addAdmin(admin);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

	@Override
	public boolean modifyStudent(String student_id, Student student) {
		boolean r = false;
		try {
			r = dao.modifyStudent(student_id, student);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

	@Override
	public boolean modifyTeacher(String teacher_id, Teacher teacher) {
		boolean r = false;
		try {
			r = dao.modifyTeacher(teacher_id, teacher);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

	@Override
	public boolean delUser(String user_id, int identify) {
		boolean r = false;
		try {
			r = dao.delUser(user_id, identify);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

	@Override
	public Object getUser(String user_id, int identify) {
		Object obj = null;
		try {
			obj = dao.getUser(user_id, identify);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return obj;
		}

	}

	@Override
	public ArrayList<Object> getAllUser(int identify) {
		ArrayList<Object> users = null;
		try {
			users = dao.getAllUser(identify);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return users;
		}
	}

	@Override
	public Object getUserByIdentityId(String identifyId, int identify) {
		Object user = null;
		try {
			if (identify == dao.teacher_identify) {
				user = (Teacher) dao.getUserByIdentityId(identifyId, identify);
			} else if (identify == dao.student_identity) {
				user = (Student) dao.getUserByIdentityId(identifyId, identify);
			}
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return user;
		}
	}

}
