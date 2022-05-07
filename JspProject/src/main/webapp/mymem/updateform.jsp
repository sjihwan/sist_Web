<%@page import="java.util.StringTokenizer"%>
<%@page import="mymem.MymemDto"%>
<%@page import="mymem.MymemDao"%>
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
<style type="text/css">
body table {
	margin-top: 20px;
	margin-left: 20px;
}
</style>
</head>
<body>
<%
String num = request.getParameter("num");

//파라미터로 넘어온 num에 해당하는 데이터 DTO객체에 담기
MymemDao dao = new MymemDao();
MymemDto dto = dao.getData(num);
%>
<form action="updateproc.jsp" method="post">
	<table class="table table-bordered" style="width: 400px;">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id"
				value="<%= dto.getId() %>" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="pass"
				value="<%= dto.getPass() %>" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="m_name"
				value="<%= dto.getName() %>" required="required" class="form-control">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<%
				StringTokenizer sthp = new StringTokenizer(dto.getHp(), "-");
				String hp1 = sthp.nextToken();
				String hp2 = sthp.nextToken();
				String hp3 = sthp.nextToken();
				%>
				<input type="text" name="hp1" readonly="readonly"
				value="<%= hp1 %>" required="required" maxlength="3" size="3" >
				<b>-</b>
				<input type="text" name="hp2" onkeyup="goFocus(this)"
				value="<%= hp2 %>" required="required" maxlength="4" size="4">
				<b>-</b>
				<input type="text" name="hp3" value="<%= hp3 %>"
				required="required" maxlength="4" size="4">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<%
				StringTokenizer stmail = new StringTokenizer(dto.getEmail(), "@");
				String email = stmail.nextToken();
				String dotcom = stmail.nextToken();
				String [] strmail = {"naver.com", "hanmail.net", "gmail.com"};
				%>
				<input type="text" name="email" required="required"
				value="<%= email %>">
				<b>@</b>
				<select name="dotcom">
					<%
					for (int i = 0; i < strmail.length; i++) {
						if (dotcom.equals(strmail[i])) {%>
							<option value="<%= strmail[i] %>" selected="selected"><%= strmail[i] %></option>
						<%
						} else {%>
							<option value="<%= strmail[i] %>" selected="selected"><%= strmail[i] %></option>
						<%
						}
					}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<!-- hidden으로 num을 넘겨준다 -->
				<input type="hidden" name="num" value="<%= num %>">
				<input type="submit" value="수정" class="btn btn-info">
				<input type="button" value="취소" class="btn btn-danger"
				onclick="location.href='mymemlist.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>