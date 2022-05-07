<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MyshopDao"%>
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
	width: 70px;
	border: 1px solid gray;
}
div.sangpum {
	cursor: pointer;
}
span.del {
	cursor: pointer;
}
table tr th {
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	// 전체선택/해제
	$("#allcheck").click(function(){
		if($(this).is(":checked"))
			$("input:checkbox[name='idx']").attr("checked",true);
		else
			$("input:checkbox[name='idx']").attr("checked",false);
	});
	// 상품이미지 클릭시 디테일페이지로
	$("div.sangpum").click(function(){
		var shopnum = $(this).attr("shopnum");
		location.href = "index.jsp?main=myshop/detailpage.jsp?shopnum="+shopnum;
	});
	
	// 한개의 상품 삭제
	$("span.del").click(function(){
		var idx = $(this).attr("idx");
		var a = confirm("삭제하려면 [확인]버튼을 클릭하세요");
		if(a){
			alert(idx);
			 $.ajax({
				type: "get",
				url: "myshop/cartdelete.jsp",
				dataType: "html",
				data: {"idx": idx},
				success: function(){
					alert("삭제성공");
					location.reload();
				}
			}); 
		}
			
	});
	
	//체크한 후 삭제버튼으로 삭제 이벤트
	$("#btncartdel").click(function(){
		// 체크한 상품갯수
		var cnt = $(".idx:checked").length;
		//alert(cnt);
		if(cnt == 0){
			alert("먼저 선택할 상품을 선택하세요");
			return;
		}
		$(".idx:checked").each(function(i,element){
			var idx = $(this).attr("idx");
			
			$.ajax({
				type: "get",
				url: "myshop/cartdelete.jsp",
				dataType: "html",
				data: {"idx": idx},
				success: function(){
					//alert("삭제성공");
					location.reload();
				}
			});
		});
	});
});
</script>
</head>
<%
// 로그인한 아이디
String id = (String)session.getAttribute("myid");

// dao
MyshopDao dao = new MyshopDao();

// 장바구니 목록
List<HashMap<String,String>> list = dao.getCartList(id);
%>
<body>
<h4 class="alert alert-warning" style="width: 1000px;">
<%= id %>님의 장바구니
</h4>
<table class="table table-striped" style="width: 1000px;">
	<tr>
		<th style="width: 30px;">
			<input type="checkbox" id="allcheck">
		</th>
		<th style="width: 300px;">이미지</th>
		<th>상품명</th>
		<th>수량</th>
		<th>날짜</th>
		<th style="width: 300px;">상품금액</th>
	</tr>
	<%
	NumberFormat nf = NumberFormat.getInstance();
	// 합계금액
	int allmoney = 0;
	
	for (int i = 0; i < list.size(); i++)
	{
		HashMap<String,String> map = list.get(i);
		%>
		<tr>
			<td align="center">
				<input type="checkbox" name="idx" idx="<%=map.get("idx")%>" class="idx">
			</td>
			<td align="center">
				<!-- shopnum은 사용자지정속성 -->
				<div shopnum="<%=map.get("shopnum")%>" class="sangpum">
					<img alt="" src="myshopsave/<%=map.get("photo")%>" class="photo"
					hspace="20">			
				</div>
			</td>
			<td align="center" style="vertical-align: middle;"><%=map.get("sangpum")%></td>
			<td align="center" style="vertical-align: middle;"><%=map.get("cnt")%></td>
			<td align="center" style="vertical-align: middle;"><%=map.get("cartday")%></td>
			<td align="right" style="padding-right: 100px; vertical-align: middle;">
				<%
				int price = Integer.parseInt(map.get("price")) * Integer.parseInt(map.get("cnt"));
				allmoney += price;
				%>
				<h5><%=nf.format(price)%>원&nbsp;&nbsp;&nbsp;
					<span class="del glyphicon glyphicon-trash" idx="<%=map.get("idx")%>"></span>
				</h5>
			</td>
		</tr>
	<%
	}
	%>
	<tr>
		<td colspan="6">
			<button class="btn btn-danger"
			style="margin-left: 100px;" id="btncartdel">선택상품삭제</button>
			<span style="font-size: 2em; float: right;">총 주문금액: <b style="color: green;"><%=nf.format(allmoney) %></b></span>
		</td>
	</tr>
</table>
</body>
</html>