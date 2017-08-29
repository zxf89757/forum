<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>用户注册</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapvalidator/dist/css/bootstrapValidator.css"/>
    <script src="${pageContext.request.contextPath}/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrapvalidator/dist/js/language/zh_CN.js"></script>
    
</head>
<body style="background:rgb(252,252,252)" class="body-home">

	<div>
		<%@ include file="top.jsp" %>
    </div>
	
<div class="container">
	<div class="panel panel-default" style="margin:0 auto; width:60%;">
	    <div class="panel-heading">
	        <h3 class="panel-title">用户注册</h3>
	    </div>
		<div class="panel-body">
			<div class="text-danger">
       			<s:actionerror/>
			</div>
			<form id="signupForm" class="form-horizontal" action="${ pageContext.request.contextPath }/user_regist.action"  method="post" enctype="multipart/form-data">
			    <div style="margin:0 auto; width:100%;">
			      	<div class="form-group">
			            <label class="col-sm-2 control-label"> 账号：</label>
			            <div class="col-sm-10">
			            <input class="form-control" placeholder="输入账号" id="username" type="text" name="username"/>
						</div>	
					</div>
			        <div class="form-group">
			            <label  class="col-sm-2 control-label"> 密码：</label>
			            <div class="col-sm-10">
			            <input class="form-control" placeholder="输入密码" id="password" type="password" name="password"/>
			            </div>
			        </div>
			      	<div class="form-group">
			            <label class="col-sm-2 control-label"> 确认密码：</label>
			            <div class="col-sm-10">
			            <input class="form-control" placeholder="再次输入密码" id="repassword"  type="password" name="repassword"/>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label"> 用户名：</label>
			            <div class="col-sm-10">
			            <input class="form-control" placeholder="输入昵称" type="text" id="name" name="name"/>
			            </div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label">性别：</label>
			            <div class="col-sm-10">
						<label class="radio-inline">
							<input type="radio" name="sex" value="男" checked="checked"/>男
						</label>
						<label class="radio-inline">
						  	<input type="radio" name="sex" value="女"/>女
						</label>
						</div>
			        </div>
			        <div class="form-group">
			            <label class="col-sm-2 control-label"> E-mail：</label>
			            <div class="col-sm-10">
			            <input class="form-control" placeholder="输入邮箱" type="text" id="email" name="email"/>
			            </div>
			        </div>
			        <div class="form-group">
			        	<label class="col-sm-2 control-label"> 上传头像：</label>
			        	<div class="col-sm-10">
			            <input  type="file" id="upload" name="upload"/>
			            </div>
			        </div>
			        <div class="form-group">
			        	<label class="col-sm-2 control-label"> 验证码：</label>
			        	<div class="col-sm-10">
			            <input id="checkcode" type="text" placeholder="输入验证码" name="checkcode" maxlength="4"/> <img id="checkImg" data-toggle="tooltip" data-placement="bottom" class="captchaImage" src="${pageContext.request.contextPath}/checkImg.action" onclick="change()" title="点击更换验证码"/>
			            </div>
			        </div>
			        <div class="form-group">
			    		<div class="col-sm-offset-2 col-sm-10">
			      			<button type="submit" class="btn btn-primary">注册</button>
			      			<button type="reset" class="btn btn-warning">重置</button>
			    		</div>
			  		</div>
			    </div>
			</form>
		</div>
	</div>
</div>
	
	<div>
		<%@ include file="bottom.jsp" %>
    </div>


<script>
	function change(){
		var img1 = document.getElementById("checkImg");
		img1.src="${pageContext.request.contextPath}/checkImg.action?xxx="+new Date().getTime();
	}
	
	$().ready(function() {
		// 在键盘按下并释放及提交后验证提交表单
		  $("#signupForm").bootstrapValidator({
			  message: '这个值没有被验证',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	username: {
		        		validators: {  
		                    notEmpty: {  
		                        message: "用户名不能为空"
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: "长度必须在6-30之间"
		                    },
		                    regexp: {
		                        regexp: /^[a-zA-Z0-9_\.]+$/,
		                        message: "用户名只能由字母、数字、点和下划线组成"
		                    },
		                    remote: {  
		                        url : '${pageContext.request.contextPath}/user_findByName.action',  
		                        message : "该用户名已经存在",  
		                        delay : 2000,  
		                        type : 'post',
		                        data:{
		                            username:function(){ return $("#username").val(); }
		                       }
		                    },
		                    different: {  
		                        field: 'password',  
		                        message: "用户名和密码不能相同"
		                    }  
		                }  
		        	},
		        	password: {
		                validators: {
		                    notEmpty: {
		                        message: "密码不能为空"
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: "长度必须在6-30之间"
		                    },
		                    identical: {
		                        field: 'repassword',
		                        message: "两次输入密码不一致"
		                    },
		                    different: {
		                        field: 'username',
		                        message: "用户名和密码不能相同"
		                    },
		                    regexp: {
		                        regexp: /^[a-zA-Z0-9_\.]+$/,
		                        message: "用户名只能由字母、数字、点和下划线组成"
		                    }
		                }
		            },
		            repassword: {
		                validators: {
		                	notEmpty: {
		                        message: "密码不能为空"
		                    },
		                    stringLength: {
		                        min: 6,
		                        max: 30,
		                        message: "长度必须在6-30之间"
		                    },
		                	identical: {
		                        field: 'password',
		                        message: "两次输入密码不一致"
		                    },
		                    different: {
		                        field: 'username',
		                        message: "用户名和密码不能相同"
		                    },
		                    regexp: {
		                        regexp: /^[a-zA-Z0-9_\.]+$/,
		                        message: "用户名只能由字母、数字、点和下划线组成"
		                    }
		                }
		            },
		            name: {
		                validators: {
		                	stringLength: {
		                        max: 10,
		                        message: "长度必须小于10"
		                    }
		                }
		            },
		        	email: {
		                validators: {
		                    emailAddress: {
		                        message: "邮箱格式不正确"
		                    }
		                }
		            },
		        	checkcode:{
		        		validators: { 
		        			notEmpty: {
		                    },
		        			remote: {  
		                        url : '${pageContext.request.contextPath}/user_checkcode.action',  
		                        message : "验证码输入错误",  
		                        delay : 500,  
		                        type : 'post',
		                        data:{
		                        	checkcode:function(){ return $("#checkcode").val(); }
		                        }
		                    }			        		
		        		}
		        	}
		        }
		  });
	});
</script>
</body>
</html>