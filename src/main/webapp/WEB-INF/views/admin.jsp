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
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='css/googleapis.css' rel='stylesheet' type='text/css'>
<link href='css/hw-layer.css' rel='stylesheet' type='text/css'>

<script src="js/jquery-3.2.1.min.js"></script>
<script src='lib/jquery.min.js'></script>
<script src="js/jquery.min.js"></script>

<script src='lib/moment.min.js'></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jquery.validate.js"></script>

<script src="js/matrix.js"></script>
<script src="js/matrix.form_validation.js?version=4"></script>


<!-- Qtip -->
<link type="text/css" rel="stylesheet" href="css/jquery.qtip.css" />
<script type="text/javascript" src="js/jquery.qtip.js"></script>

<!-- DatePicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="css/jquery-ui.min.css">
<script src="js/jquery-ui.min.js"></script>-->

<!-- ContextJS -->
<link rel="stylesheet" href="css/context.bootstrap.css" />
<script src='js/context.js'></script>

<!-- timepicker -->
<link rel="stylesheet" href="css/timepicker.css" />
<script src='js/jquery.timepicker.js?version=4'></script>

<!-- Full calendar -->
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet'
	media='print' />
<script src='js/fullcalendar.min.js'></script>


<script>
	var contextEle = "";
	var contextTitle = "";

	$(function() {

		// qtip
		var tooltip = $('<div>').qtip({
			id : 'fullcalendar',
			prerender : true,
			overwrite : false,
			content : {
				text : ' ',
				title : {
					button : true
				}
			},
			position : {
				my : 'bottom center',
				at : 'top center',
				target : 'mouse',
				viewport : $('#fullcalendar'),
				adjust : {
					mouse : false,
					scroll : false
				}
			},
			show : false,
			hide : false,
			style : 'qtip-dark qtip-shadow qtip-rounded'
		}).qtip('api');

		// fullCalendar
		$('#calendar').fullCalendar(
		{
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay,listWeek'
			},
			defaultDate : getNowFormatDate(),
			navLinks : true, // can click day/week names to navigate views
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : [${courses}],
			eventClick : function(data, event, view) {
				//扣掉+08:00時區
				var start = new Date(data.start-60000*480);
				var end = new Date(data.end-60000*480);
				var content = '<h4>'
							+ data.title
							+ '</h4>'
							+ '<p><b>Start:</b>&nbsp;'
							+ start
							+ '<br />'
							+ '<p><b>End:</b>&nbsp;&nbsp;&nbsp;' + end + '</p>'
							+ '<p><b>Description:</b><br>' + data.description + '</p>';
				tooltip.set({
					'content.title' : "课程信息",
					'content.text' : content
				}).reposition(event).show(event);
			}
	});

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
			action : function() {
				fillEditForm();
				showLayer('hw-layer-edit');
			}
		}, {
			text : '已上课',
			action : function() {
				if (confirm('确定修改?\n' + contextTitle)) {
					PassedCourse();
					window.location.reload();
				}
			}
		}, {
			text : '删除',
			action : function() {
				if (confirm('确定删除?\n' + contextTitle)) {
					deleteCourse();
					window.location.reload();
				}
			}
		} ]);

		// 取得右鍵元素
		$(document).on('contextmenu', '.fc-event', function(e) {
			contextEle = $(this);
			contextTitle = $(this).find(".fc-title").text();
		});
		$(document).on('contextmenu', '.fc-list-item', function(e) {
			contextEle = $(this);
			contextTitle = $(this).find(".fc-list-item-title").text();
		});
		
		// 刪課
		function deleteCourse() {
			$.ajax({
				type : "post",
				url : "deleteCourse",
				data : {
					"course_id" : contextTitle
				},
				dataType : "text",
				success : function(e) {
					alert(e);
				},
				error : function(e) {
					alert("服务器返回状态错误");
				}
			});
		}

		// 課已上
		function PassedCourse() {
			$.ajax({
				type : "post",
				url : "PassedCourse",
				data : {
					"course_id" : contextTitle
				},
				dataType : "text",
				success : function(e) {
					alert(e);
				},
				error : function(e) {
					alert("服务器返回状态错误");
				}
			});
		}

		
		
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

	//取得學生清單by教師
	function getStudent(sellectBox) {
		tid = sellectBox.value; // 設定教師ID以便課程檢索
		var formSuffix = $(sellectBox).attr('id').split('-')[1]; // 取得表單後綴,讓function在add或edit都能用
		var temp=[];
		arrStudent = new Array();
		arrCourse = null;
		
		//從課表中找出這名老師的學生
		<c:forEach var="course" items="${student_courses}"> 
			if (sellectBox.value == "${course.teacher_id}") {
				
				temp.push("${course.student_name}/${course.student_id}");
				
			}
		</c:forEach>
		
		//去除重複
	    var hash=[];
	    for (var i = 0; i < temp.length; i++) {
	    	hash[temp[i]]=null;
	    }
	    for(var key in hash){
	    	arrStudent.push(key);        
	    }
		
		//寫回option
		var str = "<option>---请选择---</option>";
		for (var i = 0; i < arrStudent.length; i++) {
			var sp = arrStudent[i].split("/");
			str += "<option id=\""+ sp[1] +"\" value=\""+ sp[1] +"\">" + arrStudent[i] + "</option>"
		}

		document.all('student-' + formSuffix).innerHTML = str;
		document.all('course-' + formSuffix).innerHTML = ""; // 選完課又偷改老師,要清掉唷
	}

	//取得課程清單by教師&學生
	function getCourse(sellectBox) {
		var formSuffix = $(sellectBox).attr('id').split('-')[1];
		var temp = [];
		arrCourse = [];

		// 用老師id&學生id查課表
		<c:forEach var="course" items="${student_courses}"> 
			if (sellectBox.value == "${course.student_id}" && tid == "${course.teacher_id}") {
				temp.push("${course.course_name}");
			}
		</c:forEach>

		//去除重複
	    var hash=[];
	    for (var i = 0; i < temp.length; i++) {
	    	hash[temp[i]]=null;
	    }
	    for(var key in hash){
	    	arrCourse.push(key);        
	    }
		
		
		
		//寫回option
		var str = "<option>---请选择---</option>";
		for (var i = 0; i < arrCourse.length; i++) {
			str += "<option id=\""+ arrCourse[i] +"\" value=\""+ arrCourse[i] +"\">"
					+ arrCourse[i] + "</option>"
		}
		document.all('course-' + formSuffix).innerHTML = str;
	}

	
	function cleanForm() { //按了取消表單清空
		document.all('student-add').innerHTML = "";
		document.all('course-add').innerHTML = "";
		$('#addCourse')[0].reset();
		$('#editCourse')[0].reset();
	}

	// 改課相關
	/* fillEditForm()自動填值
	 ** deleteCourse()刪課
	 ** courseDone()  課程已上
	 */
	//自動填值
	function fillEditForm() {
		var course_id = new Array();
		course_id = contextTitle.split("/");

		//自動填值
		$('#teacher-edit').val(course_id[5]);
		getStudent($('#teacher-edit')[0]);
		$('#student-edit').val(course_id[4]);
		getCourse($('#student-edit')[0]);
		$('#course-edit').val(course_id[0]);

		//修改的課號
		$('#course_id').val(course_id[3]);
	}


	//排課&改課的日期驗證
	function courseSubmit(suffix) {
		var classDate = $('#classDate-' + suffix).val();
		var start = new Date(Date.parse(classDate + " "
				+ $('#startTime-' + suffix).val() + ":00"));
		var end = new Date(Date.parse(classDate + " "
				+ $('#endTime-' + suffix).val() + ":00"));

		if (start >= end) {
			alert("下课时间必须晚于上课时间！");
		} else {
			var teacher_id = $('#teacher-' + suffix).val();
			var student_id = $('#student-' + suffix).val();
			var json_course = eval("[" + "${courses}" + "]");

			var conflict = "";
			//console.log("start:"+start+"\nend:"+end);
			$.each(json_course, function(index, course) {
				var title = course.title.split('/');
				//console.log(title);
					var c_start = new Date(course.start);
					var c_end = new Date(course.end);				
				//console.log("course:"+title[3]+"\nc_start:"+c_start+"\nc_end: "+c_end);
				if (title[5] == teacher_id || title[4] == student_id) {
					// (開始時間包了已排時段)||(結束時間包了已排時段)||(包住了已排時段)
					if ((c_start < start && start < c_end)
							|| (c_start < end && end < c_end)
							|| (c_start >= start && c_end <= end)){
						
						conflict = course.title+"\nStart: "+c_start+"\nEnd:   "+c_end;
						//console.log(course.title+","+conflict);
						return false; //break
					}
				}
			});

			if (conflict != "") {
				alert("课程冲突,请选择其他时间\n" + conflict);
				return false;
			}
		}
	}
