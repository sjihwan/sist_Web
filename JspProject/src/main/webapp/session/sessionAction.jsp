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

String msg=(String)session.getAttribute("msg");
String trip=request.getParameter("trip");

if(msg==null || !msg.equals("HappyTime"))
{%>
	<h3 style="color: red">시간초과로 꽝입니다!!</h3>
<%
}else
{%>
	<h3 style="color: blue">축하합니다 <%= trip %>상품에 신청되었습니다</h3>
<%
}
%>
<a href="sessionMain.jsp">다시 선택</a>
</body>
</html>