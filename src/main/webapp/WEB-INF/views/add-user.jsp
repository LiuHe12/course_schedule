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

<link rel="stylesheet" href="css/datepicker.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<script src='lib/moment.min.js'></script>
<script src='lib/jquery.min.js'></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.wizard.js"></script>
<script src="js/matrix.js"></script>
<script src="js/matrix.wizard.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<!--//學生日曆-->
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<!-- //老師日曆-->
<script>
	$(function() {
		$("#datepicker1").datepicker();
	});
</script>

<!-- //onchange 切換角色-->
<script>
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
			<li><a href="admin"><i class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li><a href="all-salary"><i class="icon icon-signal"></i><span>查看薪资报表</span></a></li>
			<li><a href="add-course"><i class="icon icon-lock"></i><span>新增课程</span></a></li>
			<li class="active"><a href="add-user"><i class="icon icon-lock"></i><span>新增用户</span></a></li>	
			<li><a href="change-user-password"><i class="icon icon-inbox"></i><span>修改用户密码</span></a></li>
			<li><a href="change-password"><i class="icon icon-lock"></i><span>修改密码</span></a></li>
		</ul>
	</div>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a>  <a	href="#" class="current">add-user</a>
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
							<form id="form-wizard" class="form-horizontal" method="post">
								<div id="form-wizard-1" class="step">



									<!--//選擇創建哪個角色的帳號  ！！目前只有寫學生跟教師！！-->
									<select id="s1" style="color: #FF0000;" name="select_one"
										onchange="chselect()">
										<option value="">请选择创建帐号种类</option>
										<optgroup selected="true" label="学生">
											<option value="add_student">新增学生帐号</option>
											<optgroup label="教师">
												<option value="add_teacher">新增教师帐号</option>
												>
												<optgroup label="管理员">
													<option value="add_admin">新增管理员帐号</option>
									</select>
									<!--//選擇創建哪個角色的帳號  ！！目前只有寫學生跟教師！！-->


									<!--//創建學生的欄位-->
									<div id="add_student" class="float_area" style="display: none;">
										<div class="control-group">
											<label class="control-label">student_name</label>
											<div class="controls">
												<input type="text" name="name" />
											</div>
										</div>

										<label class="control-label">student_enroll_time</label>
										<div class="controls">
											<input type="text" id="datepicker" name="enroll_time"><br>
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
												<input type="text" name="password" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">student_identify_id</label>
											<div class="controls">
												<input type="text" name="identify_id" />
											</div>
										</div>
									</div>
									<!--//創建老師的欄位-->
									<div id="add_teacher" class="float_area" style="display: none;">

										<div class="control-group">
											<label class="control-label">teacher_name</label>
											<div class="controls">
												<input type="text" name="name" />
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
												<input type="text" name="passwd" />
											</div>
										</div>

										<div class="control-group">
											<label class="control-label">teacher_identify</label>
											<div class="controls">
												<input type="text" name="identify" />
											</div>
										</div>

										<label class="control-label">teacherentertime</label>
										<div class="controls">
											<input type="text" id="datepicker1" name="entertime"><br>
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
