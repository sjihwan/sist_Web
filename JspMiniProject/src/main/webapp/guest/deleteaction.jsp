<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
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
// 업로드된 파일(이미지)도 삭제
String num = request.getParameter("num");
String currentPage = request.getParameter("currentPage");

GuestDao dao = new GuestDao();
// DB에서 num에 해당하는 데이터 삭제
dao.deleteGuest(num);

// DB로부터 저장된 이미지명 얻기
String photoname = dao.getData(num).getPhotoname();
// 프로젝트 실제경로
String realPath = getServletContext().getRealPath("/save");
// 파일 객체 생성
File file = new File(realPath+"\\"+photoname);
// 파일 삭제
file.delete();

response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
%>
</body>
</html>