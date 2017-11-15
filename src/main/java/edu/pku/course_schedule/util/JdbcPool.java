package edu.pku.course_schedule.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.LinkedList;
import java.util.Properties;

import javax.sql.DataSource;
import java.util.logging.Logger;

/**   
* @Title:  JdbcPool
* @Package package edu.pku.course_schedule.util;
* @Description: Jdbc线程池
* @author Haylee  
* @date 2017/11/14
* @version V1.0   
*/
public class JdbcPool implements DataSource{
	
	private  String driver;
	private  String url;
	private  String username;
	private  String password;
	private  int maxPoolSize;
	
	private  LinkedList<Connection> listConnections = new LinkedList<Connection>();
	public  boolean loadDBconf(String confFile) {
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(new File(confFile));
			Properties p = new Properties();
			p.load(inputStream);
			driver=p.getProperty("driver");
			url=p.getProperty("url");
			username=p.getProperty("username");
			password=p.getProperty("password");
			maxPoolSize=Integer.parseInt(p.getProperty("maxPoolSize"));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			
		}
		return true;
	}
	@Override
	public String toString() {
		return "JdbcPool [driver=" + driver + ", url=" + url + ", username=" + username + ", password=" + password
				+ ", maxPoolSize=" + maxPoolSize + "]";
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getMaxPoolSize() {
		return maxPoolSize;
	}
	public void setMaxPoolSize(int maxPoolSize) {
		this.maxPoolSize = maxPoolSize;
	}


	public LinkedList<Connection> getListConnections() {
		return listConnections;
	}
	public void setListConnections(LinkedList<Connection> listConnections) {
		listConnections = listConnections;
	}
	@Override
	public PrintWriter getLogWriter() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getLoginTimeout() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void setLogWriter(PrintWriter arg0) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void setLoginTimeout(int arg0) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public boolean isWrapperFor(Class<?> arg0) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public <T> T unwrap(Class<T> arg0) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Connection getConnection() throws SQLException {
		//如果数据库连接池中的连接对象的个数大于0
		if (listConnections.size()>0) {
			return listConnections.removeFirst();
		}else {
			throw new RuntimeException("对不起，数据库忙");
		}
	}

	@Override
	public Connection getConnection(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
