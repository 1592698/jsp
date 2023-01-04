<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><h4>------세션을 삭제하기 전-------</h4>
	<%--
	세션에 저장된 세션 속성 삭제하기
	1) 세션에 저장된 세션 속성 이름 userID를 삭제하도록 session 내장객체의 removeAttribute() 메서드를 작성
	    // getParmeter의 경우 없는 값을 부르면 에러가 발생하지만, 
       // Enumeration의 경우 없는 값을 불러도 null이 되고 에러 발생X
	 --%>
	
	<%
	
	String user_id = (String) session.getAttribute("userID");
	String user_pw = (String) session.getAttribute("userPW");
	out.println("설정된 세션 userID : " + user_id + "<br>");
	out.println("설정된 세션 userPW : " + user_pw + "<br>");
	
	session.removeAttribute("userID");
	%>
	
	<p><h4>------세션을 삭제 한 후 -------</h4>
	
	<% 
		user_id =(String) session.getAttribute("userID");
		user_pw =(String) session.getAttribute("userPW");
		out.println("설정된 세션 userID : " + user_id + "<br>");
		out.println("설정된 세션 userPW : " + user_pw + "<br>");
		
		%>
</body>
</html>