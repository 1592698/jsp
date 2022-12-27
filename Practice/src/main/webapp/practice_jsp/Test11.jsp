<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스크립틀릿 태그를 이용해 다음 조건에 맞게 JSP 애플리케이션을 만들고 실행결과를
	확인하시오 
	1) 스크립틀릿 태그를 이용해 java.util.Date 형 지역변수에 현재 날짜를 저장
	현재 날짜 값을 출력-->
	
	<%
	java.util.Date d = new java.util.Date();
	out.println(d);
	%>
	
	
</body>
</html>