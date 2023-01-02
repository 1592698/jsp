<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
		request.setCharacterEncoding("utf-8");
	
		//int num = Integer.parseInt(request.getParameter("num"));
		String num = request.getParameter("num");
		String depart = request.getParameter("depart");
		String name= request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		Statement stmt = null;
	
		try{
			String sql = "INSERT INTO student(num, depart, name, address, phone) VALUES ('" + num + "',  '" + depart + "', '" + name + "',  '" +  address + "', '" + phone + "')";
			out.print(sql);
			stmt= conn.createStatement();
			stmt.executeUpdate(sql);
			out.println("Member 테이블 삽입이 성공했습니다.");
		} catch (SQLException ex){
			out.println("Member 테이블 삽입이 실패했습니다.<br>");
		}
		
	%>
</body>
</html>