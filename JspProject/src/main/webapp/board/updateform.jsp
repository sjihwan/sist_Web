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
<%
String num = request.getParameter("num");
BoardDao dao = new BoardDao();
BoardDto dto = dao.getData(num);
%>
<style type="text/css">
#blah {
	position: absolute;
	left: 600px;
	top: 100px;
}
</style>
<script>

function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$("#blah")
.attr('src', e.target.result);
};
reader.readAsDataURL(input.files[0]);
}
}

</script>
</head>
<body>
<form action="updateaction.jsp" method="post"
enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 500px;">
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">작성자</th>
			<td>
				<b><%= dto.getWriter() %></b>
			</td>
		</tr>
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">제목</th>
			<td>
				<input type="text" name="subject" class="form-control"
				value="<%= dto.getSubject() %>">
			</td>
		</tr>
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">사진업로드</th>
			<td>
				<input type="file" name="photo" class="form-control"
				style="width: 300px;" required="required"
				onchange="readURL(this)">
			</td>
		</tr>
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">비밀번호</th>
			<td>
				<input type="password" name="pass" class="form-control"
				placeholder="password" required="required" style="width: 200px;"
				pattern="[0-9]{4}"><!-- 조건? 0~9, 4자리 입력 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea style="width: 500px; height: 200px;"
				class="form-control" name="content" required="required"><%= dto.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- hidden -->
				<input type="hidden" name="num" value="<%= num %>">
				<button type="submit" class="btn btn-info btn-md">수정하기</button>
				<button type="button" class="btn btn-danger btn-md"
				onclick="history.back()">이전으로</button>
			</td>
		</tr>
	</table>
</form>

<img id="blah" src="../img/noimg.png" style="max-width: 200px;">
</body>
</html>