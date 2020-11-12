<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>黄金点游戏</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <h1 align="center">黄金点游戏</h1>
    <h2 align="center" style="border-style:dashed">历史记录</h2>
    
   
    <div align="center">
    	
		<input type="button" value="结果记录" onclick="window.location.href='record_list2.jsp'"/>
		<input type="button" value="详细记录" onclick="window.location.href='record_list.jsp'"/>
    </div>
    <div align="right">
    	
		<input type="button" value="返回" onclick="window.location.href='gaming.jsp'"/>
		
    </div>
  </body>
</html>

