<%@page import="newmem.NewmemDao"%>
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
//mid,pass,saveid 읽기
String mid = request.getParameter("mid");
String pass = request.getParameter("pass");
String saveid = request.getParameter("saveid"); //체크안하면 null

//DAO getLogin호출
NewmemDao dao = new NewmemDao();
int idx = dao.getLogin(mid, pass);

if(idx==1)
{
	//session저장
	session.setAttribute("mid", mid);
	session.setAttribute("saveid", saveid==null? "no": "yes");
	session.setAttribute("loginok", "yes");
	
	session.setMaxInactiveInterval(60*60*8); //8시간 유지
	
	response.sendRedirect("loginmain.jsp"); //로그인메인..로그아웃폼으로 이동
} else if(idx==2) {%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다");
	history.back();
	</script>
<%
} else if(idx==3) {%>
	<script type="text/javascript">
	alert("가입되지 않은 아이디입니다");
	history.back();
	</script>
<%
}
%>
</body>
</html>