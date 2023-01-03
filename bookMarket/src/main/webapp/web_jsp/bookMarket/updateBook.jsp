<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookMarket.ver01.dto.Book"%>
<%@ page import="bookMarket.ver01.dao.BookRepository"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js" defer></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String bookId = request.getParameter("id");
	
		String sql = "select * from book where b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
         <div class="container">
            <div class="text-right">
               <a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
            </div>
         </div>
         <div class="container">
          <form name="newBook" action="./processUpdateBook.jsp" class="form-horizontal" method="post"
            enctype="multipart/form-data">
          <input type="hidden" id="bookId" name="bookId" value='<%=rs.getString("b_id") %>'> <!-- 고유값 수정 못하도록 하려고 hidden -->
             
      <div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="bookId" class="form-control" id="bookId" value='<%=rs.getString("b_id")%>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">도서명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control"  id="name" value='<%=rs.getString("b_name") %>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control" id="unitPrice" value='<%=rs.getString("b_unitPrice") %>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">저자</label>
				<div class="col-sm-5">
					<textarea name="author" cols="50" rows="2" class="form-control"><%=rs.getString("b_author")%></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-5">
					 <textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("b_description")%></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control" value='<%=rs.getString("b_publisher") %>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value='<%=rs.getString("b_category") %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control" id="unitsInStock" value='<%=rs.getString("b_unitsInStock") %>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">페이지 수</label>
				<div class="col-sm-3">
					<input type="text" name="totalPages" class="form-control" id="totalPages" value='<%=rs.getString("b_totalPages")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">출판일</label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control"  id="releaseDate" value='<%=rs.getString("b_releaseDate")%>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">책 상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New" <%if (rs.getString("b_condition").equals("New")) out.print("checked"); %>> 신규 제품 
					<input type="radio" name="condition" value="Old"<%if (rs.getString("b_condition").equals("Old")) out.print("checked"); %>> 중고 제품 
					<input type="radio" name="condition" value="Refurbished"<%if (rs.getString("b_condition").equals("Refurbished")) out.print("checked"); %>> 재생 제품
				</div>
			</div>
			
			<div class="form-group row">
				<label class ="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="from-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" onclick = "CheckAddBook()">
				</div>
			</div>
      </form>
   </div>
   <% 
        }
        if (rs !=null) rs.close();
        if (pstmt !=null) pstmt.close();
        if (conn !=null) conn.close();
    %>
</body>
</html>
</html>