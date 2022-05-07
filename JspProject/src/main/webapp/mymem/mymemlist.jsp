<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mymem.MymemDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mymem.MymemDao"%>
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
a button {
	margin: 20px;
}
body table {
	margin-left: 15px;
}
</style>
</head>
<body>
<%
MymemDao dao = new MymemDao();
ArrayList<MymemDto> list = dao.getAllDatas();
%>
<a href="form.html">
	<button type="button" class="btn btn-info">
		<b>데이터 추가</b>
	</button>
</a>
<hr style="border-color: gray; border-style: dashed;">
<table class="table table-bordered" style="width: 900px;">
	<caption><b>My member목록</b></caption>
	<tr>
		<th>No.</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>연락처</th>
		<th>이메일</th>
		<th>가입일자</th>
		<th>수정/삭제</th>
	</tr>
	
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	for (int i = 0; i < list.size(); i++) {
		MymemDto dto = list.get(i);
		%>
		<tr>
			<td><%= i+1 %></td>
			<td><%= dto.getId() %></td>
			<td><%= dto.getPass() %></td>
			<td><%= dto.getName() %></td>
			<td><%= dto.getHp() %></td>
			<td><%= dto.getEmail() %></td>
			<td><%= sdf.format(dto.getGaip()) %></td>
			<td align="center">
				<!-- location.href="/경로?보낼변수명=" + 값; -->
				<button type="button" class="btn btn-info btn-xs"
				onclick="location.href='updateform.jsp?num=<%= dto.getNum() %>'">수정</button>
				<button type="button" class="btn btn-danger btn-xs"
				onclick="location.href='deleteproc.jsp?num=<%= dto.getNum() %>'">삭제</button>
			</td>
		</tr>
	<%
	}
	%>
</table>
</body>
</html>