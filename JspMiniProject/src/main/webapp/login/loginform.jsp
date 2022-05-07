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
//세션에 저장된 아이디
String id = (String)session.getAttribute("myid");

//세션에 저장된 아이디저장 체크유무
String saveok = (String)session.getAttribute("saveok");

//아이디 저장(checkbox)에 체크안하면 false, 하면 true
boolean b;
if(saveok==null || saveok.equals("no"))
	b=false;
else
	b=true;
%>
<!-- logform 어디있지..? -->
<div>
	<h2>회원로그인</h2>
	<form action="login/loginaction.jsp" method="post">
		<input type="text" name="myid" style="width: 200px;"
		class="form-control" placeholder="로그인할 아이디"
		value="<%= b? id:"" %>" required="required">
		<br>
		<input type="password" name="pass" style="width: 200px;"
		class="form-control" placeholder="로그인할 비밀번호" required="required">
		<br>
		<button type="submit" class="btn btn-success"
		style="width: 200px; height: 50px;">로그인</button>
		<br>
		<input type="checkbox" name="saveok"
		<%= b? "checked":"" %>>아이디저장
	</form>
</div>
</body>
</html>