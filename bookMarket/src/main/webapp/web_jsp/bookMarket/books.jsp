<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import ="bookMarket.ver01.dto.Book" %>
<%-- jsp:useBean id="productDAO" class="bookMarket.ver01.dao.BookRepository" scope="session" /--%>

<%--추가 부분 --%>
<%@ page import = "bookMarket.ver01.dao.BookRepository" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css
">
<meta charset="UTF-8">
<title>도서목록</title>
</head>
<body>
   <jsp:include page="menu.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">도서목록</h1>
      </div>
   </div>
   
   <div class="container">
   <%@ include file="dbconn.jsp" %>
      <div class="col" align="left">
         <% 
         
        // String realPath = request.getServletContext().getRealPath("resources/images");
        // out.print(realPath);
            String sql = "select * from book";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
         %>
			<div class="row-md-4">
			<!--  <img src="c:/upload/<%=rs.getString("b_fileName") %>" style="width:300px" alt="">
			--> <img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("b_fileName")%>" style="width: 100px" alt="">
				<h3><%=rs.getString("b_category") + " " + rs.getString("b_name")%> / <%=rs.getString("b_id")%></h3>
				<p><%=rs.getString("b_description") %>
				<p><%=rs.getString("b_author") +" "+ rs.getString("b_publisher") +" "+ rs.getInt("b_unitPrice")%>원
			<a href ="./book.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
				<hr>
			</div>
	     <% 
            }
            
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         %>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>