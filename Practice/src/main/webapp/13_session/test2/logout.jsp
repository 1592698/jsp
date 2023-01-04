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

 5) logout.jsp 파일을 생성합니다.
    - 설정된 모든 세션명을 해제하도록 작성합니다.
    - response 내장 객체의 sendRedirect 메서드를 이용하여 page_01.jsp 파일로 이동하도록 작성합니다.
 -->
	<%
	
	String user_id = (String) session.getAttribute("userID");
	String user_pw = (String) session.getAttribute("userPW");
	out.println("설정된 세션 userID : " + user_id + "<br>");
	out.println("설정된 세션 userPW : " + user_pw + "<br>");
	
	session.removeAttribute("userID");
	session.removeAttribute("userPW");
	
	response.sendRedirect("page_01.jsp");
	%>
</body>
</html>