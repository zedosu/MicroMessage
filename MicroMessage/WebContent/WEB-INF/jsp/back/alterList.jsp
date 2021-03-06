<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible"content="IE=9; IE=8; IE=7; IE=EDGE" />
		<title>修改列表</title>
		<link href="<%=basePath%>resources/css/all.css" rel="stylesheet" type="text/css" />
		<script src="<%=basePath%>resources/js/common/jquery-1.8.0.min.js"></script>
		<script src="<%=basePath%>resources/js/back/alterList.js"></script>
	</head>
	<body style="background: #e1e9eb;">
		<form action="<%=basePath%>AlterList.action" id="mainForm" method="post">
			<div class="right">
				<div class="current">当前位置：<a href="<%=basePath%>List.action" style="color:#6E6E6E;">内容列表</a> &gt; 修改</div>
				<div class="rightCont">
					<p class="g_title fix">请修改：</p>	
					<table class="tab1">
						<tbody>
							<tr>
								<td hidden>
								<input name="id" type="text" class="allInput" value="${id }"/>
								</td>
								<td width="90" align="right">指令名称：</td>
								<td>
									<input name="command" type="text" class="allInput" value="${name }"/>
								</td>
								<td width="90" align="right">描述：</td>
								<td>
									<input name="description" type="text" class="allInput" value="${description }"/>
								</td>
	       					</tr>
	       					<c:forEach items="${contents }" var="content" varStatus="status">
							<tr>
	       						<td width="90" align="right">内容${status.index+1}：</td>
								<td>
									<input name="content" type="text" class="allInput" value="${content }"/>
								</td>	       					
	       					</tr>
	       					</c:forEach>
	       					<tr>
	       						<td width="85" align="right"><input type="submit" class="tabSub" value="修 改" /></td>	       					
	       					</tr>
						</tbody>
					</table>
				</div>
			</div>
	    </form>
      
	</body>
</html>