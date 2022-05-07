<%@page import="java.util.Date"%>
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
</head>
<body>
<%
//세션을 지정,저장하는 방법
session.setAttribute("msg", "Happy day");
//세션의 유효시간설정
session.setMaxInactiveInterval(60); //60초 설정
%>
<h3>세션값 얻기</h3>
세션값:<%= session.getAttribute("msg") %><br>
세션유지시간:<%= session.getMaxInactiveInterval() %>초<br> <!-- millisecond가 아님 -->
세션생성시간:<%= session.getCreationTime() %><br>
세션생성시간:<%= new Date(session.getCreationTime()) %>
</body>
</html>