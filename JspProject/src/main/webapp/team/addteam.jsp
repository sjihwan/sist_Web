<%@page import="team.TeamDao"%>
<%@page import="team.TeamDto"%>
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
//입력값 읽기
String name=request.getParameter("name");
String driver=request.getParameter("driver");
String addr=request.getParameter("addr");

//DTO(Data Transfer Object)선언
TeamDto dto=new TeamDto();
dto.setName(name); //이름
dto.setDriver(driver==null?"없음":"있음"); //면허
dto.setAddr(addr); //주소

//DAO(Data Access Object)선언
TeamDao dao=new TeamDao();
//insert호출
dao.teamInsert(dto);

//목록파일로 이동
response.sendRedirect("teamlist.jsp"); //해당파일로 이동
%>
</body>
</html>