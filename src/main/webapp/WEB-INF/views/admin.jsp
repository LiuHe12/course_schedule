<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />

<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>

<!-- Full calendar -->
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet'
	media='print' />
<script src='lib/moment.min.js'></script>
<script src='lib/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>

<!-- DatePicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- ContextJS -->
<link rel="stylesheet" href="css/context.bootstrap.css" />
<script src='js/context.js'></script>

<!-- timepicker -->
<link rel="stylesheet" href="css/timepicker.css" />
<script src='js/jquery.timepicker.js'></script>

<script>

	$(function() {
		
		// contextJS
		context.init({
			fadeSpeed : 100,
			filter : function($obj) {
			},
			above : 'auto',
			preventDoubleContext : true,
			compress : false
		});
		
		$(".fc-event").each(function(e) {
		    //var id = $(this).prop("id");
		    //alert($(this).prop("innerHTML"));
		    attachContext('.fc-event');
		})		
		function attachContext(selector) {
			context.attach('.fc-event', [ {
				text : '修改',
				action : function(e){
					e.preventDefault();
					showLayer('hw-layer-edit');
					var x = context.clickedEle;
					alert(x);
					
				}
			}, {
				text : '删除'
			} ]);
		}
		
		
		// DatePicker and TimePicker
		$(".timePicker").hunterTimePicker();
		$(".datepicker").datepicker();
		
		$(".datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});

		
		// 隱藏選單相關
		function hideLayer() {
			$('.hw-overlay').fadeOut();
		}
		
		function showLayer(id) {
			var layer = $('#' + id), layerwrap = layer.find('hw-layer-wrap');
			layer.fadeIn();
			layerwrap.css({
				'margin-top' : -layerwrap.outerHeight() / 2
			});
		}
		
		$('.hwLayer-ok,.hwLayer-cancel,.hwLayer-close').on('click', function() {
			hideLayer();
		});

		
		$('.show-layer').on('click', function() {
			var layerid = $(this).data('show-layer');
			showLayer(layerid);
		});

		//点击或者触控弹出层外的半透明遮罩层，关闭弹出层 
		$('.hw-overlay').on('click', function(event) {
			if (event.target == this) {
				hideLayer();
			}
		});

		//按ESC键关闭弹出层 
		$(document).keyup(function(event) {
			if (event.keyCode == 27) {
				hideLayer();
			}
		});
		

		
		// fullCalendar
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate : '2017-11-12',
			navLinks : true, // can click day/week names to navigate views
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : [${courses}]
		});
		

	});
</script>


<script>

	//排课相关
	/*操作流程如下:
	**	1.選擇老師
	**	2.選擇學生
	**	3.選擇課程
	*/
	var tid = "";
	var sid = "";
	var arrCourse = null;
	var arrStudent = null;
	
	function getStudent(sellectBox){
		tid = sellectBox.value; // 設定教師ID以便課程檢索
		
		arrStudent = new Array();
		arrCourse = null;
		
		<c:forEach var="course" items="${student_courses}"> //從課表中找出這名老師的學生
			if(sellectBox.value=="${course.teacher_id}"){
				//console.log("${course.student_id}");
				<c:forEach var="student" items="${students}"> //用學生id獲得完整學生信息
					if("${course.student_id}"==("${student.id}")){
						arrStudent.push("${student.name}/${student.id}");
					}
				</c:forEach>
			} 
		</c:forEach>
		
		//塞进option
		var str = "<option>---请选择---</option>";
		for(var i=0;i<arrStudent.length;i++){
			var sp = new Array();
			sp = arrStudent[i].split("/");
			str += "<option id=\""+ sp[1] +"\" value=\""+ sp[1] +"\">"+arrStudent[i]+"</option>"
		}
		document.all('student-add').innerHTML = str;
		document.all('course-add').innerHTML = ""; // 選完課又偷改老師,要清掉唷
	}
	
	function getCourse(sellectBox){
		arrCourse = new Array();
		
		<c:forEach var="course" items="${student_courses}"> // 用老師id&學生id查課表
			if(sellectBox.value=="${course.student_id}" && tid=="${course.teacher_id}"){
				arrCourse.push("${course.course_name}");
			}
			
		</c:forEach>
		
		//寫回option
		var str = "";
		for(var i=0;i<arrStudent.length;i++){
			str += "<option id=\""+ arrCourse[i] +"\" value=\""+ arrCourse[i] +"\">"+arrCourse[i]+"</option>"
		}
		document.all('course-add').innerHTML = str;
	}
</script>

<!--//===========================新增課表彈出式畫面Css===================-->
<style type="text/css">
.aboveCal { #
	padding-bottom: 0px;
}

.btn-info {
	float: left;
	margin-left: 15px;
	margin-right: 15px;
}

.hw-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 10;
}

.hw-layer-wrap {
	box-sizing: border-box;
	width: 570px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -285px;
	margin-top: -180.8px;
	border-radius: 3px;
	background-color: #fff;
	box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.12);
	padding: 45px 50px;
}

