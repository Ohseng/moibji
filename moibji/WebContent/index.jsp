<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	
	body, div {
		margin: 0px;
		padding: 0px;
	
	}
	
	h2 {
		margin: 0px;
		font-family: 'Nanum Pen Script', serif;
		font-size: 40px;
	}

	img {
		width: 300px;
		height: 300px;
	}
	
	a {
		text-decoration: none;
	}
	.pdt_item {
		float: left;
		margin: 0px 10px;
	}

	.best_div {
		margin-top: 140px;
	}
	
	.item_list {
		clear: both;
		margin-top: 140px;
	}
	
	.pdt_item {
		text-align: center;
		font-family: 'Nanum Pen Script', serif;
		font-size: 22px;	
	}
	
	#pdt_img:hover {
		opacity: 0.5;
	}
	
	.wrap_info > #best_price {
		text-decoration: none;
		color: black;
	}
	
	.wrap_info > #new_price {
		text-decoration: none;
		color: black;
	}
	
	
	
</style>
<script src = "js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@include file="header.jsp"%>

	<div class="item_list">
		<h2>Best 3</h2>
		<hr>
		<c:forEach items="${bestlist}" var="bPDto">
			<div class="pdt_item">
				<a href = "detail.jsp?img=${bPDto.p_img} &name=${bPDto.p_name} &price=${bPDto.p_price2}">
					<img alt="베스트상품" src="img/${bPDto.p_img}" id = "pdt_img" >
					<div class = "wrap_info">
						<span id = "best_price">${bPDto.p_name}</span><br>
						<span id = "best_price">
							<fmt:setLocale value="ko_kr"/><!-- ko_kr, en_us, ja_jp -->
							<fmt:formatNumber value = "${bPDto.p_price2}" type = "currency"/>
						</span><br>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="item_list">
		<h2>New</h2>
		<hr>
		<c:forEach items="${newlist}" var='nPDto'>
		<div class = "pdt_item">
			<a href = "newDetail.jsp?img=${nPDto.p_img} &name=${nPDto.p_name} &price=${nPDto.p_price2}">
			<img alt="신상품" src="img/${nPDto.p_img}" id = "pdt_img">
			<div class = "wrap_info">
				<span id = "new_price">${nPDto.p_name}</span><br>
				<span id = "new_price">
					<fmt:setLocale value="ko_kr"/>
					<fmt:formatNumber value = "${nPDto.p_price2}" type = "currency"/>
				</span><br>
			</div> 
			</a>
		</div>
		</c:forEach>
	</div>
</body>
</html>