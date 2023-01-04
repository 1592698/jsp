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
세션 유효 시간을 가져와 출력하기.
1) 세션에 설정된 유효 시간을 가져오도록 session 내장 객체의 getMaxInactiveInterval() 메서드를 작성하고
유효시간을 출력하도록 작성
2) 세션 유효 시간을 60 * 60 초로 설정하도록
session 내장 객체의 setMaxInactiveInterval() 메서드를 작성
3) 세션에 설정된 유효 시간을 가져오도록 session 내장 객체의 
getMaxInactiveInterval() 메서드를 작성하고, 유효시간을 출력하도록 작성  --%>
	<p><h4>----------세션 유효 시간 변경전-----------</h4>
	
	<%
	int time = session.getMaxInactiveInterval() / 60;
	out.println("세션 유효 시간 : " + time + "분<br>");%>
	
	<p><h4>----------세션 유효 시간 변경후-----------</h4>
	<%
	session.setMaxInactiveInterval(60 * 60 );
	time=session.getMaxInactiveInterval() / 60;
	
	out.println("세션 유효 기간 : " + time + "분<br>");
	%>
</body>
</html>