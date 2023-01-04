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
	내장 객체로 페이지 이동하기
	아이디와 비밀번호가 일치하면 성공 페이지로, 그렇지 않으면 로그인 페이지로 이동
	1) 폼 문으로 전송받을 아이디와 비밀번호가 일치하면 response01_success.jsp 페이지로 이동,
	일치 하지 않으면 response01_failed.jpg 페이지로 이동하도록
	response 내장 객체의 sendRedirect() 메서드를 작성 --%>
	
	<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("id");
	String password = request.getParameter("passwd");
	
	if(userid.equals("관리자") && password.equals("1234")){
		response.sendRedirect("response01_success.jsp");
	}
	else {
		response.sendRedirect("response01_failed.jsp");
	}
	%>
</body>
</html>