<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
1) input 태그에 text유형을 이용하여 아이디, 비번 항목 작성
2) form 태그의 action 속성 값은 cookie_process.jsp로 작성 --%>
	<form action="cookie_process.jsp" method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="text" name="passwd">
		<p><input type="submit" value="전송">
	
	</form>
</body>
</html>