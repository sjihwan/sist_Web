<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- include: 이동했다 돌아옴...방문횟수 같은것 만들때 사용 -->
	<!-- include: 페이지 출력결과를 현재페이지에 포함한다 -->
	<!-- forward: 이동했다 돌아오지 않음(다른 파일로 이동) -->
	<!-- redirect: forward는 url주소가 안 바뀌고, redirect는 주소가 바뀐다 -->
	<!-- forward는 request,response가 그대로 전달되고 redirect는 전달안됨 -->
	<h2>다른 폴더의 파일 include하기</h2>
	<h4>3번 전체 구구단</h4>
	<jsp:include page="gugu_03.jsp"></jsp:include>
	<hr>
	<h4>5번 중첩배열 이미지</h4>
	<jsp:include page="imgArrayQuiz_05.jsp"></jsp:include>
</body>
</html>