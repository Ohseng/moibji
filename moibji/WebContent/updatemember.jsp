<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type = "text/css">


	body {
	background-img: "img/superChopha.jpg";	
	
	}
	
	.login {
		width: 1200px;
		margin: auto;
		margin-top: 127px;
		
	}
	
	table {
		margin: auto;
		text-align: center;
	}
	
	#private {
		text-align: center;
	}
	
	div {
		display: block;
		margin: auto;
	}
	
	

	.header {
		border-bottom: 1px solid #dcdcdc;
		padding: 5px 0;
		text-align: center;
		margin: 0 auto;
		width: 1200px;
		display: inline-block;
	}

	.article {
		padding: 20px;
		margin-top: 30px;
		
	
	}
	.article_table {
		border-top: 1px solid #dcdcdc;
		border-bottom: 1px solid #dcdcdc;
		padding: 20px;
		margin-bottom: 50px;
		width: 595px;			
	}
	
	.article_table2 {
		border-top: 1px solid #dcdcdc;
		border-bottom: 1px solid #dcdcdc;
		padding: 20px;
		width: 595px;
	}
	
	#private {
		padding: 10px 0 10px 0;
		text-align: left;
		margin-left: 330px;
		
	}
	
	#table_th {
		padding: 10px 10px 5px 10px;
		width: 110px;
		font-size: 13px;
		text-align:left;
		
	}
	
	#table_th1 {
		padding: 10px 0px 5px 10px;
		width: 324px;
	}
	
	.div_index{
		text-align: center;
	}
	
	.btn_index {
		text-decoration: none;
		padding: 8px;
		color: #52616a;
		border: 1px solid #f0f5f9;
		background-color: #c9d6de;
		border-radius: 5px;
		font-size: 12px;
		font-family: 'Jeju Hallasan', serif;
	}
	
	#sample6_postcode {
  		margin-left: 106px;
	}
	
	
</style>
<script type="text/javascript"></script>
<script src = "js/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
  
	$(document).on("click","#btn_update", function(){
		
		var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
		var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
		var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
		var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
		
		var
		form = $("#frm_join"),
		uid = $("#uid"),
		uid2 = $("#uid2"),
		ckuid = $("#ckuid"),
		upw = $("#upw"),
		urepw = $("#urepw"),
		uname = $("#uname"),
		uzipcode = $("uzipcode"),
		uaddr1 = $("#uaddr1"),
		uaddr2 = $("#uaddr2"),
		uphone = $("#uphone"),
		uemail = $("#uemail");
		
		
		var
		id = $.trim(uid.val()),
		id2 = $.trim(uid2.val()),
		pw = $.trim(upw.val()),
		repw = $.trim(urepw.val()),
		name = $.trim(uname.val()),
		zipcode = $.trim(uzipcode.val()),
		addr1 = $.trim(uaddr1.val()),
		addr2 = $.trim(uaddr2.val()),
		phone = $.trim(uphone.val()),
		mail = $.trim(uemail.val());
		
		
		/* if(phone == ""){
			uphone.focus();
			alert("전화번호를 입력해주세요");
			
			return false;
		} else if(!re_tel.test(phone)) {
			uphone.focus();
			alert("숫자를 입력하세요");
			return false;
		} */
	
		$("#frm_join").submit();
			
		
	});
	

		</script>
</head>
<body>
<%@include file = "header.jsp" %>
	<div class="login">
		<div class="header">
			<span><strong>회원수정</strong></span>
			
			
		</div>
		
	<div class="article">
		<form action = "JoinUpdate" name = "frm_update" method ="POST" id = "frm_update" >
		<table class = "article_table">
			<tr>
			<div id = "private"><strong>수정할 ID</strong></div>
			<th id = "table_th">아이디</th>
			<th id = "table_th1"><input type = "text" id = "uid" name = "uid" value = ${sessionScope.loginUser.shopid} readonly>
			</th>
			</tr>
			<tr>
			<th id = "table_th">비밀번호</th>
			<th id = "table_th1"><input type = "password" id = "upw" name = "upw" value = ${sessionScope.loginUser.shoppw}>
			</th>
			</tr>
		</table>
		
		
		<table class = "article_table2">
		
			<tr>
			<div id = "private"><strong>수정할 회원정보</div> 
			<th id = "table_th">이름</th>
			<th id = "table_th1"><input type = "text" id = "input"name = "uname" value = ${sessionScope.loginUser.shopname}>
			</th>
			</tr>
			
			<tr>
			<th id = "table_th">주소</th>
			<th id = "table_th1"><input type="text" id="sample6_postcode" placeholder="우편번호" name = "uzipcode">
			<input type="button" onclick="sample6_execDaumPostcode()"  value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" name = "uaddr1" placeholder="주소"><br>
			<input type="text" id="sample6_address2" name = "uaddr2" placeholder="상세주소">
			<tr>
			<th id = "table_th">휴대전화</th>
			<th id = "table_th1"><input type = "text" id = "uphone" name = "uphone" value = ${sessionScope.loginUser.shopphone}>
			</th>
			<tr>
			<th id = "table_th">이메일</th>
			<th id = "table_th1"><input type = "text" id = "uemail" name = "uemail" value = ${sessionScope.loginUser.shopemail}></th>
			</tr>
			
		</table>
		</form>
	</div>
	
		<div class="div_index">
			
				<a href="#" class="btn_index" id = "btn_update">등록</a>&nbsp&nbsp
				<a href="#"	class="btn_index">취소</a>
		</div>
			
	</div>

	
</body>
</html>