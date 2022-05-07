<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
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
BoardDao dao = new BoardDao();

//조회수 증가
dao.updateReadCount(num);

//데이터 가져오기
BoardDto dto = dao.getData(num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<table class="table table-condesed" style="width: 650px;">
	<caption><b>내용보기</b></caption>
	<tr>
		<td style="width: 500px;">
			<b><%= dto.getSubject() %></b>
		</td>
		<td>
			<span style="color: gray; font-size: 9pt;">
			<%= sdf.format(dto.getWriteday()) %></span>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<span style="color: gray; font-size: 9pt;">
			<%= dto.getWriter() %></span>
			<br><br>
			<%= dto.getContent().replace("\n", "<br>") %>
			<br><br>
			<!-- 이미지 클릭하면 새창에 원래사이즈로 보기 -->
			<a href="../photo/<%= dto.getImgname() %>"
			target="_blank"><img src="../photo/<%= dto.getImgname() %>"
			style="max-width: 200px;"></a>
			<br><br>
			<b style="color: gray; font-size: 9pt;">조회 <%= dto.getReadcount() %></b>
		</td>
	</tr>
</table>

<div style="margin-left: 400px;">
	<button type="button" class="btn btn-default"
	onclick="location.href='boardform.jsp'">글쓰기</button>
	<button type="button" class="btn btn-default"
	onclick="location.href='boardlist.jsp'">목록</button>
	<button type="button" class="btn btn-default"
	onclick="location.href='updateform.jsp?num=<%= dto.getNum() %>'">수정</button>
	<button type="button" class="btn btn-default"
	onclick="location.href='deleteform.jsp?num=<%= dto.getNum() %>'">삭제</button>
</div>
</body>
</html>