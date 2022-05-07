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
session.setAttribute("msg", "HappyTime");
session.setMaxInactiveInterval(10); //유지시간
%>
<h2>10초 안에 눌러주세요!</h2>
<form action="sessionAction.jsp" method="post">
    <h2>가고싶은 여행지는?</h2>
    <input type="radio" value="태국 3박4일" name="trip">태국 3박4일&nbsp;
    <input type="radio" value="동유럽 10박" name="trip">동유럽 10박&nbsp;
    <input type="radio" value="캐나다 로키 8박" name="trip">캐나다 로키 8박&nbsp;
    <input type="radio" value="그리스 산토리니 11박" name="trip">그리스 산토리니 11박&nbsp;
    <input type="submit" value="상품신청">
</form>
</body>
</html>