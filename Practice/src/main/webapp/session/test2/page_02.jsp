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
회원전용페이지입니다라는 글자 나오도록
로그앙수이라는 텍스트를 클릭하면 logout.jsp 로 이동
세션명 userID에 저장된 값이 없음녀 respose 내장 객체의 sendRedirect() 메서드를 이용하여 login.jsp 파일로 이동 -->

<p>회원 전용 페이지 입니다. </p>
<a href="logout.jsp">로그아웃</a>

<%
      
   String id = null;   
   
   id = (String)session.getAttribute("userID");
         
   if(id == null) {
      response.sendRedirect("login.jsp");
   } else {
      out.println(id+"님 환영합니다.<br>");
   }
   
%>
</body>
</html>