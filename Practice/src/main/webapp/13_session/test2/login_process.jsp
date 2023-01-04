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

    4) login_ process.jsp 파일을 생성합니다.
    - request 내장 객체의 getParameter() 메서드를 이용하여 전송된 요청 파라미터 값을 받습니다.
    - 아이디와 비밀번호가 인증되면 아이디 값을 세션명 userID 의 세션 값으로 설정합니다.
    - response 내장 객체의 sendRedirect 메서드를 이용하여 page_01.jsp 파일로 이동하도록 작성합니다.
 -->
<%
      String user_id = request.getParameter("id");
      String user_pw = request.getParameter("passwd");
      
      if(user_id.equals("admin") && user_pw.equals("1234")) {
         session.setAttribute("userID", user_id);
         
         response.sendRedirect("page_01.jsp");
      }
      else {
         out.println("세션 설정이 실패했습니다.");
      }
   %>
</body>
</html>