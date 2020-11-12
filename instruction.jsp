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
    <h2 align="center" style="border-style:dashed">游戏规则</h2>
    
    <div align="center" style="border-style:solid;">
    	<p>1、输入数字</p>
    	<p>2、点击确定</p>
    </div>
    <br>
    <div align="center">
    	
		<input type="button" value="新游戏" onclick="newGame()"/>
		<input type="button" value="继续游戏" onclick="continueGame()"/>
    </div>
  </body>
</html>

<script>

function newGame(){
	window.location.href="new_game.jsp";
	
}


function continueGame(){
	window.location.href="gaming.jsp";
	
}

</script>
