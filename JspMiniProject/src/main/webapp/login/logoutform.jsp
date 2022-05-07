<%@page import="data.dao.MemberDao"%>
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
//세션값 받기
String loginok = (String)session.getAttribute("loginok");

if(loginok==null)
{%>
	<button class="btn btn-info" style="width: 120px; margin-left: 100px;"
	onclick="location.href='loginform.jsp'">로그인</button>
<%	
} else {
	MemberDao dao = new MemberDao();
	
	//세션에 저장된 아이디 얻기
	String id = (String)session.getAttribute("myid");
	//아이디에 해당하는 name얻기
	String name = dao.getName(id);
	%>
	<img alt="" src="image2/redhair15.PNG">
	<br><br>
	<b><%= name %> </b>님이 로그인하셨습니다
	<button class="btn btn-success" style="width: 120px; margin-left: 30px;"
	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
<%
}
%>
</body>
</html>