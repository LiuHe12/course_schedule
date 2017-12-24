<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<!-- <link rel="stylesheet" href="css/datepicker.css" />-->
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />

<script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/matrix.js"></script>
<script src="js/matrix.form_validation.js"></script>

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

	<%
		request.setCharacterEncoding("utf-8");
		String s = request.getParameter("course_name");
	%>
	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard">Matrix Admin</a>
		</h1>
	</div>
	<!--close-Header-part-->
	<!--top-Header-menu-->
	<script>
		
		$('#add-course-bar').addClass("active");
	</script>

	<c:import url="top-bar.jsp"></c:import>
	<c:import url="left-bar.jsp"></c:import>

	<!--close-left-menu-stats-sidebar-->

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current">新增课程</a>
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
							<form class="form-horizontal" method="POST" action="addCourse"
								id="my_validate">
								<!-- Validate by #my_validate, see matrix.form_validation -->

								<div class="control-group">
									<label class="control-label">课程名称 :</label>
									<div class="controls">
										<input type="text" name="course_name" id="course_name"
											class="span11" />
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
											placeholder="整数,每堂课的价格" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">课程数量 :</label>
									<div class="controls">
										<input type="text" name="number" id="number" class="span11"
											placeholder="整数" />
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

</body>
</html>
