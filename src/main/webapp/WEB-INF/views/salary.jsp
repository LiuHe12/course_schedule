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
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='css/googleapis.css' rel='stylesheet' type='text/css'>
<link href='css/hw-layer.css' rel='stylesheet' type='text/css'>
<link href='css/MonthPicker.css' rel='stylesheet' type='text/css'>
<link href='css/jquery-ui.min.css' rel='stylesheet' type='text/css'>
<link href='css/datepicker.css' rel='stylesheet' type='text/css'>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/matrix.js"></script>
<script src="js/matrix.tables.js?version=1"></script>
<script src="js/matrix.form_validation.js"></script>
<script src="js/MonthPicker.js"></script>
<script>
	
	$(document).ready(function() {

		var id = "<%=session.getAttribute("identity")%>";
		if (id == 0) { // admin
			$("#addBonus").show();
		}

		/*$('.monthpicker').MonthPicker({
			Button : false,
			MonthFormat : "yy-mm",
			Position : {
				collision: 'fit',
				at: 'bottom+10'
			}
		});*/

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
				<a href="index" title="Go to Home" class="tip-bottom"> <i
					class="icon-home"></i> Home
				</a> <a href="#" class="current">查看薪資</a>
			</div>
			<h1>
				查看薪資
				<button id="addBonus" class="btn btn-success show-layer"
					style="float: right; margin-right: 20px; display: none"
					data-show-layer="hw-layer">新增奖金</button>
			</h1>

		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>Data table</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th>Time</th>
										<th>Teacher_ID</th>
										<th>Teacher_Name</th>
										<th>Bonus</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="teacher_salary" items="${teacher_salaries}">
										<tr class="${teacher_salary.teacher_id}">
											<td>${teacher_salary.time}</td>
											<td>${teacher_salary.teacher_id}</td>
											<td>${teacher_salary.teacher_name}</td>
											<td class="${teacher_salary.bonus}">${teacher_salary.bonus}</td>
											<td class="${teacher_salary.salary}">${teacher_salary.salary}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 新增獎金 -->
				<div class="hw-overlay" id="hw-layer" style="display: none">
					<div class="hw-layer-wrap" style="margin-top: -330.8px !important;">
						<span class="glyphicon glyphicon-remove hwLayer-close"></span>
						<div class="row">
							<div class="col-md-3 col-sm-12 hw-icon">
								<i class="glyphicon glyphicon-info-sign"></i>
							</div>
							<div class="col-md-9 col-sm-12">
								<h3>新增奖金</h3>
								<form id="addBonus" class="my_validate" action="addBonus"
									method="post" onsubmit="return courseSubmit('add')">

									教师名称/ID：<br> <select name="teacher_id" id="teacher_id"
										class="required">
										<option>---请选择---</option>
										<c:forEach var="teacher" items="${teachers}">
											<option id="${teacher.id}" value="${teacher.id}">${teacher.name}/${teacher.id}</option>
										</c:forEach>
									</select><br> 输入年月：(例：2018-01)<br> <input type="text"
										class="required monthpicker" id="time" name="time"><br>
									输入金额：<br> <input type="text" class="required digits"
										id="bonus" name="bonus"><br>

									<button class="btn btn-success hwLayer-ok" type="submit">确定</button>
									<button class="btn btn-warning hwLayer-cancel" type="reset">取消</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>
