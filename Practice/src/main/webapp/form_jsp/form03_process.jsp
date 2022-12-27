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
		request.setCharacterEncoding("utf-8");
		Enumeration paramNames = request.getParameterNames();
		

		while(paramNames.hasMoreElements()){
			String name = (String) paramNames.nextElement();
			out.print(name );
			
			if(name.equals("fruit")){
				String[] paramValue = request.getParameterValues(name);
				out.println();
				if(paramValue != null){
					for(int i=0; i< paramValue.length; i++){
						out.println(paramValue[i]);
					}
				}
				out.println();
			}else{
				String paramValue = request.getParameter(name);
				out.println(paramValue );
			}
		}

	%>


	
</body>
</html>