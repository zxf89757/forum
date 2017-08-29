<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<script>
	$(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>
<header class="bs-docs-nav navbar navbar-static-top" id="top"></header>

<div class="container-fluid">
<div class="navbar navbar-fixed-top">
<div class="navbar-inner">
	<nav class="navbar navbar-default" role="navigation" style="background:rgb(252,252,252)"> 
		<div style="margin:0 auto; width:90%;">
		<div class="navbar-header">
			<a href="${pageContext.request.contextPath}/index.action">
				<img data-toggle="tooltip" data-placement="bottom" src="${pageContext.request.contextPath}/images/logo.jpg" title="回首页" alt="CourseSharing"/>
			</a>
		</div>
		<form class="navbar-form navbar-left" role="search" action="${ pageContext.request.contextPath }/thread_search.action"  method="get">
			<div class="form-group">
				<input type="text" class="form-control" name="searchValue" placeholder="Search">
				<input type="hidden" name="page" value=1>
			</div>
			<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> 提交</button>
		</form>
		<ul class="nav navbar-nav navbar-right">
			<s:if test="#session.existUser == null">
				<li>
					<a href="${ pageContext.request.contextPath }/user_loginPage.action"><span class="glyphicon glyphicon-log-in"></span> 登录</a>
				</li>
				<li>
					<a href="${ pageContext.request.contextPath }/user_registPage.action"><span class="glyphicon glyphicon-plus"></span> 注册</a>
				</li>
			</s:if>
			<s:else>
				<li>
					<a href="${ pageContext.request.contextPath }/user_findByUsername.action?username=<s:property value="#session.existUser.username"/>&page=1">
						<span class="glyphicon glyphicon-user"></span> <s:property value="#session.existUser.name"/>
					</a>
				</li>
				<li>
					<a href="${ pageContext.request.contextPath }/user_quit.action"><span class="glyphicon glyphicon-off"></span>退出</a>
				</li>
			</s:else>
			<li><a href="#top"><span data-toggle="tooltip" data-placement="bottom" title="回顶部" class="glyphicon glyphicon-chevron-up"></span></a></li>
		</ul>
		</div>
	</nav>
</div>
</div>
</div>
    
<div class="container">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid"> 
			<div class="navbar-header">
				<a class="navbar-brand" href="${ pageContext.request.contextPath }/index.action">首页<span class="glyphicon glyphicon-home"></span></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
				<s:iterator var="d" value="#session.dList">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<s:property value="#d.dname"/>
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
	    					<s:iterator var="m" value="#d.departmentMajors">
	    					<li>
								<a href="${ pageContext.request.contextPath }/major_findByMid.action
											?mid=<s:property value="#m.mid"/>">
									<s:property value="#m.mname"/>
								</a>
	    					</li>		
	    					<li class="divider"></li>	
	    					</s:iterator>
	    				</ul>
					</li>
				</s:iterator>
				</ul>
			</div>
		</div>
	</nav>
</div>