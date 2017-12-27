<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    
<head>
        <title>威德国际语言学校</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" http-equiv="Content-Type" charset="utf-8"/>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="css/matrix-login.css" />
        <link rel="stylesheet" href="css/select2.css" />
        <link href='css/googleapis.css' rel='stylesheet' type='text/css'>
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
        <style type="text/css"> 
            input,select { height:30px; vertical-align:top; border:0px; display:inline-block; width:75%; line-height:22px;  margin-bottom:3px; box-sizing: content-box;line-height: 22px}
         
        
        </style>        
    </head>
    <body>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="login" method="POST">
				<div class="control-group normal_text"> <h3><img src="img/logo.png" alt="Logo" /></h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span><input name="userID" type="text" placeholder="userID" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input name="password"type="password" placeholder="Password" />
                        </div>
                    </div>
                </div>

                <div class="control-group">
                	<div class="controls">
                		<div class="main_input_box">
                			<span class="add-on bg_lb"><i class="icon-reorder"> </i></span>
                			<select name="identity">
  								<option selected="selected" value="0">admin</option>
  								<option value="1">teacher</option>
 								<option value="2">student</option>
							</select>
                		</div>
                	</div>
                </div>
               <div style="text-align: center">
               		${error}
               	</div>
                <div class="form-actions">
                    <span class="pull-left"><a class="flip-link btn btn-info" id="to-recover">Lost password?</a></span>
                    <span class="pull-right"><button type="submit" class="btn btn-success">Login</button></span>
                </div>
            </form>
            <form id="recoverform" action="forgetpwd" class="form-vertical">
				<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
                    <span class="pull-right"><button class="btn btn-info" type="submit">Reecover</button></span>
                </div>
            </form>
        </div>
        
        <script src="js/jquery.min.js"></script>  
        <script src="js/matrix.login.js"></script> 
        <script src="js/select2.min.js"></script> 
    </body>

</html>
