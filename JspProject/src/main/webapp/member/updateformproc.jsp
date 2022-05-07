<%@page import="member.MemberDao"%>
<%@page import="member.MemberDto"%>
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

String num=request.getParameter("num");
String name=request.getParameter("name");
String hp=request.getParameter("hp");

//DTO에 데이터 넘겨줄 것:세팅
MemberDto dto=new MemberDto();
dto.setNum(num);
dto.setName(name);
dto.setHp(hp);

//DAO에 DTO데이터를 넘겨주어 update호출
MemberDao dao=new MemberDao();
dao.memberUpdate(dto);

//목록으로 다시 이동
response.sendRedirect("memberlist.jsp");
%>
</body>
</html>