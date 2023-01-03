<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class = "navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href ="./welcome.jsp">Home</a>
		</div>
		<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="./books.jsp">상품목록</a></li>
				<li class="nav-item"><a class="nav-link" href="./addBook.jsp">상품등록</a></li>
				<li class="nav-item"><a class="nav-link" href="./editBook.jsp?edit=update">상품수정</a></li>
				<li class="nav-item"><a class="nav-link" href="./editBook.jsp?edit=delete">상품삭제</a></li>
			</ul>
	</div>
	</nav>
</body>
</html>