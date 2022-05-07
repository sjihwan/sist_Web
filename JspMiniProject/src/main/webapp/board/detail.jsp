<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
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

SmartDao dao = new SmartDao();
dao.updateReadCount(num);

SmartDto dto = dao.getData(num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<table class="table table-condensed" style="width: 650px;">
	<caption><b>내용보기</b></caption>
	<tr>
		<td style="width: 500px;">
			<b><%=dto.getSubject()%></b>
		</td>
		<td>
			<span style="color: gray; font-size: 11pt;">
				<%=sdf.format(dto.getWriteday())%>
				&nbsp;&nbsp; 조회<%=dto.getReadcount()%>
			</span>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<span style="color: gray; font-size: 9pt;">
				<%=dto.getWriter()%>
			</span>
			<br><br>
			<%=dto.getContent().replace("\n","<br>")%>
			<br><br>
		</td>
	</tr>
</table>

<div style="margin-left: 400px;">
	<button type="button" class="btn btn-default"
	onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
	<button type="button" class="btn btn-default"
	onclick="location.href='index.jsp?main=board/boardlist.jsp'">목록</button>
	<button type="button" class="btn btn-default"
	onclick="location.href=''">수정</button>
	<button type="button" class="btn btn-default"
	onclick="location.href=''">삭제</button>
</div>
</body>
</html>