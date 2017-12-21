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
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.wizard.js"></script>
<script src="js/matrix.js"></script>
<script src="js/matrix.wizard.js"></script>
<script>
$(document).ready(function() {
	// left-bar
	var id = "<%=session.getAttribute("identity")%>";
		if (id == 0) { // admin
			$(".admin-bar").show();
		} else if (id == 1) { //teacher
			$(".teacher-bar").show();
		} else if (id == 2) { //student
			$(".student-bar").show();
		}
	});
</script>
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

	<!--sidebar-menu-->
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>
		<ul>
			<li class="admin-bar" style="display: none"><a href="admin"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="teacher-bar" style="display: none"><a href="teacher"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="student-bar" style="display: none"><a href="student"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="admin-bar teacher-bar" style="display: none"><a href="salary"><i
					class="icon icon-signal"></i><span>查看薪资</span></a></li>
			<li class="admin-bar" style="display: none"><a href="add-course"><i
					class="icon icon-lock"></i><span>新增课程</span></a></li>
			<li class="admin-bar" style="display: none"><a href="add-user"><i
					class="icon icon-lock"></i><span>新增用户</span></a></li>
			<li class="admin-bar" style="display: none"><a
				href="change-user-password"><i class="icon icon-inbox"></i><span>修改用户密码</span></a></li>
			<li class="active admin-bar teacher-bar student-bar"><a
				href="change-password"><i class="icon icon-lock"></i><span>修改密码</span></a></li>
		</ul>
	</div>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current"> 修改密码</a>
			</div>
			<h1>修改密码</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>修改密码</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-horizontal"
								action="change-my-pwd" method="post">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">当前密码</label>
										<div class="controls">
											<input id="oldpassword" type="password" name="oldpassword" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">新密码</label>
										<div class="controls">
											<input id="password" type="password" name="password" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">确认新密码</label>
										<div class="controls">
											<input id="password2" type="password" name="password2" />
										</div>
									</div>
								</div>

								<div class="form-actions">
									<input id="next" class="btn btn-primary" type="submit" />
									<div id="status"></div>
								</div>
								<div id="submitted"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
