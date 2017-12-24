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
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.wizard.js"></script>
<script src="js/matrix.js"></script>
<script src="js/matrix.wizard.js"></script>

</head>
<body>

	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard.html">Matrix Admin</a>
		</h1>
	</div>
	<!--close-Header-part-->

	<c:import url="top-bar.jsp"></c:import>
	<c:import url="left-bar.jsp"></c:import>
	
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current"> 修改用户密码</a>
			</div>
			<h1>修改用户密码</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>修改用户密码</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-horizontal" action="changePwd"
								method="post">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">用户ID</label>
										<div class="controls">
											<select id="username" type="text" name="username">
												<option>---请选择---</option>
												<optgroup label="学生">
													<c:forEach var="student" items="${students}">
														<option id="${student.id}" value="${student.id}">${student.name}/${student.id}</option>
													</c:forEach>
												</optgroup>
												<optgroup label="教師">
													<c:forEach var="teacher" items="${teachers}">
														<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
													</c:forEach>
												</optgroup>
											</select>

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
