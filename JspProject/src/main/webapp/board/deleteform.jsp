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
<form action="deleteaction.jsp" method="post">
	<table class="table table-bordered" style="width: 300px;">
		<caption><b>삭제할 비번 입력</b></caption>
		<tr>
			<th>비밀번호를 입력해주세여<br><br>
				<input type="password" class="form-control"
				name="pass" required="required" placeholder="비번 4자리"
				style="width: 200px;">
				<!-- hidden -->
				<input type="hidden" name="num"	value="<%= num %>">
				<br><br>
				<button type="submit" class="btn btn-danger">삭제</button>
				<button type="button" class="btn btn-success"
				onclick="history.back()">이전</button>
			</th>
		</tr>	
	</table>
</form>
</body>
</html>