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
/* post방식은 인코딩해줘야 한다 */
request.setCharacterEncoding("utf-8");

//요청값 받기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String m_name = request.getParameter("m_name");
String hp = request.getParameter("hp1") + "-" + request.getParameter("hp2") + "-" + request.getParameter("hp3");
String email = request.getParameter("email") + "@" + request.getParameter("dotcom");

//DTO에 파라미터값 전달
MymemDto dto = new MymemDto();
dto.setId(id);
dto.setPass(pass);
dto.setName(m_name);
dto.setHp(hp);
dto.setEmail(email);

//DAO에 전달된 데이터(dto)를 보낸후 메서드 호출
MymemDao dao = new MymemDao();
dao.mymemInsert(dto);

response.sendRedirect("mymemlist.jsp");
%>
</body>
</html>