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
	1. request내장 객체를 이용해 다음 조건에 맞게 JSP 애플리 케이션을
	만들고 실행 결과를 확인하시오.
	1) request.jsp 파일을 생성합니다.
	*input 태그의 text유형을 이용하여 아이디, 비밀번호 항목을 작성합니다
	*form 태그의 action 속성 값은 request_process.jsp로, 
	method속성 값은 get으로 작성합니다.
	2) request_process.jsp 파일을 생성합니다.
	*request 내장 객체의 getQueryString() 메소드를 이용해
	요청 파라미터와 값을 출력합니다 --%> 
	
	<form action ="request_process.jsp" method="get">
	<p> 아 이 디 : <input type = "text" name = "id">
	<p> 비밀번호 : <input type="text" name = "passwd">
	<p> <input type ="submit" value = "전송"/>
	
	</form>
</body>
</html>