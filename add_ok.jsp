<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page
	import="java.sql.*,java.io.*,java.util.ArrayList,java.lang.Math,java.lang.Double"%>
<html>
<head>
<title>保存增加</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
	<%
			
			String[] user = request.getParameterValues("user");
			String[] strnum = (request.getParameterValues("num"));
			ArrayList<Double> num=new ArrayList<Double>();
			int len=strnum.length;
			boolean illegalnum=false;
			for(int i=0;i<len;i++){
				
				num.add(new Double(Double.parseDouble(strnum[i])));
				
				if(num.get(i)<0 || num.get(i)>100){
					out.print("玩家:'"+user[i]+"'输入数字超出范围！<br>");
					illegalnum=true;}
			}
			if(illegalnum){
			%>
	<input type='button' value='重新输入'
		onclick="javascript:history.back(-1);">
	<%
				}
				else{
			
			
			request.setCharacterEncoding("UTF-8");
			//out.println("页面传递过来的数据获取完毕");
			System.out.println("页面传递过来的数据获取完毕");
			//System.out.println("id="+id+",deviceId="+deviceId+",deviceName="+deviceName);

			//开始连接数据库，需要先把mysql-connector-java-5.0.4-bin.jar和json.jar拷贝到ROOT/WEB-INF/lib下
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException classnotfoundexception) {
				classnotfoundexception.printStackTrace();
			}
			//out.println("加载了JDBC驱动");
			System.out.println("加载了JDBC驱动");
			
			
			//然后链接数据库，开始操作数据表
			try {
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/mydb?user=DataUser&password=1q2w3e&useUnicode=true&characterEncoding=UTF-8");
				System.out.println("准备statement。");
				Statement statement = conn.createStatement();
				System.out.println("已经链接上数据库！");
				//out.println("Connect Database Ok！！！<br>");
				int term=0;
				ResultSet rs = statement.executeQuery("select max(term) from game");
				if(rs.next()){term=(rs.getInt("max(term)"));}
				term+=1;
				ArrayList<String> sql =new ArrayList<>();
				double sum=0;
				for(int i=0;i<len;i++){
				sum+=num.get(i).doubleValue();
				sql.add("insert into game(term,user,num) values("+ term + ",'" + user[i]+ "'," +num.get(i).doubleValue() + ")");
				//out.println("即将执行的SQL语句是："+sql.get(i));
				System.out.println("即将执行的SQL语句是："+sql.get(i));
				statement.executeUpdate(sql.get(i));
				
				}
				double goldpoint;
				goldpoint=0.618*sum/4;
				ArrayList<Double> d=new ArrayList<>();
				for(int i=0;i<len;i++){
					d.add((Math.abs(num.get(i).doubleValue()-goldpoint)));}
				double m=num.get(0).doubleValue();
				int k=0;
				for(int i=0;i<len;i++){if (num.get(i).doubleValue()<m) {m=num.get(i).doubleValue();k=i;}}
				out.println("goldpoint:"+goldpoint+"\nwinner:"+user[k]);
				
				
				String sql2=new String("insert into outcome(term,goldpoint,winner) values("+ term +","+goldpoint+ ",'" + user[k]+ "')");
				//out.println("即将执行的SQL语句是："+sql.get(i));
				System.out.println("即将执行的SQL语句是："+sql2);
				statement.executeUpdate(sql2);
				
			
				statement.close();
				conn.close();
				//out.println("Database Closed！！！<br>");
				System.out.println("操作数据完毕，关闭了数据库！");
		%>
	<br>
	<input type="button" name="listBtn" value="下一回合"
		onclick="window.location='gaming.jsp'">
	<%
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
		%>
	<br>

	<input type="button" name="listBtn" value="游戏失败"
		onclick="window.location='gaming.jsp'">
	<%
			}
			//out.println("页面执行完毕！");
			System.out.println("页面执行完毕！");
			}
		%>

</body>
</html>
