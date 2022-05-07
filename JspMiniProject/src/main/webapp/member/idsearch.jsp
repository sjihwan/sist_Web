<%@page import="data.dao.MemberDao"%>
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

//null값이 넘어와도 페이지가 나오게끔 임의로 준 것!
String key = request.getParameter("key");

if(key==null){%>
	<form action="idsearch.jsp" method="post" class="form-inline">
		<input type="hidden" name="key" value="result">
		<table class="table table-bordered">
			<tr height="100">
				<td>
					<img alt="" src="../image2/3.png" width="70" align="left">
					<br>
					<b>아이디를 입력해주세요</b>
					<input type="text" name="id" class="form-control" style="width: 100px;"
					required="required">
					<br>
					<button type="submit" class="btn btn-info btn-sm">중복체크</button>
				</td>
			</tr>
		</table>
	</form>
<%
} else {
	//id가 DB에 있는지 체크
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	boolean b = dao.isIdCheck(id);
	
	if(b) {%>
		<script type="text/javascript">
			alert("이미 등록된 아이디입니다.");
			location.href = 'idsearch.jsp';
		</script>
	<%
	} else {%>
		<h3 class="alert alert-success"><%= id %>는 사용가능한 아이디입니다.</h3>
		<button type="button" class="btn btn-warning btn-sm" id="btnuse"
		style="margin-left: 200px;" myid="<%= id %>" onclick="goBack('<%= id %>')">사용하기</button>
		<button type="button" class="btn btn-danger btn-sm"
		onclick="location.href='idsearch.jsp'">다시하기</button>
	<%
	}
}
%>
<script type="text/javascript">
//방법1
/* $("#btnuse").click(function(){
	var myid = $(this).attr("myid");
	alert(myid);
	//부모창에 아이디 보내고 현재창 닫기
	opener.mfrm.id.value = myid;
	window.close();
}); */

//방법2
function goBack(id)
{
	opener.mfrm.id.value = id;
	window.close();
}
</script>
</body>
</html>