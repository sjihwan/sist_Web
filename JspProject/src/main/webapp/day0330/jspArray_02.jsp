<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
//배열선언
String [] colors={"green","blue","red","gray","orange"};

//제목선언
String title="배열출력";
%>
	<table class="table table-bordered" style="width: 200px;">
		<caption>
			<b><%= title %></b>
		</caption>
		<tr bgcolor="pink">
			<th>번호</th>
			<th>색상</th>
		</tr>

		<%
  for(int i=0; i<colors.length; i++){%>
		<tr>
			<td><%= i+1 %></td>
			<td><b style="color: <%= colors[i] %>"><%= colors[i] %></b></td>
		</tr>
		<%}
  %>
	</table>
	<hr>
	<%
List<String> list=new ArrayList();
list.add("yellow");
list.add("pink");
list.add("gray");
list.add("blue");
list.add("orange");

for(String a:list){%>
	<div style="width: 50px; height: 50px; border-color: <%= a %>"><%= a %></div>
	<%}
%>
</body>
</html>