.hwLayer-close {
	position: absolute;
	right: 20px;
	top: 20px;
	width: 20px;
	height: 20px;
	cursor: pointer;
	font-size: 20px;
	color: #ccc;
}

.hw-layer-wrap .hw-icon {
	color: #b4d8f3;
	font-size: 86px;
	text-align: center;
}

.hw-layer-wrap h4 {
	margin: 5px 0 30px;
	font-size: 24px;
	color: #383c3e;
}

.hw-layer-wrap p {
	margin: 30px 0;
	line-height: 22px;
	color: #595d60;
	text-align: left;
}

.hw-layer-wrap {
	z-index: 999;
}

@media ( max-width :768px) {
	.hw-layer-wrap {
		width: 350px;
		margin-left: -175px;
		margin-top: -200px;
		padding: 45px 50px;
		text-align: center;
	}
}

@media ( max-width :400px) {
	.hw-layer-wrap {
		width: 250px;
		margin-left: -125px;
		padding: 25px 30px;
	}
}
</style>
<!--//===========================新增課表彈出式畫面Css===================-->
</head>


<body>
	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard">Matrix Admin</a>
		</h1>
	</div>
	<!--close-Header-part-->
	<!--top-Header-menu-->



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
	<!-- left-sidebar -->
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>
		<ul>
			<li class="active"><a href="admin"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li><a href="all-salary"><i class="icon icon-signal"></i><span>查看薪资报表</span></a></li>
			<li><a href="add-course"><i class="icon icon-lock"></i><span>新增课程</span></a></li>
			<li><a href="add-user"><i class="icon icon-lock"></i><span>新增用户</span></a></li>
			<li><a href="change-user-password"><i
					class="icon icon-inbox"></i><span>修改用户密码</span></a></li>
			<li><a href="change-password"><i class="icon icon-lock"></i><span>修改密码</span></a></li>
		</ul>
	</div>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home current"></i> Home</a>
			</div>
			<!--//==============排课按鈕-->
			<div class="aboveCal">
				<a class="btn btn-info btn-lg show-layer" data-show-layer="hw-layer"
					role="button">排课</a>
				<!--//==============排课按鈕-->


				<!--=================排课===================-->
				<div class="hw-overlay" id="hw-layer" style="display: none">
					<div class="hw-layer-wrap">
						<span class="glyphicon glyphicon-remove hwLayer-close"></span>
						<div class="row">
							<div class="col-md-3 col-sm-12 hw-icon">
								<i class="glyphicon glyphicon-info-sign"></i>
							</div>
							<div class="col-md-9 col-sm-12">

								<form id="addCourse" action="arrangeCourse" method="post">

									教师名称/ID:<br> <select name="teacher_id" id="teacher-add"
										onChange="getStudent(this)">
										<option>---请选择---</option>
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select><br> 学生名称/ID:<br> <select name="student_id"
										id="student-add" onchange="getCourse(this)">
										
									</select><br> 选择课程:<br> <select name="course_id"
										id="course-add">
										
									</select><br> 上课日期:<br> <input type="text" class="datepicker"
										id="classDate" name="classDate"><br> 上课时间:<br>
									<input type="text" class="timePicker" id="time" name="time"><br>
									下课时间:<br> <input type="text" class="timePicker"
										id="rest_time" name="rest_time"><br>

									<button class="btn btn-success hwLayer-ok" type="submit">确
										定</button>
									<button class="btn btn-warning hwLayer-cancel">取 消</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--=================排课===================-->
				<!--=================修改課程===================-->
				<div class="hw-overlay" id="hw-layer-edit" style="display: none">
					<div class="hw-layer-wrap">
						<span class="glyphicon glyphicon-remove hwLayer-close"></span>
						<div class="row">
							<div class="col-md-3 col-sm-12 hw-icon">
								<i class="glyphicon glyphicon-info-sign"></i>
							</div>
							<div class="col-md-9 col-sm-12">
								<h3>修改课程</h3>

								<!-- 自动填值 -->
								<form id="editCourse" action="editCourse" method="post">
									教师名称/ID:<br> <select name="teacher_id">
										<option>---请选择---</option>
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select><br> 学生名称/ID:<br> <select name="student_id">
										<c:forEach var="student" items="${students}">
											<option id="${student.id}">${student.name}/${student.id}</option>
										</c:forEach>
									</select><br> 选择课程:<br> <select name="course_id"></select><br>
									<p>
										上课日期:<br> <input type="text" class="datepicker"><br>
										上课时间:<br> <input type="text" class="timePicker"><br>
										下课时间:<br> <input type="text" class="timePicker"><br>
									</p>

									<button class="btn btn-success hwLayer-ok" type="submit">确
										定</button>
									<button class="btn btn-warning hwLayer-cancel">取 消</button>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!--=================修改課程===================-->
			<div id='calendar'></div>
		</div>
		<!-- end content-header -->

	</div>
	<!-- end content -->
</body>

</html>
