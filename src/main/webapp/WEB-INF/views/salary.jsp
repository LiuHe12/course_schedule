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
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.tables.js"></script>

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
	});
</script>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
</div>
<!--close-Header-part--> 

	<c:import url="top-bar.jsp"></c:import>
	<c:import url="left-bar.jsp"></c:import>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="tables" class="current">查看薪資</a> </div>
    <h1>查看薪資</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      

        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Data table</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Teacher_ID</th>
                  <th>Time</th>
                  <th>Bonus</th>
                  <th>Salary</th>
                </tr>
              </thead>
              <tbody>
              
                <c:forEach var="teacher_salary" items="${teacher_salaries}">
                	<tr class="${teacher_salary.teacher_id}">
                		<td>
	                		<script>
	                		<c:forEach var="teacher" items="${teachers}">
	                		if(${teacher_salary.teacher_id}==<%=session.getAttribute("user")%>){
	                			
	                		}
	                		</c:forEach>
	                		${teacher_salary.teacher_id}
	                		</script>
                		</td>
	                	<td>${teacher_salary.time}</td>
	                	<td class="${teacher_salary.bonus}">${teacher_salary.bonus}</td>
	                	<td class="${teacher_salary.salary}">${teacher_salary.salary}</td>
	                </tr>
				</c:forEach>
				
				<!-- 
                <tr class="teacher_id">
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0</td>
                  <td>Win 95+</td>
                  <td class="center">4</td>
                </tr>
                <tr class="gradeC">
                  <td>Trident</td>
                  <td>Internet
                    Explorer 5.0</td>
                  <td>Win 95+</td>
                  <td class="center">5</td>
                </tr> -->
                
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



</body>
</html>
