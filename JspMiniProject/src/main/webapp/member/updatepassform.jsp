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
String num = request.getParameter("num");
%>
<div>
	<form action="member/updatepassaction.jsp" method="post">
		<input type="hidden" name="num" value="<%= num %>">
		<b>비밀번호를 입력해주세요</b>
		<br><br>
		<input type="password" name="pass" class="form-control" style="width: 120px;"
		required="required">
		<br>
		<button type="submit" class="btn btn-success">확인</button>
	</form>
</div>
</body>
</html>