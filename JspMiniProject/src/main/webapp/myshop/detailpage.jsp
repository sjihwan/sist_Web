<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MyshopDao"%>
<%@page import="data.dto.MyshopDto"%>
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
img.photo {
	width: 400px;
	display: block;
	margin-right: 50px;
	padding: 0px;
}
</style>
</head>
<body>
<%
String shopnum = request.getParameter("shopnum");

String loginok = (String)session.getAttribute("loginok"); // 로그인 상태: yes,no
String myid = (String)session.getAttribute("myid"); // 로그인한 아이디

// 현재아이디에 해당하는 멤버테이블의 시퀀스번호(num)
MemberDao mdao = new MemberDao();
String num = mdao.getNum(myid);

MyshopDao dao = new MyshopDao();
MyshopDto dto = dao.getData(shopnum);
%>
<form id="frm">
<input type="hidden" name="shopnum" value="<%= shopnum %>">
<input type="hidden" name="num" value="<%= num %>">
<table style="font-size: 18pt;">
	<tr>
		<td rowspan="7">
			<div style="width: 100%">
				<img alt="" src="myshopsave/<%= dto.getPhoto() %>" class="photo large img-thumbnail">
			</div>
		</td>
	</tr>
	<tr>
		<td><b>카테고리 : </b><%= dto.getCategory() %></td>
	</tr>
	<tr>
		<td><b>상품명 : </b><%= dto.getSangpum() %></td>
	</tr>
	<tr>
		<td><b>입고일 : </b><%= dto.getIpgoday() %></td>
	</tr>
	<tr>
	<!-- Feedback: 할인가격 가져오기 -->
	<%
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	%>
		<td><b>가격 : </b><%= nf.format(dto.getPrice()) %></td>
	</tr>
	<tr>
		<td><b>갯수 : </b><input type="number" name="cnt" style="width: 60px;" value="1" min="1" max="10"></td>
	</tr>
	<tr>
		<td align="center">
		<button type="button" class="btn btn-success btn-sm"
		id="btncart">장바구니</button>
		<button type="button" class="btn btn-info btn-sm"
		onclick="location.href='index.jsp?main=myshop/myshoplist.jsp'">상품목록</button>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
$("#btncart").click(function(){
	var login = "<%=loginok%>";
	if(login == "null"){
		alert("먼저 로그인을 해주세요");
		return;
	}
	
	//form태그의 모든것 가져오기_serialize()
	var formdata = $("#frm").serialize();
	//alert(formdata); // shopnum,num,cnt가 넘어감
	
	//ajax처리한다(성공시 alert("성공"))
	$.ajax({
		type: "post",
		url: "myshop/detailprocess.jsp",
		data: formdata,
		dataType: "html",
		success: function(){
			//alert("성공");
			var a = confirm("장바구니에 저장하였습니다\n장바구니로 이동하려면 [확인]버튼을 눌러주세요");
			if(a){
				location.href = "index.jsp?main=myshop/mycart.jsp";
			}
		}
	});
});
</script>
</body>
</html>