<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<Style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);	
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

body, ul {
	margin: 0px;
	padding: 0px;
}

#header {
	background-color: white;
	height: 30px;
	width: 100%;
}

.header_li {
	float: left;
	width: 120px;
	position: relative;
	margin-right: 50px;
	text-align: center;
	
}

.header_li > a:hover {
	opacity: 0.2;
}

#login_user {
	color: white;
	font-family: 'Jeju Hallasan', serif;
	color: #c9d6de;
	text-decoration: none;
	padding: 0 5px;
	font-size: 13px;
	line-height: 30px;
	display: inline-block;
	float: left;
}

#header_ul {
	list-style-type: none;
}

.header_li>a {
	color: #353866;
	text-decoration: none;
	padding: 0 5px;
	font-size: 13px;
	line-height: 30px;
	font-family: 'Jeju Hallasan', serif;
	
	
}

#header_inner {
	float: right;
	margin-right: 70px;
	line-height: 20px;
	
}

#bookmark {
	color: #fec8c9;
	font-size: 13px;
	line-height: 30px;
	font-weight: bold;
	margin-left: 70px;
	font-family: 'Jeju Hallasan', serif;
}

.header_dropdown {
	left: 0px;
	display: none;
	text-align: center;
	background-color: #dae9f4;
	font-family: 'Jeju Hallasan', serif;
	position: absolute;
	width: 100%;	
}

.dropdown_a {
	display: block;
	text-decoration: none;
	padding: 10px 0;
	font-size: 13px;
	color: white;
}

.dropdown_a:hover {
	color: black;
	background-color: white;
	text-decoration: underline;
	font-family: 'Nanum Gothic', serif;
}

.header_li:hover .header_dropdown {
	display: block;	
}

/* line2(로고이미지) */
.logo_span {
	color: #fe4365;
	font-size: 70px;
	font-family: 'Nanum Pen Script', serif;
}

#logo> a {
	text-decoration: none;
	font-family: 'Hanna', serif;
}

#mainlogo {
	width: 280px;
	text-align: center;
	margin: 0 auto;
	padding: 20px 0;
}

#nav_inner {
	height: 50px;
	background-color: #8EC0E4;
	width: 100%;
	
}
.nav_a {
	text-decoration: none;
	line-height: 50px;
	color: #353866;
}

.nav_li {
	float: left;
	width : 120px;
	margin-left: 70px;
	text-align: center;
	color: #52616a;
	position: relative;
}

.nav_li > a:hover {
	opacity: 0.5;
}
#nav_ul {
	list-style-type: none;
}


.cloth_dropdown {
	left: 0px;
	background-color: #f0f5f9;
	font-family: 'Jeju Hallasan', serif;
	width: 100%;
	display: none;
	position: absolute;

}

.nav_dropdown {
	text-decoration: none;
	padding: 10px 0;
	font-size: 13px;
	color: #dedcee;
	width: 100%;
	display: block;
}

.nav_dropdown:hover {
	color: black;
	background-color: white;
	text-decoration: underline;
	font-family: 'Nanum Gothic', serif;
	border: 1px solid #F0E5DE;
	
}


.nav_li:hover .cloth_dropdown {
	display: block;	
	
	
}

</Style>
</head>
<body>
<div id="header">
		<span id="bookmark">BOOKMARK +</span>
		<!-- 로그인, 회원가입 등등 담겨있는 div -->
		<div id="header_inner">
			<ul id="header_ul">
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">	
					<li Class="header_li"><a href="login.jsp">로그인</a></li>
					<li Class="header_li"><a href="join.jsp">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li id = "login_user">${sessionScope.loginUser.shopname}(${sessionScope.loginUser.shopid})</li>
					<li Class="header_li"><a href="LogOutAction">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
					<li Class="header_li"><a href="#">마이페이지▼</a>
						<div class="header_dropdown">
							<a href="#" class="dropdown_a">주문/배송조회</a> 
							<a href="#"	class="dropdown_a">장바구니</a>
							<a href="#" class="dropdown_a">위시리스트</a>
							<a href="#" class="dropdown_a">쿠폰조회</a>
							<a href="UpdateAction" class="dropdown_a" value ="">회원정보수정</a>
						</div>
				</li>
				<li Class="header_li"><a href="#">고객센터▼</a>
					<div class="header_dropdown">
						<a href="#" class="dropdown_a">1:1상담</a> 
						<a href="#" class="dropdown_a">Q＆A</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div id="logo">
		<a href="IndexAction">
		<div id="mainlogo">
			<span class="logo_span">모입지</span>
		</div>
		</a>
	</div>

	<div id="nav_inner">
		<ul id="nav_ul">
			<li class = "nav_li"><a href = "#" class = "nav_a">Best</a></li>
			<li class = "nav_li"><a href = "#" class = "nav_a">New</a></li>
			<li class = "nav_li"><a href = "#" class = "nav_a">T-shirts</a></li>
			<li class = "nav_li"><a href = "#" class = "nav_a">Outer</a>
				<div class = "cloth_dropdown">
					<a href="#" class="nav_dropdown">Jacket</a>
					<a href="#" class="nav_dropdown">Coat</a>
					<a href="#" class="nav_dropdown">Sweater</a>
					<a href="#" class="nav_dropdown">Hood</a>
								
				</div>
			</li>
			<li class = "nav_li"><a href = "#" class = "nav_a">Pants</a></li>
			<li class = "nav_li"><a href = "#" class = "nav_a">Shoes</a>
				<div class= "cloth_dropdown">
					<a href="#" class = "nav_dropdown">Sneakers</a>	
					<a href="#" class = "nav_dropdown">Loafer</a>	
					<a href="#" class = "nav_dropdown">Slipper</a>					
					<a href="#" class="nav_dropdown">Shoe Insert</a>
				
				</div>
			</li>
			<li class = "nav_li"><a href = "#" class = "nav_a">etc</a>
				<div class = "cloth_dropdown">
					<a href="#" class="nav_dropdown">Watch</a>
					<a href="#" class="nav_dropdown">Accessory</a>
								
				</div>
			</li>
		</ul>
	</div>
</body>
</html>