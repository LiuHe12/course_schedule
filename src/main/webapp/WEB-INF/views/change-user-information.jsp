<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>威德国际语言学校</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='css/googleapis.css' rel='stylesheet' type='text/css'>
<script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.js"></script>

<script src="js/matrix.js"></script>
<script src="js/matrix.form_validation.js"></script>


<!-- DatePicker -->
<script src="js/bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="css/jquery-ui.min.css">
<script src="js/jquery-ui.min.js"></script>

<script>
	$(document).ready(function() {

		$(".datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
	//onchange 切換角色
	function showlist() {
		var ss = username.options[username.selectedIndex].parentNode.attributes;
		var val = ss["label"].value;
		var userID = username.value;
		
		$("#form-wizard")[0].reset();
		$("#username").val(userID);
		$(".float_area").hide();

		if (val == "学生") {
			autofillStudent(username.value);
			$("#student").show();
		} else if (val == "教師") {
			autofillTeacher(username.value);
			$("#teacher").show();
		}

		//$("#hidden_type").val(val);

	}
	function autofillStudent(id) {
		<c:forEach var="student" items="${students}"> 
			if (id == "${student.id}") {
				$("#student_name").val("${student.name}");
				$("#student_identify_id").val("${student.identify_id}");
				$("#student_enroll_time").val("${student.enroll_time}");
				$("#student_email").val("${student.email}");
			}
		</c:forEach>
	}
	function autofillTeacher(id) {
		<c:forEach var="teacher" items="${teachers}"> 
		if (id == "${teacher.id}") {
			$("#teacher_name").val("${teacher.name}");
			$("#teacher_identify_id").val("${teacher.identify_id}");
			$("#teacher_kind").val("${teacher.kind}");
			$("#teacher_incumbency_"+"${teacher.incumbency}").prop("checked",true);
			$("#teacher_base_salary").val("${teacher.base_salary}");
			$("#teacher_entertime").val("${teacher.entertime}");
		}
	</c:forEach>
	}
</script>
</head>
<body>

	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="#">Matrix Admin</a>
		</h1>
	</div>
	<!--close-Header-part-->

	<c:import url="top-bar.jsp"></c:import>
	<c:import url="left-bar.jsp"></c:import>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current">修改用户信息</a>
			</div>
			<h1>修改用户信息</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>修改用户信息</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-horizontal my_validate"
								action="changeInformation" method="post">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<label class="control-label">用户ID</label>
										<div class="controls">
											<select id="username" type="text" name="username"
												onchange="showlist()">
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


									<!--//學生的欄位-->
									<div id="student" class="float_area" style="display: none;">
										<div class="control-group">
											<label class="control-label">学生姓名</label>
											<div class="controls">
												<input type="text" name="student_name" id="student_name" class="required" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">身份证号</label>
											<div class="controls">
												<input type="text" name="student_identify_id" id="student_identify_id"
													class="required" />
											</div>
										</div>

										<label class="control-label">报名时间</label>
										<div class="controls">
											<input type="text" class="datepicker" name="enroll_time" id="student_enroll_time"><br>
										</div>

										<div class="control-group">
											<label class="control-label">邮箱</label>
											<div class="controls">
												<input type="text" name="email" id="student_email" class="email" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">学生密码</label>
											<div class="controls">
												<input type="password" name="student_password" class="required" placeholder="选填" />
											</div>
										</div>
										<!-- 
										<div class="control-group">
											<label class="control-label">确认学生密码</label>
											<div class="controls">
												<input type="password" name="student_pwd2"
													class="student_pwd2" id="student_pwd2" />
											</div>
										</div> -->

									</div>
									<!--//老師的欄位-->
									<div id="teacher" class="float_area" style="display: none;">

										<div class="control-group">
											<label class="control-label">教师姓名</label>
											<div class="controls">
												<input type="text" name="teacher_name" id="teacher_name" class="required" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">身份证号</label>
											<div class="controls">
												<input type="text" name="teacher_identify_id" id="teacher_identify_id" 
													class="required" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">教师种类</label>
											<div class="controls">
												<select type="text" name="kind" id="teacher_kind">
													<option value="0">助教</option>
													<option value="1">正常教师</option>
													<option value="2">保薪教师</option>
												</select>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">是否在职</label>
											<div class="controls">
												<label> <input type="radio" name="incumbency" id="teacher_incumbency_1"
													value="1" /> 是
												</label> <label> <input type="radio" name="incumbency" id="teacher_incumbency_0"
													value="0" /> 否
												</label> <label>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">基础工资</label>
											<div class="controls">
												<input type="text" name="base_salary" id="teacher_base_salary" class="digits" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">入职时间</label>
											<div class="controls">
												<input type="text" class="datepicker" name="entertime" id="teacher_entertime"><br>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">教师密码</label>
											<div class="controls">
												<input type="password" name="teacher_password" class="required" placeholder="选填" />
											</div>
										</div>
										<!-- 
										<div class="control-group">
											<label class="control-label">确认教师密码</label>
											<div class="controls">
												<input type="password" name="teacher_pwd2"
													class="teacher_pwd2" id="teacher_pwd2" />
											</div>
										</div> -->

									</div>

									
								</div>

								<div class="form-actions">
									<input type="submit" value="提交" class="btn btn-success">
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
