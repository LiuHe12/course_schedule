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
<link href='css/googleapis.css' rel='stylesheet' type='text/css'>
<!-- <link rel="stylesheet" href="css/datepicker.css" />-->
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/colorpicker.css" />

<script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.js"></script>

<script src="js/matrix.js"></script>
<script src="js/matrix.form_validation.js?version=4"></script>


<!-- DatePicker -->
<script src="js/bootstrap-datepicker.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">


<script>
	$(document).ready(function() {

		$(".datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
	//onchange 切換角色
	function chselect() {
		$("#form-wizard")[0].reset();
		$(".float_area").hide();
		var val = $('#s1').val();
		//console.log(val);
		//$("#option div").hide();
		$("#" + val + "").show(); //不知為何#s1放表單內,selector抓不到
		$("#hidden_type").val(val);
		
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
				<a href="index" title="Go to Home" class="tip-bottom"><i
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
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>新增用户</h5>
						</div>
						<div class="widget-content nopadding">
							<select id="s1" style="color: #FF0000;" name="select_one"
								onchange="chselect()">
								<option>请选择创建帐号种类</option>
								<option value="add_student">新增学生帐号</option>
								<option value="add_teacher">新增教师帐号</option>
								<option value="add_admin">新增管理员帐号</option>
							</select>
							<form id="form-wizard" action="addUser" class="form-horizontal my_validate" method="post">
								<!--//選擇創建哪個角色的帳號-->
								<input id="hidden_type" type="hidden" name="select_one" />
								<div id="form-wizard-1" class="step">


									<!--//創建學生的欄位-->
									<div id="add_student" class="float_area" style="display: none;">
										<div class="control-group">
											<label class="control-label">学生姓名</label>
											<div class="controls">
												<input type="text" name="student_name" class="required"/>
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">身份证号</label>
											<div class="controls">
												<input type="text" name="student_identify_id" class="required"/>
											</div>
										</div>
										
										<label class="control-label">报名时间</label>
										<div class="controls">
											<input type="text" class="datepicker" name="enroll_time"><br>
										</div>

										<div class="control-group">
											<label class="control-label">邮箱</label>
											<div class="controls">
												<input type="text" name="email" class="email" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">学生密码</label>
											<div class="controls">
												<input type="password" name="student_pwd" class="student_pwd" id="student_pwd"/>
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">确认学生密码</label>
											<div class="controls">
												<input type="password" name="student_pwd2" class="student_pwd2" id="student_pwd2" />
											</div>
										</div>

									</div>
									<!--//創建老師的欄位-->
									<div id="add_teacher" class="float_area" style="display: none;">

										<div class="control-group">
											<label class="control-label">教师姓名</label>
											<div class="controls">
												<input type="text" name="teacher_name" class="required" />
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">身份证号</label>
											<div class="controls">
												<input type="text" name="teacher_identify_id" class="required" />
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">教师种类</label>
											<div class="controls">
												<select type="text" name="kind" id="kind" >
													<option value="0">助教</option>
													<option value="1">正常教师</option>
													<option value="2">保薪教师</option>
												</select>
											</div>
										</div>
										
										<div class="control-group">
              								<label class="control-label">是否在职</label>
              								<div class="controls">
               								<label>
							                  <input type="radio" name="incumbency" value="1" />
							                	  是</label>
							                <label>
							                  <input type="radio" name="incumbency" value="0" />
							                	  否</label>
							                <label>
							            
							              </div>
							            </div>																		

										<div class="control-group">
											<label class="control-label">基础工资</label>
											<div class="controls">
												<input type="text" name="base_salary" class="digits" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">入职时间</label>
											<div class="controls">
												<input type="text" class="datepicker" name="entertime"><br>
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">教师密码</label>
											<div class="controls">
												<input type="password" name="teacher_pwd" class="teacher_pwd" id="teacher_pwd" />
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">确认教师密码</label>
											<div class="controls">
												<input type="password" name="teacher_pwd2" class="teacher_pwd2" id="teacher_pwd2"/>
											</div>
										</div>										

									</div>
									
									<!--//創建管理員的欄位-->
									<div id="add_admin" class="float_area" style="display: none;">
										<div class="control-group">
											<label class="control-label">Admin名称</label>
											<div class="controls">
												<input type="text" name="admin_name" class="required" />
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">新密码</label>
											<div class="controls">
												<input type="password" name="admin_pwd" class="admin_pwd" id="admin_pwd"/>
											</div>
										</div>
										
										<div class="control-group">
											<label class="control-label">确认新密码</label>
											<div class="controls">
												<input type="password" name="admin_pwd2" class="admin_pwd2" id="admin_pwd2"/>
											</div>
										</div>
										
									</div>
								</div>
								<div class="form-actions">
                  <input type="submit" value="Validate" class="btn btn-success">
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
