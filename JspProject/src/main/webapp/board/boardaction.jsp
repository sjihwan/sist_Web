<%@page import="board.BoardDao"%>
<%@page import="board.BoardDto"%>
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
request.setCharacterEncoding("utf-8");

//톰캣 업로드 경로
String realFolder = getServletContext().getRealPath("/photo");
System.out.println(realFolder);

//사이즈
int uploadSize = 1024*1024; //1MB

MultipartRequest multi = null;

try {
	multi = new MultipartRequest(request, realFolder, uploadSize, "utf-8",
			new DefaultFileRenamePolicy());
	
	//입력값 읽기
	String writer = multi.getParameter("writer");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String pass = multi.getParameter("pass");
	
	//실제 업로드 이미지이름 읽어오기
	String imgname = multi.getFilesystemName("photo");
	
	//dto에 담기
	BoardDto dto = new BoardDto();
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPass(pass);
	dto.setImgname(imgname);
	
	//db선언
	BoardDao dao = new BoardDao();
	
	//insert호출
	dao.insertBoard(dto);
	
	//목록으로 이동
	response.sendRedirect("boardlist.jsp");
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>