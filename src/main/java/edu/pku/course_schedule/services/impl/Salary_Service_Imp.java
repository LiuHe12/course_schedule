package edu.pku.course_schedule.services.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import edu.pku.course_schedule.dao.entity.Teacher_salary;
import edu.pku.course_schedule.dao.impl.JdbcDao;
import edu.pku.course_schedule.services.Salary_Service;

@SuppressWarnings("all")
public class Salary_Service_Imp implements Salary_Service {

	private Logger logger = Logger.getLogger(Salary_Service_Imp.class);
	private static JdbcDao dao = new JdbcDao();
	private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// ‰z¸m¤é´Á®æ¦¡

	@Override
	public Teacher_salary getSalary(String teacher_id, String salary_time) {
		Teacher_salary teacher_salary = null;
		try {
			teacher_salary = dao.getSalary(teacher_id, salary_time);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return teacher_salary;
		}
	}

	@Override
	public ArrayList<Teacher_salary> getSalaries(String teacher_id, String startTime, String endTime) {
		ArrayList<Teacher_salary> teacher_salaries = null;
		try {
			teacher_salaries = dao.getSalaries(teacher_id, startTime, endTime);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return teacher_salaries;
		}

	}

	@Override
	public List<Teacher_salary> getAllSalaries(String time) {
		ArrayList<Teacher_salary> teacher_salaries = null;
		try {
			teacher_salaries = (ArrayList<Teacher_salary>) dao.getAllSalaries(time);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return teacher_salaries;
		}
	}

	@Override
	public ArrayList<Teacher_salary> getAllSalaries(String startTime, String endTime) {
		ArrayList<Teacher_salary> teacher_salaries = null;
		try {
			teacher_salaries = dao.getAllSalaries(startTime, endTime);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return teacher_salaries;
		}
	}

	@Override
	public boolean setBonus(String teacher_id, String salary_time, int bonus) {
		boolean r = false;
		try {
			r = dao.setBonus(teacher_id, salary_time, bonus);
		} catch (SQLException e) {
			logger.error(String.format("%s -> %s", e.toString(), df.format(new Date())));
			e.printStackTrace();
		} finally {
			return r;
		}
	}

}
