<%@ page import= "java.sql.*"%>

<%
		Connection conn = null;
		
		String url = "jdbc:mariadb://localhost:3306/jsp_ex";
		String user = "root";
		String password = "0528";
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);

%>
