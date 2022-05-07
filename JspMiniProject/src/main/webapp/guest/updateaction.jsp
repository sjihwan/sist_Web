<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
//실제경로
String realPath = getServletContext().getRealPath("/save");

int uploadSize = 1024*1024*2; //2MB

// post방식은 인코딩을 세팅해줘야 한글이 깨지지 않는다
// request아니고 multipartRequest를 통해 모든 폼데이터 읽어온다!!
try {
	MultipartRequest multi = null;
	multi = new MultipartRequest(request,realPath,uploadSize,"utf-8", 
			new DefaultFileRenamePolicy());

	//MultipartRequest: 데이터 넘겨받기..변수에 담기
	String num = multi.getParameter("num");
	String content = multi.getParameter("content");
	String photoname = multi.getFilesystemName("photo");
	//기존의 포토명 읽어오기
	GuestDao dao = new GuestDao();
	String old_photoname = dao.getData(num).getPhotoname();
	
	//페이지 읽기
	String currentPage = multi.getParameter("currentPage");

	//update하기전에 파라미터로 넘길 dto세팅
	GuestDto dto = new GuestDto();
	dto.setNum(num);
	//사진선택 안했을 경우 기존사진으로 저장
	dto.setPhotoname(photoname==null? old_photoname:photoname);
	dto.setContent(content);
	
	//update문 실행
	dao.updateGuest(dto);

	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
} catch(Exception e) {
	e.getMessage();
}
%>
</body>
</html>