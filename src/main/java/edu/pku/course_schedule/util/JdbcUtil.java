package edu.pku.course_schedule.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;


/**   
* @Title:  JdbcUtil
* @Package package edu.pku.course_schedule.util;
* @Description: jdbc线程池工具类
* @author Haylee  
* @date 2017/11/14
* @version V1.0   
*/
public class JdbcUtil {
	static JdbcPool jdbcPool=null;
	private static Logger logger=Logger.getLogger(JdbcUtil.class);
	static {
		//System.out.println(Thread.currentThread().getContextClassLoader().getResource(""));
		ApplicationContext ac = new ClassPathXmlApplicationContext("../spring/root-context.xml"); 
		jdbcPool=(JdbcPool) ac.getBean("jdbcPool");
		//System.out.println(jdbcPool.getDriver());
		if(jdbcPool==null) {
			logger.error("读取数据库配置文件失败！");;
		}
		try {
			Class.forName(jdbcPool.getDriver());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i=0;i<jdbcPool.getMaxPoolSize();i++) {
			Connection conn;
			try {
				conn = DriverManager.getConnection(jdbcPool.getUrl(), jdbcPool.getUsername(), jdbcPool.getPassword());
				
				jdbcPool.getListConnections().add(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		logger.info("数据池链初始化成功~");
		
	}
	public static void init() {
//		boolean loaddb=jdbcPool.loadDBconf("db.properties");
//		if(!loaddb) {
//			logger.error("读取数据库配置文件失败！");;
//		}
		ApplicationContext ac = new FileSystemXmlApplicationContext("/WEB-INF/spring/root-context.xml"); 
		jdbcPool=(JdbcPool) ac.getBean("jdbcPool");
		System.out.println(jdbcPool.getDriver());
		if(jdbcPool==null) {
			logger.error("读取数据库配置文件失败！");;
		}
	}
	public static synchronized Connection getConnection() throws SQLException {
		return jdbcPool.getConnection();
	}
	public static synchronized void releaseConn(Connection conn) throws SQLException {
		jdbcPool.getListConnections().add(conn);
	}
	public static void release(Statement statement,ResultSet rs,Connection conn) throws SQLException {
		if(rs!=null) {
			rs.close();
		}
		if(statement!=null) {
			statement.close();
		}
		releaseConn(conn);
	}
	public static void release(Statement statement,Connection conn) throws SQLException {
		if(statement!=null) {
			statement.close();
		}
		releaseConn(conn);
	}
}
