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
<style type="text/css">
div.layout {
border: 0px solid gray;
position: absolute;
}
div.title {
	width: 100%;
	height: 100px;
}
div.menu {
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 20pt;
	font-family: '나눔고딕';
	text-align: center;
	top: 110px;
}
div.info {
	width: 170px;
	height: 200px;
	font-size: 15pt;
	font-family: '나눔고딕';
	line-height: 10px;
	top: 300px;
	padding: 20px 10px;
	border: 5px groove gold;
	border-radius: 30px;
}
div.main {
	width: 1200px;
	height: 700px;
	font-size: 11pt;
	font-family: '나눔고딕';
	left: 300px;
	top: 250px;
}
a, a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<%
//프로젝트 경로 구하기
String root = request.getContextPath();

String mainPage = "layout/main.jsp"; //기본(메인)페이지

//url을 통해서 main값을 읽어 메인페이지에 출력
if(request.getParameter("main")!=null)
{
	mainPage = request.getParameter("main");
}
%>
<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>
<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout info">
	<jsp:include page="layout/info.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%= mainPage %>"/>
</div>
</body>
</html>