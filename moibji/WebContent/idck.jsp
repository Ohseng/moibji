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


	body {
		margin: 0px;
		padding: 0px;
	}
	
	.ckid {
		width: 236px;
		margin: auto;
		margin-top: 67px;
		
	}
	#idck_btn{
		margin-top: 10px;
		padding: 7px;
	}

	button {
		margin-top: 10px;
		position: relative;
		left: 58px;
		padding: 10px;
		width: 77px;
	}



</style>
<script type="text/javascript">
	function closeOk() {
		opener.document.frm_join.upw.focus();
		opener.document.frm_join.ckuid.value = "yes";
		opener.document.frm_join.uid2.value = "${message}";
		self.close();
	}

	function closeNg() {
		opener.document.frm_join.uid.select();
		opener.document.frm_join.ckuid.value = "no";
		opener.document.frm_join.uid2.value = "${message}";
		self.close();
	}


</script>

</head>
<body>
<div class = ckid>
	<c:choose>
		<c:when test="${idCount == '0'}">
			<span class = "ckid_span">${message}(은)는 사용가능한 ID입니다.</span><br>
			<button onclick = "closeOk()">확인</button>	
		</c:when>
		<c:otherwise>
			${message}(은)는 중복된 ID입니다.<br>
			<span class = "ckid_span">다른 ID를 입력해주세요.</span><br>
			<input type ="text" id = "idck_btn">
			<button onclick = "closeNg()">확인</button>	
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>