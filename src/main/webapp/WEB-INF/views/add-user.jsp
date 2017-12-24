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


<!-- DatePicker -->
<script src="js/bootstrap-datepicker.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">


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

		$(".datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});

	});

	//onchange 切換角色
	function chselect() {
		$(".float_area").hide();
		var val = $("#s1").val();
		console.log(val);
		//$("#option div").hide();
		$("#" + val + "").show();
	}
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

	<c:import url="top-bar.jsp"></c:import>
	<c:import url="left-bar.jsp"></c:import>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current">新增用户</a>
			</div>
			<h1>新增用户</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-info-sign"></i>
							</span>
							<h5>新增用户</h5>
						</div>
						<div class="widget-content nopadding">

							<!-- 選擇創建腳色 -->
							<select id="s1" style="color: #FF0000;" name="select_one"
								onchange="chselect()">
								<option>请选择创建帐号种类</option>
								<optgroup label="学生">
									<option value="add_student">新增学生帐号</option>
								</optgroup>
								<optgroup label="教师">
									<option value="add_teacher">新增教师帐号</option>
								</optgroup>
								<optgroup label="管理员">
									<option value="add_admin">新增管理员帐号</option>
								</optgroup>
							</select>

							<!-- 學生欄位 -->
							<form class="form-horizontal my_validate" method="post"
								action="#" name="add_student" id="add_student"
								novalidate="novalidate">

								<!-- 欄位區塊 -->
								<div class="control-group">
									<label class="control-label">Password</label>
									<div class="controls">
										<input type="password" name="pwd" id="pwd" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Confirm password</label>
									<div class="controls">
										<input type="password" name="pwd2" id="pwd2" />
									</div>
								</div>



								<div class="form-actions">
									<input type="submit" value="提交" class="btn btn-success">
								</div>
							</form>

							<!-- Forms -->





						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>新增用户</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-horizontal" action="addUser"
								method="POST">
								<div id="form-wizard-1" class="step">



									<!--//選擇創建哪個角色的帳號  ！！目前只有寫學生跟教師！！-->
									<select id="s1" style="color: #FF0000;" name="select_one"
										onchange="chselect()">
										<option value="">请选择创建帐号种类</option>
										<optgroup selected="true" label="学生">
											<option value="add_student">新增学生帐号</option>
											<optgroup label="教师" />
											<option value="add_teacher">新增教师帐号</option>
											<optgroup label="管理员">
												<option value="add_admin">新增管理员帐号</option>
									</select>
									<!--//選擇創建哪個角色的帳號  ！！目前只有寫學生跟教師！！-->


									<!--//創建學生的欄位-->
									<div id="add_student" class="float_area" style="display: none;">
										<div class="control-group">
											<label class="control-label">student_name</label>
											<div class="controls">
												<input type="text" name="student_name" />
											</div>
										</div>

										<label class="control-label">student_enroll_time</label>
										<div class="controls">
											<input type="text" class="datepicker" name="enroll_time"><br>
										</div>

										<div class="control-group">
											<label class="control-label">student_email</label>
											<div class="controls">
												<input type="text" name="email" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">student_password</label>
											<div class="controls">
												<input type="text" name="student_passwd" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">student_identify_id</label>
											<div class="controls">
												<input type="text" name="student_identify_id" />
											</div>
										</div>
									</div>
									<!--//創建老師的欄位-->
									<div id="add_teacher" class="float_area" style="display: none;">

										<div class="control-group">
											<label class="control-label">teacher_name</label>
											<div class="controls">
												<input type="text" name="teacher_name" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">teacher_kind</label>
											<div class="controls">
												<input type="text" name="kind" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">teacher_base_salary</label>
											<div class="controls">
												<input type="text" name="base_salary" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">teacher_passwd</label>
											<div class="controls">
												<input type="text" name="teacher_passwd" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">teacher_identify</label>
											<div class="controls">
												<input type="text" name="teacher_identify_id" />
											</div>
										</div>

										<label class="control-label">teacherentertime</label>
										<div class="controls">
											<input type="text" class="datepicker" name="entertime"><br>
										</div>
									</div>

									<!-- //後續有東西可是我先把它隱藏起來了-->
									<!--<div id="form-wizard-2" class="step">
                <div class="control-group">
                  <label class="control-label">Email</label>
                  <div class="controls">
                    <input id="email" type="text" name="email" />
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">EULA</label>
                  <div class="controls">
                    <input id="eula" type="checkbox" name="eula" />
                  </div>
                </div>
              </div>-->
									<div class="form-actions">
										<input id="back" class="btn btn-primary" type="reset"
											value="Back" /> <input id="next" class="btn btn-primary"
											type="submit" value="Next" />
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
