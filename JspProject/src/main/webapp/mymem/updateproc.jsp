<%@page import="mymem.MymemDao"%>
<%@page import="mymem.MymemDto"%>
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

String num = request.getParameter("num");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("m_name");
String hp = request.getParameter("hp1") + "-" + request.getParameter("hp2") + "-" + request.getParameter("hp3");
String email = request.getParameter("email");

MymemDto dto = new MymemDto();
dto.setNum(num);
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setHp(hp);
dto.setEmail(email);

MymemDao dao = new MymemDao();
dao.mymemUpdate(dto);

response.sendRedirect("mymemlist.jsp");
%>
</body>
</html>