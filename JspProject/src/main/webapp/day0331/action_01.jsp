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
div.box{
    width: 50px;
    height: 50px;
    border-radius: 100px;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String grade=request.getParameter("grade");
String[] lang=request.getParameterValues("lang");
String file=request.getParameter("file");
String semi=request.getParameter("semi");
String height=request.getParameter("height");
String weight=request.getParameter("weight");
String col=request.getParameter("col");
String naljja=request.getParameter("naljja");
%>
<p><b>최종학력: </b><%= grade %></p>
<p><b>가능한 프로그램 언어: </b>
<% 
if(lang==null){%>
	<font color="blue">아무것도 못합니다<br></font>
<%
}else{
	for(int i=0; i<lang.length; i++){%>
		<%= "["+lang[i]+"]" %>
	<%
	}
}
%>
</p>
<p><b>이미지 or 파일명: </b><%= file %></p>
<p><b>세미프로젝트를 가장 잘할것 같은 조: </b><%= semi %></p>
<p><b>키: </b><%= height+"cm" %></p>
<p><b>몸무게: </b><%= weight+"kg" %></p>
<p><b>색상: </b><div style="background-color: <%= col %>" class="box"></div></p>
<p><b>날짜: </b><%= naljja %></p>
</body>
</html>