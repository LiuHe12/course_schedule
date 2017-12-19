<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
</head>
<body>

	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard.html">Matrix Admin</a>
		</h1>
	</div>
	<!--close-Header-part-->

	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">

		<ul class="nav">
			<li class="" id="profile-messages"><a title="" href="#"
				data-target="#profile-messages"><i class="icon icon-user"></i> <span
					class="text">Welcome User</span><b class="caret"></b></a></li>

			<li class=""><a title="" href="login"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>


	<!--close-top-serch-->

	<!--sidebar-menu-->
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>
		<ul>
			<li class="active"><a href="#"><i class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li><a href="add-course"><i class="icon icon-lock"></i><span>新增课程</span></a></li>
			<li><a href="#"><i class="icon icon-signal"></i><span>查看薪资报表</span></a></li>
			<li><a href="#"><i class="icon icon-inbox"></i><span>查看用户资料</span></a></li>
			<li><a href="change-password"><i class="icon icon-lock"></i><span>修改密码</span></a></li>
		</ul>
	</div>

	<!--close-left-menu-stats-sidebar-->

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Form
					elements</a> <a href="#" class="current">Common elements</a>
			</div>
			<h1>新增课程</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span6">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-align-justify"></i>
							</span>
							<h5>新增课程</h5>
						</div>
						<div class="widget-content nopadding">
							<form class="form-horizontal" method="POST" action="addCourse" id="my_validate">
								<!-- Validate by #my_validate, see matrix.form_validation -->

								<div class="control-group">
									<label class="control-label">课程名称 :</label>
									<div class="controls">
										<input type="text" name="course_name" id="course_name" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">教师名称/ID :</label>
									<div class="controls">
										<select name="teacher_id" id="teacher_id">
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">学生名称/ID :</label>
									<div class="controls">
										<select name="student_id" id="student_id">
										<c:forEach var="student" items="${students}">
											<option id="${student.id}" value="${student.id}">${student.name}/${student.id}</option>
										</c:forEach>
									</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">课程价格 :</label>
									<div class="controls">
										<input type="text" name="price" id="price" class="span11"
											placeholder="每堂课的价格" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">课程数量 :</label>
									<div class="controls">
										<input type="text" name="number" id="number" class="span11" />
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" value="Validate" class="btn btn-success">提交</button>
								</div>
							</form>
						</div>


					</div>

				</div>
			</div>
		</div>
	</div>
	<!--Footer-part-->

	<!--end-Footer-part-->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.uniform.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/matrix.js"></script>
	<script src="js/matrix.form_validation.js"></script>
</body>
</html>
