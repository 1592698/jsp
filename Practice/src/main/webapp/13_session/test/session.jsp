<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 

1. session.isp 파일을 생성합니다.
    - input 태그에 text 유형을 이용하여 아이디, 비밀번호 항목을 작성합니다.
    - form 태그의 action 속성 값은 session_process.jsp 로 작성합니다.

 -->
	<form action="session_process.jsp" method="post">
		<p>아이디:<input type="text" name="id">
		<p>비밀번호:<input type="text" name="passwd">
		<p><input type="submit" value="전송">
	
	</form>
</body>
</html>