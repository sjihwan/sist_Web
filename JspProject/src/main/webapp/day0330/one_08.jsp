<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h3>two파일 전달_한글전달</h3>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="twoInclude_08.jsp">
	<jsp:param value="신지환" name="name" />
	<jsp:param value="서울시 강남구 쌍용교육센터" name="addr" />
</jsp:include>
</body>
</html>