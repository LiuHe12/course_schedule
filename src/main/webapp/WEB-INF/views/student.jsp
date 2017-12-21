<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

<!-- ContextJS -->
<link rel="stylesheet" href="css/context.bootstrap.css" />
<script src='js/context.js'></script>


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
			
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate: getNowFormatDate(),
			navLinks: true, // can click day/week names to navigate views
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events: [[${courses}]]
		});
		
	});

	//获取当前时间，格式YYYY-MM-DD
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }
</script>


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
			<li class="admin-bar" style="display: none"><a href="admin"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="teacher-bar" style="display: none"><a href="teacher"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="student-bar active" style="display: none"><a href="student"><i
					class="icon icon-calendar"></i><span>查看课表</span></a></li>
			<li class="admin-bar" style="display: none"><a href="all-salary"><i
					class="icon icon-signal"></i><span>查看薪资报表</span></a></li>
			<li class="teacher-bar" style="display: none"><a href="salary"><i
					class="icon icon-signal"></i><span>查看薪资</span></a></li>
			<li class="admin-bar" style="display: none"><a href="add-course"><i
					class="icon icon-lock"></i><span>新增课程</span></a></li>
			<li class="admin-bar" style="display: none"><a href="add-user"><i
					class="icon icon-lock"></i><span>新增用户</span></a></li>
			<li class="admin-bar" style="display: none"><a
				href="change-user-password"><i class="icon icon-inbox"></i><span>修改用户密码</span></a></li>
			<li class="admin-bar teacher-bar student-bar"><a
				href="change-password"><i class="icon icon-lock"></i><span>修改密码</span></a></li>
		</ul>
	</div>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i
					class="icon-home"></i> Home</a> <a href="#" class="current">Calendar</a>
			</div>

		</div>

		<div id='calendar'></div>
	</div>

</body>

</html>
