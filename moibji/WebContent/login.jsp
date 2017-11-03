<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type= "text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

	.div_login {
		width: 500px;
		margin: 0 auto;
		margin-top: 140px;
		border: 1px solid #D9D4CF;
		height: 395px;
	}

	.div_input {
		background-color: white;
		border: 1px solid #dadada;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
		width: 250px;
		margin: 0 auto;
		height: 29px;
		margin-bottom: 30px;
	}

	.input_login {
		border-width: 0px;
		width: 240px;
		height: 16px;
		padding: 7px 0px 7px 0px;
	}

	.button a {
		width: 300px;
		height: 44px;
		text-decoration: none;
		background-color: #c9d6de;
		display: block;
		color: white;
		font-size: 22px;
		padding-top: 2px;
		text-align: center;
		line-height: 39px;
		margin: 20px 0px 13px 100px;
		font-family: 'Noto Sans KR', sans-serif;	
		border-radius: 6px;
		border: 1px solid #f0f5f9;
	}

	.login {
		margin-bottom: 20px;
		font-size: 25px;
		text-align: center;
		margin-top: 20px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.login_check {
		margin-left: 98px;
		line-height: 30px;
		margin-top: 5px;
	}
	
	#login_save {
		font-size: 13px;
		margin-right: 120px;
	
	}
	
	#login_save img {
		vertical-align: middle;
	}
		
	#login_ud > a {
		text-decoration: none;
		font-size: 13px;
		color: #747474;
	}
	
	.si {
		color: #D5D5D5;
		
	}

	#member {
		font-size: 12px;
		text-align: center;
		
	}
	
	#member a {
		text-decoration: none;
		color: #747474;
	}
	
	.table_span {
		margin-top: 10px;
		display: none;
		font-size: 12px;
		color: red;
	}
	
</style>
<script src = "js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
	
	$(document).ready(function(){
		$("#inputid").blur(function(){
			if($("#inputid").val() == ""){
				$("#span_id").css("display", "block");
			
			} else {
				$("#span_id").css("display", "none");
			}
		});
	});

	$(document).ready(function(){
		$("#inputpw").blur(function(){
			if($("#inputpw").val() == ""){
				$("#span_pw").css("display", "block");
			
			} else {
				$("#span_pw").css("display", "none");
			}
		});
	});
	
	
	
	function checked() {
		friminsert.submit();
	
		var
		form = $("#frm_login"),
		uid = $("#uid"),
		upw = $("#upw");
		

		var
		id = $.trim(uid.val()),
		pw = $.trim(upw.val());
		
	}
		$(document).on("click","#btn_login", function(){
	
		if($("#inputid").val() == ""){
			$("#span_id").css("display", "block");
			return false;
		} 		
		
		if($("#inputpw").val() == ""){
			$("#span_pw").css("display", "block");
			return false;
		} 
			
			
		
	});
	
	
</script>

</head>
<body>
	<%@include file = "header.jsp" %>
	<div class = "div_header">
		<div class = "div_login">
		<div class = "login">로그인</div>
			<form action = "LoginAction" method = "POST" onclick = "frm_login" name="friminsert">
			<div class="div_input" id="login_id">
				<input type="text" placeholder="아이디" name ="uid"class="input_login" id = "inputid">
				<span class = "table_span" id = "span_id">ID를 입력하세요</span>
			</div>
			<div class="div_input">
				<input type="password" placeholder="비밀번호" name ="upw" class="input_login" id = "inputpw">
				<span class = "table_span" id = "span_pw">비밀번호를 입력하세요</span>
			</div>
		
			<div class = "login_check"> 
				<span id = "login_save"><img src="img/check_off.gif" alt="로그인체크">&nbsp아이디저장</span>
				<span id="login_ud"><a href="#">비회원 로그인</a></span> &nbsp</td>
				</div>
			<div class = "button">
				<a id="btn_login" href="javascript:checked()">로그인</a>
			</div>
			</form>
			
			<div id="member">
				<a href="#">아이디 찾기</a>&nbsp<span class="si">|</span>&nbsp 
				<a href="#">비밀번호 찾기</a>&nbsp<span class="si">|</span>&nbsp 
				<a href="join.jsp">회원가입</a>


			</div>
			
		</div>
		
		</div>
</body>
</html>