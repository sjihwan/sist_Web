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
<!-- param: 파라미터 --><!-- include페이지에 파라미터로 보내겠다 -->
<h3>twoInclude.jsp include하기</h3>
<jsp:include page="twoInclude_07.jsp">
	<jsp:param value="HappyDay!!!" name="msg" />
	<jsp:param value="../image/redhair15.PNG" name="imgname" />
</jsp:include>
</body>
</html>