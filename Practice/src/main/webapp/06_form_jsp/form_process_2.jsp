<%@ page import="java.util.Enumeration" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
	<tr>
		<th>요청 파라미터 이름</th>
		<th>요청 파라미터 값</th>
	</tr>
	<%-- 회원가입 양식에서 폼 데이터를 한 번에 전송받기
	1) 폼 페이지에서 전송된 요청 파라미터를 받도록 request 내장 객체의
	getParameterNames() 메서드를 작성.
	2) 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록
	hasMoreElements() 메서드를 작성.
	3) 폼 페이지에서 전송된 요청 파라미터의 이름을 가져오도록
	nextElement() 메서드를 작성.
	4) 폼 페이지에서 전송된 요청 파라미터의 값을 가져오도록
	요청 파라미터의 이름으로 request 내장 객체의 
	getParameter() 메소드를 작성 --%>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		Enumeration paramNames = request.getParameterNames();
		while(paramNames.hasMoreElements()){
			String name = (String) paramNames.nextElement();
			out.print("<tr><td>" + name + "</td>\n");
			
			String[] paramValue = request.getParameterValues(name);
			out.println("<td>");
			if(paramValue !=null){
				for(int i=0; i< paramValue.length; i++){
					out.println(" " + paramValue[i]);
				}
			}
			out.println("</td></tr>\n");
		}
	%>
	</table>
</body>
</html>