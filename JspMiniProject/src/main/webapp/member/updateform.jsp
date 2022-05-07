<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
<script type="text/javascript">
$(function() {
	//이메일 선택 이벤트
	$("#selemail").change(function(){
		if($(this).val()=='_')
			$("input[name=email2]").val('');
		else
			$("input[name=email2]").val($(this).val());
	});
	//아이디입력 버튼 이벤트...idsearch.jsp(팝업창)
	$("#btnidcheck").click(function(){
		window.open("member/idsearch.jsp", "", "width=600px, height=200px, left=500px, top=100px")
	});
});

//두번 입력한 비밀번호 확인
function check(f)
{
	//비번같게 하기
	if(f.pass.value != f.pass2.value)
	{
		alert("비밀번호가 일치하지 않습니다.");
		/* f.pass.value=""; */
		f.pass2.value="";
		return false;
	}
}
</script>
</head>
<%
String num = request.getParameter("num");

//DAO
MemberDao dao = new MemberDao();
MemberDto dto = dao.getMember(num); //DTO반환

//이메일 @기준으로 분리
String email = dto.getEmail();
String[] token = email.split("@");
%>
<body>
<form action="member/updateaction.jsp" method="post" class="form-inline"
onsubmit="return check(this)" name="mfrm">
	<table class="table table-bordered" style="width: 500px; margin: 0 auto;">
		<caption><b>회원정보수정</b></caption>
		<tr>
			<th width="100" bgcolor="#aaa">아이디</th>
			<td>
				<input type="text" name="id" class="form-control"
				required="required" readonly="readonly"
				style="width: 120px;" value="<%= dto.getId() %>">
			</td>
		</tr>
		<tr>
			<!-- Feedback: 현재 비밀번호 확인&수정할 비밀번호 입력 -->
			<th width="100" bgcolor="#aaa">비밀번호</th>
			<td>
				<input type="password" name="pass" class="form-conrol" required="required"
				style="width: 120px;" readonly="readonly" value="<%= dto.getPass() %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">이름</th>
			<td>
				<input type="text" name="name" class="form-conrol" required="required"
				style="width: 120px;" value="<%= dto.getName() %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">핸드폰</th>
			<td>
				<input type="text" name="hp" class="form-conrol" required="required"
				style="width: 200px;" value="<%= dto.getHp() %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">주소</th>
			<td>
				<input type="text" name="addr" class="form-conrol" required="required"
				style="width: 400px;" value="<%= dto.getAddr() %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">이메일</th>
			<td>
				<input type="text" name="email1" class="form-conrol" required="required"
				style="width: 100px;" value="<%= token[0] %>">
				<b>@</b>
				<input type="text" name="email2" class="form-conrol" required="required"
				style="width: 130px;" value="<%= token[1] %>">
				<select id="selemail">
					<option value="_">직접입력</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="hanmail.net">다음</option>
					<option value="nate.com">네이트</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2" bgcolor="#aaa">
				<input type="hidden" name="num" value="<%= num %>">
				<button type="submit" class="btn btn-default">수정완료</button>
				<button type="button" onclick="location.href='index.jsp?main=member/memberlist.jsp'" class="btn btn-default">취소</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>