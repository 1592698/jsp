<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bookMarket.ver01.dto.Book" %>
<%-- jsp:useBean id="bookDAO" class="bookMarket.ver01.dao.BookRepository" scope="session" /--%>

<%--추가 부분 --%>
<%@ page import ="bookMarket.ver01.dao.BookRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href ="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>

<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else {
			document.addForm.reset();
		}
	}

</script>
</head>
<body>

<jsp:include page="menu.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">도서정보</h1>
	</div>
</div>

<%
	String id = request.getParameter("id");//추가부분
	BookRepository dao = BookRepository.getInstance();
	Book book = dao.getBookById(id); 
%>
<div class="container">
      <div class="row">     
          <div class="col-md-3">
           <img src="${pageContext.request.contextPath}/resources/images/<%=book.getFileName() %>"
			style="width: 100%"/>
         </div>         
         <div class="col-md-6">
            <h3><%=book.getName() %></h3>
            <p><%=book.getDescription() %></p>
            <p><b>도서 코드 : </b><span class= "badge badge-danger"><%=book.getBookId()%></span></p>
            <p><b>저자 : </b><%=book.getAuthor()%></p>
            <p><b>페이지 : </b><%=book.getTotalPages()%></p>
            <p><b>출판사 : </b><%=book.getPublisher()%></p>
            <p><b>분류 : </b><%=book.getCategory()%></p>
            <p><b>발간일 : </b><%=book.getReleaseDate()%></p>
            <p><b>재고 : </b><%=book.getUnitsInStock()%></p>
            <p><b>상태 : </b><%=book.getCondition()%></p>
              <h4><%=book.getUnitPrice() %>원</h4>
              <form name="addForm" action="./addCart.jsp?id=<%=book.getBookId() %>" method="post">
              <p><a href = "#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
              <a href="./books.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a></p>         
              <a href = "./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>   
              </form>	
         </div>         
      </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>