<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dto.GuestDto"%>
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
// 파일이 저장될 실제(물리)경로_파일업로드할때 필요
// getServletContext() : 웹 어플리케이션이 설치되어 있는 경로를 리턴해줌
// getRealPath() : ServletContext의 getRealPath는 웹어플리케이션이 실행된 곳. 즉 설치된 곳의 경로를 찾음
String realPath = getServletContext().getRealPath("/save");

int uploadSize = 1024*1024*2; //2MB제한

//post방식은 인코딩을 세팅해줘야 한글이 깨지지 않는다
//request아니고 multi로 모든 폼데이터 읽어온다!!
try {
	MultipartRequest multi = null;
	// MultipartRequest(request객체, 저장될 서버경로, 파일최대크기, 인코딩방식, 같은이름의 파일명 방지처리)
	multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());

	//데이터 넘겨받기_변수에 담기
	/* 
	Feedback: photo와 content 넘겨받기 
	request.getParameter가 아닌
	MultipartRequest로 데이터객체를 받았기 때문에
	multi.getParamter를 써야한다.
	*/
	String content = multi.getParameter("content");
	// 파일이름
	String photoname = multi.getFilesystemName("photo");

	//세션에 저장된 아이디
	String id = (String)session.getAttribute("myid");

	//insert하기전에 파라미터로 넘길 DTO세팅
	GuestDto dto = new GuestDto();
	dto.setMyid(id);
	dto.setPhotoname(photoname);
	dto.setContent(content);

	//insert문 실행할려면 DAO접근
	GuestDao dao = new GuestDao();
	dao.insertGuest(dto);

	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
} catch(Exception e) {
	e.getMessage();
}
%>
</body>
</html>