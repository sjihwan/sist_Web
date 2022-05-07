<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	String[] str={"redhair1.PNG","redhair2.PNG","redhair3.PNG","redhair4.PNG","redhair5.PNG","redhair6.PNG","redhair7.PNG","redhair8.PNG","redhair9.PNG"};
	int n=0; //증가변수
	%>
	<table class="table table-bordered" style="width: 500px;">
	<%
	for(int i=0; i<3; i++)
	{%>
		<tr height="80px;">
		<%
		for(int j=0; j<3; j++)
		{%>
			<td><img alt="" src="../image/<%= str[n] %>" width="150px;"
				height="150px;"></td>
		<%
			n++;
		}
		%>
		</tr>
		<%}
		%>
	</table>
</body>
</html>