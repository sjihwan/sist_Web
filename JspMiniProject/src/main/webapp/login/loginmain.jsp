<%@page import="java.awt.Button"%>
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
String loginok = (String)session.getAttribute("loginok");
if(loginok==null || loginok.equals(""))
{%>
	<jsp:include page="loginform.jsp"/>
<%
} else
{%>
	<jsp:include page="logoutform.jsp"/>
<%
}
%>
</body>
</html>