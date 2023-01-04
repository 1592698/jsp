<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script defer src="./js/member.js"></script>
    <script>
    /* 
    카카오 우편번호 검색 가이드 페이지 :  https://postcode.map.daum.net/guide
    getElementById() : html 에서 매개변수로 받은 id 값이 있는 요소를 반환.
    */
        
    </script>

 
	<h3>회원가입</h3>
	<form action= "member_insert_action.jsp" name = "member"  id="form" method="post">
	<p> 회원 아이디 : <input type = "text" name="memberID" id="memberID">
	<p> 비밀번호 : <input type = "password" name="passwd" id="passwd"></p>
	<p> 이름 : <input type ="text" name= "memberName" id="memberName"></p>
	<p> 이메일 : <input type = "text"></p>

	<p> 관심사항 : 영화<input type = "checkbox" name ="interest" value="영화" checked>
			  독서<input type = "checkbox" name ="interest" value="독서">
			  수영<input type = "checkbox" name ="interest" value="수영">
			  등산<input type = "checkbox" name ="interest" value="등산">
	<p> 주소 : <input name="zipcode" id ="zipcode" size="10" maxlength="7" readonly>
		<span onclick="execDaumPostcode();" style="cursor:pointer;">우편번호 검색</span><br />
		<input name = "address1" id="address1" size="70" maxlength="70" readonly>
		<input name ="address2" id="address2" size="70" maxlength="70">
	<p> 생년월일 : <input type="number" name="birthYear" id="birthYear">
				-<input type="number" name="birthMonth" id="birthMonth">
				-<input type="number"  name="birthDay" id="birthDay"></p>
	<p> 메일 수신 여부 :<input type="text" name="mailYN" id="mailYN"></p>		
	<p> 문자 수신 여부 :<input type="text" name="smsYN" id="smsYN"></p>		
	
	<p> <input type="button" value ="전송" id="submitB">
	</form>
	
</body>
</html>