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
function goFocus(hp) {
	if(hp.value.length==4)
		frm.hp3.focus(); //마우스 커서(focus) 이동
}
</script>
</head>
<body>
<form action="insertaction.jsp" method="post" name="frm">
	<table class="table table-bordered" style="width: 350px;">
		<caption><b>개인신상명세</b></caption>
		<tr>
			<th width="100">이름</th>
			<td>
				<input type="text" name="name" size="8"
				placeholder="이름" required="required"><!-- placeholder: 가이드, required: 필수입력 -->
			</td>
		</tr>
		<tr>
			<th>혈액형</th>
			<td>
				<select size="1" name="blood">
					<option value="A">A형</option>
					<option value="B">B형</option>
					<option value="O">O형</option>
					<option value="AB">AB형</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td>
				<select name="hp1">
					<option value="010">010</option>
					<option value="018">018</option>
					<option value="019">019</option>
					<option value="02">02</option>
				</select>
				<b>-</b>
				<input type="text" name="hp2" size="3"
				onkeyup="goFocus(this)" required="required">
				<b>-</b>
				<input type="text" name="hp3" size="3" required="required">
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="date" name="birth" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="DB저장">
				<input type="button" value="목록"
				onclick="location.href='sslist.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>