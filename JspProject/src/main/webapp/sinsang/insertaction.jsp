<%@page import="sinsang.SinsangDao"%>
<%@page import="sinsang.SinsangDto"%>
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
request.setCharacterEncoding("utf-8");

String name=request.getParameter("name");
String blood=request.getParameter("blood");
String hp=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
String birth=request.getParameter("birth");

SinsangDto dto=new SinsangDto();
dto.setName(name);
dto.setBlood(blood);
dto.setHp(hp);
dto.setBirth(birth);

SinsangDao dao=new SinsangDao();
dao.insertSinsang(dto);

response.sendRedirect("sslist.jsp");
%>
</body>
</html>