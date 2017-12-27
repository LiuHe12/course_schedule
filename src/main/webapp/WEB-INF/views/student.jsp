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
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='css/googleapis.css' rel='stylesheet' type='text/css'>
<link href='css/hw-layer.css' rel='stylesheet' type='text/css'>
<script src="js/jquery-3.2.1.min.js"></script>

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

<!-- Qtip -->
<link type="text/css" rel="stylesheet" href="css/jquery.qtip.css" />
<script type="text/javascript" src="js/jquery.qtip.js"></script>

<script>
	var contextEle = "";
	var contextTitle = "";
	var contextColor = "";

	$(document).ready(function() {

		
		// qtip
		var tooltip = $('<div/>').qtip({
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
			events : [${courses}],
			eventClick : function(data, event, view) {
				//扣掉+08:00時區
				var start = new Date(data.start - 60000 * 480);
				var end = new Date(data.end - 60000 * 480);
				var content = '<h4>'
						+ data.title
						+ '</h4>'
						+ '<p><b>Start:</b>&nbsp;'
						+ start
						+ '<br />'
						+ '<p><b>End:</b>&nbsp;&nbsp;&nbsp;'
						+ end
						+ '</p>'
						+ '<p><b>Description:</b><br>'
						+ data.description
						+ '</p>';

				tooltip.set({
					'content.title' : "课程信息",
					'content.text' : content
				}).reposition(event)
						.show(event);
			}
		});
		
		
		context.init({
			fadeSpeed : 100,
			filter : function($obj) {
			},
			above : 'auto',
			preventDoubleContext : true,
			compress : false
		});		
		context.attach('.fc-event,.fc-list-item', [ {
			text : '课程評價',
			action : function(){
				if(contextColor == "red"){
					$('#course_id').val(contextTitle);
					addSatisfaction();
				} else if(contextColor == "gray"){
					alert("此课程已评价！");
				} else{
					alert("课还没上，请课后再评分");
				}
			}
		}
		]);
		
		function addSatisfaction(){
			showLayer('hw-layer');
		}
		
		
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
	
		$('.hwLayer-ok,.hwLayer-cancel,.hwLayer-close').on(
				'click', function() {
					hideLayer();
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
	
	// 取得右鍵元素
	$(document).on('contextmenu', '.fc-event', function(e) {
		contextEle = $(this);
		contextTitle = $(this).find(".fc-title").text();
		contextColor = getContextColor();
	});
	$(document).on('contextmenu', '.fc-list-item', function(e) {
		contextEle = $(this);
		contextTitle = $(this).find(".fc-list-item-title").text();
		contextColor = getContextColor();
	});
	
	
	
	function getContextColor(sourse) {
		var color = "";
		if(sourse == 'month'){
			color = $(contextEle).css("background-color");
		}else if(sourse == 'list'){
			color = $(contextEle).find(".fc-event-dot").css("background-color");
			console.log(color);
		}
		
		switch (color) {
		case "rgb(255, 0, 0)":
			color = "red";
			break;
		case "rgb(0, 0, 255)":
			color = "blue";
			break;
		default:
			color = "gray";
		}
		console.log(color);
		return color;
	}

	

		
		
	
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



	<c:import url="top-bar.jsp"></c:import>
	<c:import url="left-bar.jsp"></c:import>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="index" title="Go to Home" class="tip-bottom current"><i class="icon-home"></i> Home</a>
			</div>
			
			<!-- **********课程评价********** -->
			<div class="hw-overlay" id="hw-layer" style="display: none">
					<div class="hw-layer-wrap">
						<span class="glyphicon glyphicon-remove hwLayer-close"></span>
						<div class="row">
							<div class="col-md-3 col-sm-12 hw-icon">
								<i class="glyphicon glyphicon-info-sign"></i>
							</div>
							<div class="col-md-9 col-sm-12">
								<h3>课程评价</h3>
								<form id="addSatisfaction" class="my_validate" action="addSatisfaction" method="post" onsubmit="return confirm('确定提交？')">

									课程名称：<br><input id="course_id" name="course_id" type="text" disabled style="width:100%" /><br>
									课程评价：（5分最高分，1分最低分）<br>
					                <label><input type="radio" name="satisfaction" value="5"/>5分</label>
					                <label><input type="radio" name="satisfaction" value="4"/>4分</label>
					                <label><input type="radio" name="satisfaction" value="3"/>3分</label>	
					                <label><input type="radio" name="satisfaction" value="2"/>2分</label>			
					                <label><input type="radio" name="satisfaction" value="1"/>1分</label>											
									
									<!-- <textarea id="remind" name="remind" style="width:100%"></textarea> -->
									<br><br>
									<button class="btn btn-success hwLayer-ok" type="submit">确定</button>
									<button class="btn btn-warning hwLayer-cancel" type="reset" onclick="cleanForm()">取 消</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			<!-- **********课程评价結束********** -->		

		</div>

		<div id='calendar'></div>
	</div>

</body>

</html>
