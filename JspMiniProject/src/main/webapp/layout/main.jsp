<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
table.maintb {
	width: 700px;	
}
table.maintb tr {
	height: 200px;
}
img.mainimg {
	width: 250px;
	height: 160px;
	border: 1px solid gray;
	border-radius: 10px;
	margin-left: 50px;
}
img.mainimg:hover {
	cursor: pointer;
	width: 300px;
	height: 200px;
	border: 5px solid
}
</style>
</head>
<body>
<!-- 테이블 안에 그림 넣기 -->
<table class="maintb">
<%
int n;

for(int row=1; row<=3; row++)
{
	n = 0;
%>
	<tr>
	<%
	for(int col=1; col<=4; col++)
	{
		n++;
	%>
		<td>
          <img alt="" src="image/<%= n %>.gif" class="mainimg">
       	</td>
    <%
	}
	%>
	</tr>
<%
}
%>
</table>
</body>
</html>