<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>用户登录</title>
	
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
    
<div class="container" style="min-height:370px"> 
    <div class="panel panel-default" style="margin:0 auto; width:60%">
		<div class="panel-heading">
			<h3 class="panel-title">用户登录</h3>						
		</div>
		<div class="panel-body">
			<div class="text-danger">
       			<s:actionerror/>
			</div>
			<form id="defaultForm" class="form-horizontal" action="${ pageContext.request.contextPath }/user_login.action"  method="post">
				<div style="margin:0 auto; width:100%;">
					<div class="form-group">
						<label class="col-sm-2 control-label"> 账号：</label>
						<div class="col-sm-10">
						<input class="form-control" placeholder="输入账号" type="text" name="username"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> 密码：</label>
						<div class="col-sm-10">
						<input class="form-control" placeholder="输入密码" type="password" name="password"/>
						</div>
					</div>
			  		<div class="form-group">
			  			<label class="col-sm-2 control-label" id="captchaOperation"></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="输入答案" name="captcha" />
						</div>
					</div>
					<div class="form-group">
			    		<div class="col-sm-offset-2 col-sm-10">
			      			<button type="submit" class="btn btn-primary">登录</button>
			      			<button type="reset" class="btn btn-info">重置</button>
			      			<a class="btn btn-info" href="${ pageContext.request.contextPath }/user_registPage.action" role="button">前往注册</a>
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
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));
    
    $('#defaultForm').bootstrapValidator({
//      live: 'disabled',
      message: 'This value is not valid',
      feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
          captcha: {
              validators: {
                  callback: {
                      message: 'Wrong answer',
                      callback: function(value, validator) {
                          var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                          return value == sum;
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