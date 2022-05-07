<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
/* String id = request.getParameter("id");
String pass = request.getParameter("pass"); */
String name = request.getParameter("name");
String hp = request.getParameter("hp");
String addr = request.getParameter("addr");
String email = request.getParameter("email1")+"@"+request.getParameter("email2");

//DTO
MemberDto dto = new MemberDto();
dto.setNum(num);
/* dto.setId(id);
dto.setPass(pass); */
dto.setName(name);
dto.setHp(hp);
dto.setAddr(addr);
dto.setEmail(email);

//DAO
MemberDao dao = new MemberDao();
dao.updateMember(dto);

//응답
response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
%>
</body>
</html>