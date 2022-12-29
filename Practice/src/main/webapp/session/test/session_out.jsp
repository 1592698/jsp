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
    4.session_out.jsp 파일을 생성합니다.
    - 설정된 모든 세션명을 해제하도록 작성합니다.
    - response 내장 객체의 sendRedirect() 메서드를 이용하여 session.jsp 파일로 이동하도록 작성합니다.
 --%>
<%
String user_id = (String) session.getAttribute("userID");
String user_pw = (String) session.getAttribute("userPW");
out.println("설정된 세션 userID : " + user_id + "<br>");
out.println("설정된 세션 userPW : " + user_pw + "<br>");


session.removeAttribute("userID");
response.sendRedirect("session.jsp");

if(request.isRequestedSessionIdValid() == true){
	out.print("세션이 유효합니다.");
}else{
	out.print("세션이 유효하지 않습니다.");
}

%>
</body>
</html>