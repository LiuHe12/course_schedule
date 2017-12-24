<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

	var contextEle = "";
	
	$(function() {
		
		// left-bar
		var id = "<%=session.getAttribute("identity")%>";
		if (id == 0) { // admin
			$(".admin-bar").show();
		} else if (id == 1) { //teacher
			$(".teacher-bar").show();
		} else if (id == 2) { //student
			$(".student-bar").show();
		}

		//右鍵選單
		context.init({
			fadeSpeed : 100,
			filter : function($obj) {
			},
			above : 'auto',
			preventDoubleContext : true,
			compress : false
		});		
		context.attach('.fc-event,.fc-list-item', [ {
			text : '修改',
			action : function(){
				fillEditForm();
				showLayer('hw-layer-edit');
			}
		},{
			text : '已上课',
			action : function(){
				PassedCourse();
			}			
		}, {
			text : '删除',
			action : function(){
				deleteCourse();
			}
		} ]);
		
		// 取得右鍵元素
		$(document).on('contextmenu', '.fc-event', function (e) {
			contextEle = $(this).find(".fc-title").text();
		});
		

		
		// DatePicker and TimePicker
		$(".timePicker").hunterTimePicker();
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
			defaultDate : getNowFormatDate(),
			navLinks : true, // can click day/week names to navigate views
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : [${courses}]
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
	var arrCourse = null;
	var arrStudent = null;
	
	function getStudent(sellectBox){
		//console.log("sellectBox: "+sellectBox.outerHTML);
		tid = sellectBox.value; // 設定教師ID以便課程檢索
		var formSuffix = $(sellectBox).attr('id').split('-')[1]; // 取得表單後綴,讓function在add或edit都能用
				
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
		document.all('student-' + formSuffix).innerHTML = str;
		document.all('course-' + formSuffix).innerHTML = ""; // 選完課又偷改老師,要清掉唷
	}
	
	function getCourse(sellectBox){
		var formSuffix = $(sellectBox).attr('id').split('-')[1];
		arrCourse = new Array();
		
		<c:forEach var="course" items="${student_courses}"> // 用老師id&學生id查課表
			if(sellectBox.value=="${course.student_id}" && tid=="${course.teacher_id}"){
				arrCourse.push("${course.course_name}");
			}
		</c:forEach>
		
		//寫回option
		var str = "<option>---请选择---</option>";
		for(var i=0;i<arrCourse.length;i++){
			str += "<option id=\""+ arrCourse[i] +"\" value=\""+ arrCourse[i] +"\">"+arrCourse[i]+"</option>"
		}
		document.all('course-' + formSuffix).innerHTML = str;
	}
	
	function cleanForm(){ //按了取消表單清空
		document.all('student-add').innerHTML = "";
		document.all('course-add').innerHTML = "";
	}
	
	
	
	// 改課相關
	/* fillEditForm()自動填值
	** deleteCourse()刪課
	** courseDone()  課程已上
	*/ 
	//自動填值
	function fillEditForm(){
		var course_id = new Array();
		course_id = contextEle.split("/");
		
		
		//自動填值
		$('#teacher-edit').val(course_id[3]);
		getStudent($('#teacher-edit')[0]);
		$('#student-edit').val(course_id[2]);
		getCourse($('#student-edit')[0]);
		$('#course-edit').val(course_id[0]);
		
		//修改的課號
		$('#course_id').val(course_id[1]);
	}
	
	// 刪課
	function deleteCourse(){
		alert(contextEle);
		$.ajax({
			type: "post",
			url: "deleteCourse",
			data: {"course_id":contextEle},
			dataType: "json",
			success: function(e){alert("删除成功");},
			error: function(e){alert("删除失败");}
		});
		
	}
	
	// 課已上
	function PassedCourse(){
		alert(contextEle);
		$.ajax({
			type: "post",
			url: "PassedCourse",
			data: {"course_id":contextEle},
			dataType: "json",
			success: function(e){alert("修改成功");},
			error: function(e){alert("修改失败");}
		});
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
		
	<c:import url="top-bar.jsp"></c:import>
	<c:import url="left-bar.jsp"></c:import>

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
								<h3>排课</h3>
								<form id="addCourse" action="arrangeCourse" method="post">

									教师名称/ID:<br> <select name="teacher_id" id="teacher-add"
										onchange="getStudent(this)">
										<option>---请选择---</option>
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select><br> 学生名称/ID:<br> <select name="student_id"
										id="student-add" onchange="getCourse(this)">
									</select><br> 选择课程:<br> <select name="course_name"
										id="course-add">
									</select><br> 上课日期:<br> <input type="text" class="datepicker"
										id="classDate-add" name="classDate"><br> 上课时间:<br>
									<input type="text" class="timePicker" id="time" name="time"><br>
									下课时间:<br> <input type="text" class="timePicker"
										id="rest_time" name="rest_time"><br>

									<button class="btn btn-success hwLayer-ok" type="submit">确
										定</button>
									<button class="btn btn-warning hwLayer-cancel" type="reset"
										onclick="cleanForm()">取 消</button>
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

									教师名称/ID:<br> <select name="teacher_id" id="teacher-edit"
										onchange="getStudent(this)">
										<option>---请选择---</option>
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select><br> 学生名称/ID:<br> <select name="student_id"
										id="student-edit" onchange="getCourse(this)">

									</select><br> 选择课程:<br> <select name="course_name"
										id="course-edit"></select><br> 上课日期:<br> <input
										type="text" class="datepicker"><br> 上课时间:<br>
									<input type="text" class="timePicker"><br> 下课时间:<br>
									<input type="text" class="timePicker"><br> <input
										type="hidden" name="course_id" id="course_id">

									<button class="btn btn-success hwLayer-ok" type="submit">确定</button>
									<button class="btn btn-warning hwLayer-cancel" type="reset">取消</button>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!--=================修改課程===================-->
			<div id='calendar'></div>
		</div>

	</div>

</body>

</html>
