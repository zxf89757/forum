<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><s:property value="threadInfo.title"/></title>
    <style>
		#cke_content{
			width: 77%;
		}    
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    
<script charset="utf-8"  type="text/javascript" src="${pageContext.request.contextPath}/js/myObject.js"></script>
<script charset="utf-8"  type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    window.onload = function() 
    {
    	//参数‘content’是textarea元素的name属性值，而非id属性值
    	editor = CKEDITOR.replace( 'content');
    };
    function save(e){
    	var myFormId="form"+e;
    	$.ajax({
    		type: "POST",
    		url:  '${pageContext.request.contextPath}/floorReply_save.action',
    		data: $('#'+myFormId).serialize(),// 你的formid
    		async: false,
    		error: function(request) {
    			alert("Connection error");
    		},
    		success: function(data) {
    			document.getElementById("count"+e).innerHTML=data;
    			var objId = document.getElementById(myFormId);
    			objId.elements[1].value = "";
    		}
    	});
	}
    function add(e){
    	var myFormId="hiddenform"+e;
    	var hiddenform = document.getElementById(myFormId);
    	var begin=hiddenform.elements[1];
    	var count=document.getElementById("count"+e);
    	if(parseInt(begin.value)<parseInt(count.innerHTML)){
    		$.getJSON("${pageContext.request.contextPath}/floorReply_add.action",$('#'+myFormId).serialize(),function(result){
    			$.each(result,function(i, n){
    				for (x in n) {
    					begin.value=parseInt(begin.value)+1;
    					var p=document.getElementById(""+n[0].rid);
       					p.innerHTML+="<div>"+n[x].name+":"+n[x].content+"<span class='pull-right'>"+n[x].datetime+"</span></div>";
    				}
    			});
    		});
    	}
    }
</script>
</head>
<body style="background:rgb(252,252,252)" class="body-home">

	<div>
		<%@ include file="top.jsp" %>
	</div>
    
