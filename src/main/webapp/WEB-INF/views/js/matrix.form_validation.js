
$(document).ready(function(){
	
	//$('input[type=checkbox],input[type=radio],input[type=file]').uniform();
	
	//$('#s1').select2();
	
	// Form Validation
    $("#basic_validate").validate({
		rules:{
			required:{
				required:true
			},
			email:{
				required:true,
				email: true
			},
			date:{
				required:true,
				date: true
			},
			url:{
				required:true,
				url: true
			}
		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
	
	$("#form_validate").validate({
		rules:{
			required:{
				required:true
			},
			min:{
				required: true,
				min:10
			},
			max:{
				required:true,
				max:24
			},
			number:{
				required:true,
				number:true
			},

		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
	
	$("#password_validate").validate({
		rules:{
			pwd:{
				required: true,
				minlength:6,
				maxlength:20
			},
			pwd2:{
				required:true,
				minlength:6,
				maxlength:20,
				equalTo:"#pwd"
			}
		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
	
	// Created by ChungYuan
	$(".my_validate").validate({
		rules:{
			required:{
				required:true
			},
			number:{
				required:true,
				number:true
			},
			digits:{
				required:true,
				digits:true
			},

			student_pwd:{
				required: true,
				minlength:6,
				maxlength:20
			},
			student_pwd2:{
				required:true,
				minlength:6,
				maxlength:20,
				equalTo:"#student_pwd"
			},
			teacher_pwd:{
				required: true,
				minlength:6,
				maxlength:20
			},
			teacher_pwd2:{
				required:true,
				minlength:6,
				maxlength:20,
				equalTo:"#teacher_pwd"
			},
			admin_pwd:{
				required: true,
				minlength:6,
				maxlength:20
			},
			admin_pwd2:{
				required:true,
				minlength:6,
				maxlength:20,
				equalTo:"#admin_pwd"
			},
			password:{
				required: true,
				minlength:6,
				maxlength:20
			},
			password2:{
				required:true,
				minlength:6,
				maxlength:20,
				equalTo:"#password"
			},
			email:{
				required:true,
				email: true
			}
		},
		errorClass: "help-inline",
		errorElement: "span",
		highlight:function(element, errorClass, validClass) {
			$(element).parents('.control-group').addClass('error');
		},
		unhighlight: function(element, errorClass, validClass) {
			$(element).parents('.control-group').removeClass('error');
			$(element).parents('.control-group').addClass('success');
		}
	});
});
