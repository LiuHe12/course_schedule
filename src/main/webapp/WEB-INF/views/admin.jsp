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
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- ContextJS -->
<link rel="stylesheet" href="css/context.bootstrap.css" />
<script src='js/context.js'></script>

<!-- mytimepicker -->
<link rel="stylesheet" href="css/timepicker.css" />
<script src='js/jquery.timepicker.js'></script>



<script>
	$(document).ready(function() {
		
		$("#datepicker").datepicker();
		$("#timePicker").hunterTimePicker();
		$(".timePicker").hunterTimePicker();

		//fullCalendar
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate : '2017-11-12',
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [ {
				title : 'All Day Event',
				start : '2017-11-01',
				color : 'blue'
			}, {
				title : 'Long Event',
				start : '2017-11-07',
				end : '2017-11-10',
				color : 'red'
			} ]
		});

		// contextJS
		context.init({
			fadeSpeed : 100,
			filter : function($obj) {
			},
			above : 'auto',
			preventDoubleContext : true,
			compress : false
		});

		context.attach('.fc-event', [ {
			text : '修改',
			action: function(e){
				alert('Do Something');
			}
		}, {
			text : '删除'
		} ]);

		$("#datepicker").datepicker({
			dateFormat : 'yyyy-mm-dd'
		});
		
		

	});
</script>
<script>
	$(function() {
		//隐藏层 
		function hideLayer() {
			$('.hw-overlay').fadeOut();
		}
		//展示层 =
		function showLayer(id) {
			var layer = $('#' + id), layerwrap = layer.find('.hw-layer-wrap');
			layer.fadeIn();
			//屏幕居中 
			layerwrap.css({
				'margin-top' : -layerwrap.outerHeight() / 2
			});
		}
		$('.hwLayer-ok,.hwLayer-cancel,.hwLayer-close').on('click', function() {
			hideLayer();
		});

		//触发弹出层 
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
	});
</script>
<!--//===========================新增課表彈出式畫面Css===================-->
<style type="text/css">
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
			<li class="dropdown" id="profile-messages"><a title="" href="#"
				data-toggle="dropdown" data-target="#profile-messages"
				class="dropdown-toggle"><i class="icon icon-user"></i> <span
					class="text">Welcome User</span><b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="icon-user"></i> My Profile</a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
					<li class="divider"></li>
					<li><a href="login"><i class="icon-key"></i> Log Out</a></li>
				</ul></li>
			<li class="dropdown" id="menu-messages"><a href="#"
				data-toggle="dropdown" data-target="#menu-messages"
				class="dropdown-toggle"><i class="icon icon-envelope"></i> <span
					class="text">Messages</span> <span class="label label-important">5</span>
					<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a class="sAdd" title="" href="#"><i class="icon-plus"></i>
							new message</a></li>
					<li class="divider"></li>
					<li><a class="sInbox" title="" href="#"><i
							class="icon-envelope"></i> inbox</a></li>
					<li class="divider"></li>
					<li><a class="sOutbox" title="" href="#"><i
							class="icon-arrow-up"></i> outbox</a></li>
					<li class="divider"></li>
					<li><a class="sTrash" title="" href="#"><i
							class="icon-trash"></i> trash</a></li>
				</ul></li>
			<li class=""><a title="" href="#"><i class="icon icon-cog"></i>
					<span class="text">Settings</span></a></li>
			<li class=""><a title="" href="login"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>
	<!-- left-sidebar -->
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>
		<ul>
			<li class="active"><a href="#"><i class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li><a href="#"><i class="icon icon-signal"></i><span>查看薪资报表</span></a></li>
			<li><a href="#"><i class="icon icon-inbox"></i><span>修改个人资料</span></a></li>
			<li><a href="#"><i class="icon icon-lock"></i><span>修改用户密码</span></a></li>
		</ul>
	</div>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current">Calendar</a>
			</div>
			<!--//==============新增課堂按鈕-->

			<a class="btn btn-info btn-lg show-layer" data-show-layer="hw-layer"
				role="button">新增课堂</a>

			<!--//==============新增課堂按鈕-->
		</div>

		<div class="hw-overlay" id="hw-layer" style="display: none">
			<div class="hw-layer-wrap">
				<span class="glyphicon glyphicon-remove hwLayer-close"></span>
				<div class="row">
					<div class="col-md-3 col-sm-12 hw-icon">
						<i class="glyphicon glyphicon-info-sign"></i>
					</div>
					<!--          //=================顯示內容===================-->

					<div class="col-md-9 col-sm-12">
						<form>
							Course_ID:<br> <input type="text" name="course_id"><br>
							Student_ID:<br> <input type="text" name="student_id"><br>
							<p>
								上课日期:<br> <input type="text" id="datepicker"><br>
								上课时间:<br> <input type="text" id="timePicker"><br>
							</p>
							
							<!-- <div>							
							<span>点</span><br><input type="text" name="timepicker" class="timepicker" /> 
							<span>分</span><br><input type="text" name="timepicker2" class="timepicker2" /> 
							</div>-->
							<button class="btn btn-success hwLayer-ok">确 定</button>
							<button class="btn btn-warning hwLayer-cancel">取 消</button>
						</form>
					</div>
					<!--       //=================顯示內容===================-->
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<hr>

		</div>
		<div id='calendar'></div>
	</div>

</body>

</html>
