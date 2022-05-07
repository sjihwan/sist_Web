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
	<!-- 자바스크립트 -->
	<!-- var options = list.children
for(var i in options){
  if(options[i].selected){
    obj[i] = options[i].value
  }
} -->
	<%
request.setCharacterEncoding("UTF-8");

String work1=request.getParameter("city");
String[] work2=request.getParameterValues("city2");
%>
	<h1>[결과출력]</h1>
	<p>
		근무희망1:
		<%= "["+work1+"]" %></p>
	근무희망2:
	<% if(work2==null){%>
	<font color="red">지역선택 안함</font>
	<%}else{
	for(String a:work2){%>
	<%= "["+a+"]" %>
	<%} %>
	<br>
	<b>총 선택한 지역은 <%= work2.length %>개 입니다
	</b>
	<%}%>
	<br>
	<a href="selectForm_12.html">다시입력</a>
	<br>
	<a href="javascript:history.back()">다시입력</a>
</body>
</html>