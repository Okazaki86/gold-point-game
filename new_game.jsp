<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE  >
<html>
<head>
<base href="<%=basePath%>">


<title>My JSP 'index.jsp' starting page</title>
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
	<div align="center">
		<form id="add_user_num" name="add_user_num" action="gaming.jsp">
			请输入玩家数量： <input type="number" id="user_num" name="user_num" value="" required min="0" max="100" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
			
			
			<input type="submit" value="完成" > 
			
					
		</form>
	</div>
	<div align="right">
    	
		<input type="button" value="返回" onclick="window.location.href='instruction.jsp'"/>
		
    </div>
</body>
</html>

