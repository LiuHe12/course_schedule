<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
	<script>
		
	
	
	</script>
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>
		<ul>
			<li class="admin-bar" id="admin-bar" style="display: none"><a href="admin"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="teacher-bar" id="teacher-bar" style="display: none"><a href="teacher"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="student-bar" id="student-bar" style="display: none"><a href="student"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="admin-bar teacher-bar" id="salary-bar" style="display: none"><a
				href="salary"><i class="icon icon-signal"></i><span>查看薪资</span></a></li>
			<li class="admin-bar" id="add-course-bar" style="display: none"><a href="add-course"><i
					class="icon icon-lock"></i><span>新增课程</span></a></li>
			<li class="admin-bar" id="add-user-bar" style="display: none"><a href="add-user"><i
					class="icon icon-lock"></i><span>新增用户</span></a></li>
			<li class="admin-bar" id="change-user-password-bar" style="display: none"><a
				href="change-user-password"><i class="icon icon-inbox"></i><span>修改用户密码</span></a></li>
			<li class="admin-bar teacher-bar student-bar" id="change-password-bar" style="display: none"><a
				href="change-password"><i class="icon icon-lock"></i><span>修改密码</span></a></li>
		</ul>
	</div>


</body>