<%@page import="java.io.File"%>
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
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
String pass = request.getParameter("pass");

BoardDao db = new BoardDao();

boolean b = db.isEqualPass(num, pass);

//b가 참이면 삭제후 이동
if(b)
{
	//게시글 지우기 전에 업로드 이미지 지우기
	String imgName = db.getData(num).getImgname();
	String uploadPath = getServletContext().getRealPath("/photo");
	//파일 생성
	File file = new File(uploadPath+"\\"+imgName);
	//파일 삭제
	if(file.exists())
		file.delete();
	
	db.deleteBoard(num);
	response.sendRedirect("boardlist.jsp");
} else {%>
	
	<script type="text/javascript">
	alert("비밀번호가 맞지 않아요!!")
	history.back();
	</script>
	
<%
}
%>
</body>
</html>