<%@ page import="java.util.Calendar" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	2. response 내장 객체를 이용하여 다음 조건에 맞게 JSP 애플리케이션을 만들고
	실행 결과를 확인하시오.
	1) response.jsp 파일을 생성합니다.
	*response 내장 객체의 setHeader() 메소드를 이요하여 5초마다 페이지를 갱신
	하도록 작성합니다.
	*java.util.Calendar 클래슬 이용하여 현재 시간을 출력하도록 작성합니다.
	
	2)response_data.jsp 파일을 생성합니다.
	*response 내장 객체의 sendRedirect() 메서드를 이용해
	구글 홈페이지로 이동하도록 작성합니다. --%>
	
	
	<%
		response.setHeader("Refresh","5");
		Calendar calendar = Calendar.getInstance();
		String am_pm;
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		
		if(hour<12)
			am_pm ="AM";
		else{
			am_pm ="PM";
			hour = hour -12;
		}
		String CT = hour + ":" + minute + ":" + second + am_pm;
	%>
	<p>현재 시간은 <b><%=CT %></b></p>
	<p> <a href="./response_data.jsp">Google 홈페이지로 이동하기</a></p>
	

</body>
</html>