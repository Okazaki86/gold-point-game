<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page
	import="java.sql.*,java.io.*,java.util.ArrayList,java.lang.Math,java.lang.Integer"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<%
		int user_num = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException classnotfoundexception) {
			classnotfoundexception.printStackTrace();
		}
		//out.println("加载了JDBC驱动");
		System.out.println("加载了JDBC驱动");

		//然后链接数据库，开始操作数据表
		try {
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/mydb?user=DataUser&password=1q2w3e&useUnicode=true&characterEncoding=UTF-8");
			System.out.println("准备statement。");
			Statement statement = conn.createStatement();
			System.out.println("已经链接上数据库！");
			//out.println("Connect Database Ok！！！<br>");
			String user1 = request.getParameter("user_num");
			if (user1 != null) {
				statement.executeUpdate("delete from game");

				statement.executeUpdate("delete from outcome");
				Integer users = Integer.parseInt(user1);
				user_num = users.intValue();
				System.out.println(user1);
				System.out.println("操作数据完毕，关闭了数据库！user=" + user_num);
			} else {
				ResultSet rs = statement.executeQuery("select count(*) from game group by term");
				rs.next();

				user_num = rs.getInt("count(*)");

				statement.close();
				conn.close();
				//out.println("Database Closed！！！<br>");
				System.out.println("操作数据完毕，关闭了数据库！user=" + user_num);

			}

		} catch (SQLException sqlexception) {
			sqlexception.printStackTrace();

		}
		//out.println("页面执行完毕！");
		System.out.println("页面执行完毕！");
	%>
	<h1 align="center">黄金点游戏</h1>
	<br>
	<div align="center" style="margin:50px;border:2px solid;">
		<form id="add_num" name="add_num" action="add_ok.jsp">
			<table>
				<thead>
					<tr>
						<th>玩家</th>
						<th>数字</th>

					</tr>
				</thead>
				<%
					for (int i = 0; i < user_num; i++) {
						out.print(
								"<tr><td><input type='text' id='user' name='user' value='玩家"+i+"' required ></td><td><input type='password' id='num' name='num' value='' required onkeypress='if(!this.value.match(/^[\\+\\-]?\\d*?\\.?\\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\\+\\-]?\\d+(?:\\.\\d+)?)?$/))this.o_value=this.value' onkeyup='if(!this.value.match(/^[\\+\\-]?\\d*?\\.?\\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\\+\\-]?\\d+(?:\\.\\d+)?)?$/))this.o_value=this.value' onblur='if(!this.value.match(/^(?:[\\+\\-]?\\d+(?:\\.\\d+)?|\\.\\d*?)?$/))this.value=this.o_value;else{if(this.value.match(/^\\.\\d+$/))this.value=0+this.value;if(this.value.match(/^\\.$/))this.value=0;this.o_value=this.value}'></td></tr>");
					}
				%>

				<tr>
					<td><input type="button" name="record" value="历史记录"
						onclick="window.location='history.jsp'">
					<td><input type="submit" name="submit_btn" value="完成"></td>
				</tr>



			</table>
		</form>

	</div>
	<div align="right">
    	
		<input type="button" value="结束游戏" onclick="window.location.href='index.jsp'"/>
		
    </div>
</body>
</html>
