<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
   Cookie[] cookies = request.getCookies();
   String id = null;
   
   for (int i = 0; i < cookies.length; i++) {
      //out.println("설정된 쿠키의 속성 이름 ["+i+"] : "+cookies[i].getName()+"<br>");
      //out.println("설정된 쿠키의 속성 값 ["+i+"] : "+cookies[i].getValue()+"<br>");
      //out.println("----------------------------------------<br>");
      if (cookies[i].getName().equals("userID") && cookies[i].getValue() != null) {
         id = cookies[i].getValue();
         out.println(id + "님 환영합니다.");
      }
   }
   
   if(id == null) {
      response.sendRedirect("cookie.jsp");
   }
   
   
%>
		<a href="cookie_out.jsp">로그아웃</a>
</body>
</html>