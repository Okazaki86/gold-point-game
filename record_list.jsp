

<%@page contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>记录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta content="" name="description" />
		<meta content="" name="author" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
  
  <body>
    <h1 align="center">黄金点游戏</h1>
    <div align="center" style="margin:50px;border:2px solid;">
			<table class="table table-striped table-bordered table-hover datatable" id="record_list">
				<thead>
					<tr>
						<th>场次</th>
						<th>玩家</th>
						<th>数字</th>
						
					</tr>
				</thead>
			</table>
		</div>
<div style="margin:50px;"><input type="button" name="listBtn" value="返回游戏" onclick="window.location='gaming.jsp'"></div>
		
  </body>
</html>
<link rel="stylesheet" type="text/css" href="dataTables.bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.min.css"/>
<script type="text/javascript" src="jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="jquery.uniform.min.js"></script>
<script type="text/javascript" src="jquery.dataTables.min.js"></script>

<script src="record_list.js" type="text/javascript"></script>

