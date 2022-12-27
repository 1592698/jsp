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
			<th>name</th>
			<th>value</th>
		</tr>

	<%
		request.setCharacterEncoding("UTF-8");
		Enumeration paramNames = request.getParameterNames();
		
		String id = request.getParameter("memberID");
		String passwd = request.getParameter("passwd");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		String[] interest = request.getParameterValues("interest");
		String zipcode = request.getParameter("zipcode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		
		String mailYN = request.getParameter("mailYN");
		String smsYN =request.getParameter("smsYN");
		String IP=request.getRemoteAddr();
		
		while(paramNames.hasMoreElements()){
			String name = (String) paramNames.nextElement();
			out.print("<tr><td>" + name + "</td>\n");
			
			if(name.equals("hobby")){
				String[] paramValue = request.getParameterValues(name);
				out.println("<td> ");
				if(paramValue != null){
					for(int i=0; i< paramValue.length; i++){
						out.println(" " + paramValue[i]);
					}
				}
				out.println("</td></tr>\n");
			}else{
				String paramValue = request.getParameter(name);
				out.println("<td>" + paramValue + "</td></tr>\n");
			}
		}
	%>
	 <%-- 웹 브라우저의 IP 주소 반환 --%>
	 <p>클라이언트 IP: <%=request.getRemoteAddr()%>
	
	
</body>
</html>