<%@ page import="java.util.Enumeration" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8");
	Enumeration paramNames = request.getParameterNames();
	while(paramNames.hasMoreElements()){
		StringBuffer info = new StringBuffer((String) paramNames.nextElement());
		out.print("<b>" + info +"</b>" + " : " + "\n");
		String infoValue = request.getParameter(info.toString());
		out.println(infoValue + "<br>");
	}
%>
</body>
</html>