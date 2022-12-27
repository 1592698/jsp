<%@ page import="java.util.Enumeration" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	request 내장 객체로 모든 HTTP 헤더 정보 값 출력하기
	1) 모든 헤더 이름을 가지도록 request 내장 객체의 getHeaderNames() 메서드를 호출하고
	이를 모두 저장하도록 Enumeration 객체 타입의 변수 en을 작성
	2) Enumeration 객체 타입 변수 en의 hasMoreElements() 메서드를 통해
	저장된 헤더 이름이 있을 때까지 반복하도록 while 문작성
	3) 현재 헤더 이름을 가져오도록 Enumeration 객체 타입 변수 en의 nextElement() 메서드를 작성
	4) 설정된 헤더 이름의 값을 가져오도록 request 내장 객체의 getHeader() 메소드를작성
	5) 현재 헤더 이름과 값을 출력하도록 표현문 태그를 작성 
	
	예 : 
	user-agent: 사용자의 브라우저 정보
	referer : 현재 페이지로 이동해오기 바로 전 페이지의 주소.
	--%>
	<%
		Enumeration en = request.getHeaderNames();
		while(en.hasMoreElements()){
			String headerName = (String) en.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
	<%=headerName%> : <%=headerValue %><br>
	<%
		}
	%>
</body>
</html>