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
<!-- 파일 업로드(입출력)은 무조건 post방식으로 보내야한다. -->
<form action="uploadproc.jsp" method="post" enctype="multipart/form-data">
	<table class="table table-hover" style="width: 500px;">
		<tr>
			<th width="100">이름</th>
				<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th width="100">제목</th>
				<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<th width="100">파일</th>
				<td><input type="file" name="uploadfile"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">업로드</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>