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
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
	
		BookRepository dao =BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	<div class="container">
		<div class="col">
			<%
				for(int i=0; i< listOfBooks.size(); i++){
					Book book = listOfBooks.get(i);
			%>
			<div class="row-md-4">
			<img src="${pageContext.request.contextPath}/resources/images/<%=book.getFileName()%>" style="width: 100px" alt="">
				<h3><%=book.getCategory() + " " + book.getName()%> / <%=book.getBookId()%></h3>
				<p><%=book.getDescription() %>
				<p><%=book.getAutor() +" "+ book.getPublisher() +" "+ book.getUnitPrice()%>원
			<a href ="./book.jsp?id=<%=book.getBookId()%>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
				<hr>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>