<div class="container">
	<div class="row" style="background: rgb(249,249,249)">
    	<div class="col-md-2 col-md-offset-1">
    		<img style="width:140px;height:140px;" class="img-thumbnail" src="${pageContext.request.contextPath}/<s:property value="threadInfo.course.image"/>" alt="加载中..."/>
    	</div>
    	<div class="col-md-9" style="margin-top:33px">
    		<h3>
	    		<a href="${ pageContext.request.contextPath }/thread_findByCid.action
							?cid=<s:property value="threadInfo.course.cid"/>&page=1">
							<s:property value="threadInfo.course.name"/>
				</a>
				<small>
					主贴数：<s:property value="threadInfo.course.threadCount"/>
				</small>
			</h3>
			<p style="text-indent:2em">
    			<s:property value="threadInfo.course.describe"/>
    		</p>
    	</div>
    </div>
    
    <div>
    	<div class="panel panel-default" style="margin:0 auto;">
	    	<div class="panel-heading">
				<h3 class="panel-title"><s:property value="threadInfo.title"/>
				<small class="pull-right">
					<a href="${ pageContext.request.contextPath }/thread_findByCid.action?cid=<s:property value="threadInfo.course.cid"/>&page=1">
							&lt;&lt;回主页</a>
					<s:if test="#session.existUser==null"><a href="${ pageContext.request.contextPath }/user_loginPage.action">快速回复&gt;&gt;</a></s:if>
					<s:else><a href="#signupForm">快速回复&gt;&gt;</a></s:else>
				</small>
				</h3>						
			</div>
	    	<div class="panel-body">
		    	<table class="table table-hover">
		    		<tbody>
		    		<tr><td>
		    			<div class="row">
		    				<div class="col-md-2">
		    					<div><img style="width:161px;height:161px;" class="img-thumbnail" src="${pageContext.request.contextPath}/<s:property value="threadInfo.user.image"/>" alt="加载中..."/>
		    					</div><div>
			    					<a class="btn btn-default btn-xs btn-block" href="${ pageContext.request.contextPath }/user_findByUsername.action
													?username=<s:property value="threadInfo.user.username"/>&page=1">
												<s:property value="threadInfo.user.name"/>
									</a>
		    					</div>
		    				</div>
		    				<div class="col-md-8">
		    					<s:property value="threadInfo.content" escapeHtml="false"/>
		    				</div>
		    			</div>
		    			<div class="row">
		   					<div class="col-md-10 col-md-offset-2">
		   					<div class="pull-right">
								<span>
									楼主
								</span>
								<span data-toggle="tooltip" data-placement="bottom" title="发帖时间">
									<s:property value="threadInfo.dateCreated"/>
								</span>
							</div>
		   					</div>
		   				</div>
		    		</td></tr>
		    		<s:iterator var="r" value="pageReply.list">
		    			<tr><td>
		    				<div class="row">
			    				<div class="col-md-2">
			    					<div><img style="width:161px;height:161px;" class="img-thumbnail" src="${pageContext.request.contextPath}/<s:property value="#r.user.image"/>" alt="加载中..."/>
			    					</div><div>
			    						<a class="btn btn-default btn-xs btn-block" href="${ pageContext.request.contextPath }/user_findByUsername.action
														?username=<s:property value="#r.user.username"/>&page=1">
													<s:property value="#r.user.name"/>
										</a>
			    					</div>
			    				</div>
			    				<div class="col-md-8">
				    				<s:property value="#r.content" escapeHtml="false"/>
			    				</div>
			    			</div>
			    			<div class="row">
			    			<div class="col-md-10 col-md-offset-2">
				    			<div class="panel panel-default">
									<div class="panel-heading" style="padding-bottom: 35px">
									<div class="pull-right">
										<span>
					    					<s:if test="#session.existUser!=null">
					   							<s:if test="#r.user.uid==#session.existUser.uid || #r.thread.user.uid==#session.existUser.uid">
													<a href="${ pageContext.request.contextPath }/reply_deleteByRid.action
															?rid=<s:property value="#r.rid"/>" onclick="javascript:return del();">删除
													</a>
												</s:if>
											</s:if>
										</span>
										<span>
											<s:property value="#r.floor"/>楼
										</span>
										<span data-toggle="tooltip" data-placement="bottom" title="回复时间">
											<s:property value="#r.dateCreated"/>
										</span>
										<span>
											<a class="btn btn-info btn-sm" data-toggle="collapse" href="#collapse<s:property value='#r.rid'/>">展开回复</a>
										</span>
									</div>
									</div>
									<div id="collapse<s:property value='#r.rid'/>" class="panel-collapse collapse">
										<div class="panel-body">
											<div id="rid<s:property value='#r.rid'/>"></div>
											<form id="hiddenform<s:property value='#r.rid'/>">
												<input type="hidden" value="<s:property value='#r.rid'/>" name="rid"/>
												<input type="hidden" value=0 name="begin"/>
												<button type="button" class="btn btn-info btn-xs" onclick="add(<s:property value='#r.rid'/>)">查看更多...共有<span id="count<s:property value='#r.rid'/>"><s:property value="#r.floorReplyCount"/></span>条回复</button>
											</form>
											<form id="form<s:property value='#r.rid'/>">
												<input type="hidden" value="<s:property value='#r.rid'/>" name="rid"/>
												<div class="form-group">
												    <textarea class="form-control" rows="1" name="contents"></textarea>
												</div>
												<s:if test="#session.existUser==null"><a class="btn btn-info btn-sm" href="${ pageContext.request.contextPath }/user_loginPage.action">回复</a></s:if>
												<s:else><button type="button" class="btn btn-info btn-sm" onclick="save(<s:property value='#r.rid'/>)">回复</button></s:else>
											</form>
										</div>
									</div>
								</div>
							</div>
			    			</div>
		    			</td></tr>
		    		</s:iterator>
		    		</tbody>
		    	</table>
    		</div>
		</div>
    </div>
      
    <div style="background: rgb(240,240,240);">
    <nav aria-label="Page navigation">
    <ul class="pagination">
    	<c:if test="${pageReply.totalPage>0}">
	    	<li>
	    		<a href="${ pageContext.request.contextPath }/thread_findByTid.action?tid=${threadInfo.tid}&page=1">首页</a>
			</li>
		</c:if>
		<c:if test="${pageReply.page>1}">
			<li>
			<a aria-label="Previous" href="${ pageContext.request.contextPath }/thread_findByTid.action?tid=${threadInfo.tid}&page=${pageReply.page-1}"><span aria-hidden="true">&laquo;</span></a>
			</li>
		</c:if>
		<c:choose>
			<c:when test="${pageReply.totalPage <= 10 }">
		    	<c:set var="begin" value="1"/>
		    	<c:set var="end" value="${pageReply.totalPage }"/>
			</c:when>
			<c:otherwise>
		    	<c:set var="begin" value="${pageReply.page-5 }"/>
		    	<c:set var="end" value="${pageReply.page+4 }"/>
		    	<c:if test="${begin<1 }">
		        	<c:set var="begin" value="1"/>
		        	<c:set var="end" value="10"/>
				</c:if>
				<c:if test="${end>pageReply.totalPage }">
		        	<c:set var="begin" value="${pageReply.totalPage-9 }"/>
		        	<c:set var="end" value="${pageReply.totalPage }"/>
				</c:if>
			</c:otherwise>
		</c:choose>
		<c:forEach  var="i" begin="${begin }" end="${end }">
			<c:choose>
				<c:when test="${i eq pageReply.page }">
					<li class="active">
						<span>${i }<span class="sr-only">(current)</span></span>
					</li>
				</c:when>
				<c:otherwise>
					<li>
		        	<a href="${ pageContext.request.contextPath }/thread_findByTid.action?tid=${threadInfo.tid}&page=${i }">${i }</a>
		    		</li>
		    	</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageReply.page<pageReply.totalPage}">
			<li>
			<a aria-label="Next" href="${ pageContext.request.contextPath }/thread_findByTid.action?tid=${threadInfo.tid}&page=${pageReply.page+1}"><span aria-hidden="true">&raquo;</span></a>
			</li>
		</c:if>
		<c:if test="${pageReply.totalPage>1}">
	    	<li>
				<a href="${ pageContext.request.contextPath }/thread_findByTid.action?tid=${threadInfo.tid}&page=${pageReply.totalPage}">尾页:${pageReply.totalPage}</a>
			</li>
		</c:if>
	</ul>
	</nav>
	</div>

	<div>
		<s:if test="#session.existUser != null">
			<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">发表回复</h3>						
			</div>
			<div class="panel-body">
				<form id="signupForm" class="form-horizontal" action="${ pageContext.request.contextPath }/reply_save.action"  method="post" enctype="multipart/form-data">
					<div style="margin:0 auto; width:100%;">
						<div class="form-group">
							<div class="col-sm-10 col-sm-offset-2"><textarea class="form-control" id="content" name="content"></textarea></div>
						</div>
						<input type="hidden" value="<s:property value='threadInfo.tid'/>" name="tid"/>
						<div class="form-group">
					    	<div class="col-sm-offset-2 col-sm-10">
					      		<button type="submit" class="btn btn-primary">回复</button>
					    	</div>
				  		</div>
				  	</div>
				</form>
			</div>
			</div>
		</s:if>
	</div>	  	
</div>
 
    <div>
    	<%@ include file="bottom.jsp" %>
	</div>
	
</body>
</html>
