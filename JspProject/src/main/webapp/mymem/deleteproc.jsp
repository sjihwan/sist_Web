<%@page import="mymem.MymemDao"%>
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
//변수num값 받기
String num = request.getParameter("num");

//DAO에서 삭제메서드 호출
MymemDao dao = new MymemDao();
dao.mymemDelete(num);

//리스트 주소로 다시 이동
response.sendRedirect("mymemlist.jsp");
%>
</body>
</html>