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
1)request 내장객체의 getParameter() 메서드를 이용하여 전송된 요청 파라미터 값을 받습니다.
2) 아이디와 비번이 인증되면 아이디 값을 쿠키명 userID의 쿠키 값으로 설정합니다.
3) response 내장객체의 sendRedirect() 메서드를 이용하여 welcome.jsp파일로 이동하도록 작성합니다. --%>
	
	<%
	
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");
	Cookie[] cookies = request.getCookies();
	if(user_id.equals("pp") && user_pw.equals("1234")){
		Cookie cookie_id = new Cookie("userID", user_id);
		Cookie cookie_pw = new Cookie("userPW", user_pw);
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
		out.println("쿠키 생성이 성공했습니다<br>");
		out.println(user_id + "님 환영합니다<br>");
		response.sendRedirect("welcome.jsp");
	
		
	} else {
		out.println("쿠키 생성이 실패했습니다");
	}
	
	%>
</body>
</html>