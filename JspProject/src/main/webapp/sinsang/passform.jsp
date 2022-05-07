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
<%
String num=request.getParameter("num");
%>
<body>
<form action="passaction.jsp" method="post">
	<table class="table table-bordered" style="width: 250px;">
		<tr>
			<td>
				<b>삭제시 필요한 <br>
				비밀번호를 입력하세요</b>
				<br><br>
				<input type="password" name="pass" size="5"
				required="required">
				<!-- hidden으로 num 넘기기 -->
				<input type="hidden" name="num" value="<%= num %>">
				<input type="submit" value="확인">
				<input type="button" value="목록"	
				onclick="location.href='sslist.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>