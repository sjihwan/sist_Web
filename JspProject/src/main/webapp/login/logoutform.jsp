<%@page import="log.LogDao"%>
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
//세션으로부터 id읽어온다
String id = (String)session.getAttribute("idok");

//id에 해당하는 이름 얻기
LogDao dao = new LogDao();
String name = dao.getName(id);
%>

<br><br>
<b style="color: blue"><%= name %></b>님이 로그인 하셨습니다
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="로그아웃" onclick="location.href='logoutproc.jsp'">
<br><br>
<hr>
<img alt="" src="../img/sticker.png">
</body>
</html>