</script>
<!--//===========================新增課表彈出式畫面Css===================-->
<style  type="text/css">

#主要是調整margin-top的高度
.hw-layer-wrap {
	box-sizing: border-box;
	width: 570px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -285px;
	margin-top: -330.8px; #-180.8
	border-radius: 3px;
	background-color: #fff;
	box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.12);
	padding: 45px 50px;
}
</style>

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
				<a href="index" title="Go to Home" class="tip-bottom current"><i
					class="icon-home"></i> Home</a>
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
								<form id="addCourse" class="my_validate" action="arrangeCourse"
									method="post" onsubmit="return courseSubmit('add')">

									教师名称/ID:<br> 
									<select name="teacher_id" id="teacher-add" class="required" onchange="getStudent(this)">
										<option>---请选择---</option>
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select><br> 
									学生名称/ID:<br> 
									<select name="student_id" class="required" id="student-add" onchange="getCourse(this)"></select><br> 
									选择课程:<br> 
									<select name="course_name" id="course-add" class="required"></select><br> 
									上课日期:<br> 
									<input type="text" class="datepicker required" id="classDate-add" name="classDate"><br> 
									上课时间:<br> <input type="text" class="timePicker required" id="startTime-add" name="time"><br> 
									下课时间:<br> <input type="text" class="timePicker required" id="endTime-add" name="rest_time"><br>

									<button class="btn btn-success hwLayer-ok" type="submit">确定</button>
									<button class="btn btn-warning hwLayer-cancel" type="reset" onclick="cleanForm()">取 消</button>
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
								<form id="editCourse" class="my_validate" action="editCourse"
									method="post" onsubmit="return courseSubmit('edit')">

									教师名称/ID:<br> <select name="teacher_id" class="required"
										id="teacher-edit" onchange="getStudent(this)">
										<option>---请选择---</option>
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select><br> 学生名称/ID:<br> <select name="student_id"
										class="required" id="student-edit" onchange="getCourse(this)"></select><br>
									选择课程:<br> <select name="course_name" class="required"
										id="course-edit"></select><br> 上课日期:<br> <input
										type="text" class="datepicker required" name="classDate"
										id="classDate-edit"><br> 上课时间:<br> <input
										type="text" class="timePicker required" name="time"
										id="startTime-edit"><br> 下课时间:<br> <input
										type="text" class="timePicker required" name="rest_time"
										id="endTime-edit"><br> <input type="hidden"
										name="course_id" id="course_id">

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
