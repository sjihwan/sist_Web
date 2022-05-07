<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Responsive Drop Down Menu jQuery CSS3 Using Icon Symbol</title>
<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="menu/css/menu.css">

<script type="text/javascript" src="menu/js/jquery.js"></script>
<script type="text/javascript" src="menu/js/function.js"></script>
</head>
<%
String root = request.getContextPath();
String loginok = (String)session.getAttribute("loginok");
String myid = (String)session.getAttribute("myid");
%>
<body>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="http://www.freshdesignweb.com"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%= root %>">Home</a></li>
					<li class="parent">
						<a href="#">Member</a>
						<ul class="sub-menu">
							<li><a href="index.jsp?main=member/memberform.jsp"><i class="icon-wrench"></i>회원가입폼</a></li>
							<li><a href="index.jsp?main=member/memberlist.jsp"><i class="icon-credit-card"></i>회원목록</a></li>
							<li><a href="#"><i class="icon-gift"></i> Icons</a></li>
							<li>
								<a class="parent" href="#"><i class="icon-file-alt"></i> Pages</a>
								<ul class="sub-menu">
									<li><a href="#">Full Width</a></li>
									<li><a href="#">Left Sidebar</a></li>
									<li><a href="#">Right Sidebar</a></li>
									<li><a href="#">Double Sidebar</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="index.jsp?main=login/loginmain.jsp">Login</a></li>
					<li class="parent">
						<a href="#">Board</a>
						<ul class="sub-menu">
							<li><a href="index.jsp?main=guest/guestlist.jsp">회원방명록</a></li>
							<li><a href="index.jsp?main=board/boardlist.jsp">스마트게시판</a></li>
							<li><a href="#">Masonry</a></li>
							<li><a href="#">Double Sidebar</a></li>
							<li><a href="#">Single Post</a></li>
						</ul>
					</li>
					<li><a href="#">Shop</a>
						<ul class="sub-menu">
						<%
						if(loginok!=null && myid.equals("admin")){%>
							<li><a href="index.jsp?main=myshop/addform.jsp">상품등록</a></li>
							<li><a href="index.jsp?main=myshop/myshoplist.jsp">상품목록</a></li>
						<%
						}else{%>
							<li><a href="index.jsp?main=myshop/myshoplist.jsp">상품목록</a></li>
						<%
						}
						%>
						</ul>
					</li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body></html>