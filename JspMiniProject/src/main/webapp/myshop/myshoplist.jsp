<%@page import="data.dto.MyshopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MyshopDao"%>
<%@page import="java.text.NumberFormat"%>
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
.photo {
	width: 220px;
	height: 230px;
	border: 1px solid gray;
	margin-bottom: 10px;
}
.shoptb tr {
	height: 280px;
	font-weight: bold;
	padding: 10px;
}
</style>
<script type="text/javascript">
$(function(){
	$("a.godetail").click(function(){
		var shopnum = $(this).attr("shopnum");
		//alert(shopnum);
		location.href = "index.jsp?main=myshop/detailpage.jsp?shopnum="+shopnum;
	});
});
</script>
</head>
<%
MyshopDao dao = new MyshopDao();
List<MyshopDto> list = dao.getAllSangpums();
%>
<body>
<div class="container">
  <h2>상품목록</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#Bathroom">Bathroom</a></li>
    <li><a data-toggle="tab" href="#FoodRestaurant">Food Restaurant</a></li>
    <li><a data-toggle="tab" href="#playroom">play room</a></li>
  </ul>
  
  <div class="tab-content">
	<div id="home" class="tab-pane fade in active">
    <h3>HOME</h3>
		<p>
		<table class="shoptb table table-borderd" style="width: 700px;">
			<caption><b>전체상품목록</b></caption>
			<tr>
			<%
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			int i = 0;
			
			for(MyshopDto dto:list)
			{
				String photo = dto.getPhoto();
				//할인율 20~50 난수발생
				int sale = (int)(Math.random()*31)+20;
				%>
				<td>
					<a shopnum="<%= dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="myshopsave/<%= photo %>" class="photo"><br>
						<%= dto.getSangpum() %><br>
						<b style="color: red; font-size: 1.3em;"><%= sale %>%</b>
						<span style="float: right;">
							<div style="color: gray; font-size: 13pt;">
								<%
								int price = (int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
								%>
								<strike><%= nf.format(dto.getPrice()) %></strike>
							</div>
							<div style="color: black; font-size: 16px;">
								<%= nf.format(price) %>
							</div>
						</span>
					</a>
				</td>
				<%
				if((i+1)%4 == 0)
				{%>
					</tr>
					<tr>
				<%
				}
				i++;
			}
			%>
			</tr>
		</table>
		</p>
	</div>

	<div id="Bathroom" class="tab-pane fade">
		<p>
		<table class="table table-borderd" style="width: 700px;">
			<caption><b>화장실</b></caption>
			<tr>
			<%
			i = 0;
			for(MyshopDto dto:list)
			{
				if(dto.getCategory().equals("화장실"))
				{
				String photo = dto.getPhoto();
				//할인율 20~50 난수발생
				int sale = (int)(Math.random()*31)+20;
				%>
				<td>
					<a shopnum="<%= dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="myshopsave/<%= photo %>" class="photo"><br>
						<%= dto.getSangpum() %><br>
						<b style="color: red; font-size: 1.3em;"><%= sale %>%</b>
						<span style="float: right;">
							<div style="color: gray; font-size: 13pt;">
								<%
								int price = (int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
								%>
								<strike><%= nf.format(dto.getPrice()) %></strike>
							</div>
							<div style="color: black; font-size: 16px;">
								<%= nf.format(price) %>
							</div>
						</span>
					</a>
				</td>
				<%
				if((i+1)%4 == 0)
				{%>
					</tr>
					<tr>
				<%
				}
				i++;
				}
			}
			%>
			</tr>
		</table>
		</p>
	</div>

	<div id="FoodRestaurant" class="tab-pane fade">
		<p>
		<table class="table table-borderd" style="width: 700px;">
			<caption><b>레스토랑</b></caption>
			<tr>
			<%
			i = 0;
			for(MyshopDto dto:list)
			{
				if(dto.getCategory().equals("레스토랑"))
				{
				String photo = dto.getPhoto();
				//할인율 20~50 난수발생
				int sale = (int)(Math.random()*31)+20;
				%>
				<td>
					<a shopnum="<%= dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="myshopsave/<%= photo %>" class="photo"><br>
						<%= dto.getSangpum() %><br>
						<b style="color: red; font-size: 1.3em;"><%= sale %>%</b>
						<span style="float: right;">
							<div style="color: gray; font-size: 13pt;">
								<%
								int price = (int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
								%>
								<strike><%= nf.format(dto.getPrice()) %></strike>
							</div>
							<div style="color: black; font-size: 16px;">
								<%= nf.format(price) %>
							</div>
						</span>
					</a>
				</td>
				<%
				if((i+1)%4 == 0)
				{%>
					</tr>
					<tr>
				<%
				}
				i++;
				}
			}
			%>
			</tr>
		</table>
		</p>
	</div>

	<div id="playroom" class="tab-pane fade">
		<p>
		<table class="table table-borderd" style="width: 700px;">
			<caption><b>놀이터</b></caption>
			<tr>
			<%
			i = 0;
			for(MyshopDto dto:list)
			{
				if(dto.getCategory().equals("놀이터"))
				{
				String photo = dto.getPhoto();
				//할인율 20~50 난수발생
				int sale = (int)(Math.random()*31)+20;
				%>
				<td>
					<a shopnum="<%= dto.getShopnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="myshopsave/<%= photo %>" class="photo"><br>
						<%= dto.getSangpum() %><br>
						<b style="color: red; font-size: 1.3em;"><%= sale %>%</b>
						<span style="float: right;">
							<div style="color: gray; font-size: 13pt;">
								<%
								int price = (int)(dto.getPrice()-(dto.getPrice()*(sale/100.0)));
								%>
								<strike><%= nf.format(dto.getPrice()) %></strike>
							</div>
							<div style="color: black; font-size: 16px;">
								<%= nf.format(price) %>
							</div>
						</span>
					</a>
				</td>
				<%
				if((i+1)%4 == 0)
				{%>
					</tr>
					<tr>
				<%
				}
				i++;
				}
			}
			%>
			</tr>
		</table>
		</p>
	</div>
</div>
</body>
</html>