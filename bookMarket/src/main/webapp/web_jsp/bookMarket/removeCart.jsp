<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookMarket.ver01.dto.Book"%>
<%@ page import="bookMarket.ver01.dao.BookRepository"%>
<%@ page import ="java.util.ArrayList" %>


<%
//장바구니에서 상품을 개별 삭제

	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if(book==null){
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
	Book goodsQnt = new Book();
	for(int i=0; i<cartList.size(); i++){ // 상품 리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if(goodsQnt.getBookId().equals(id)){
		cartList.remove(goodsQnt);
		}
	}
	/*
	for(Product p : cartList){
		if(p.getProductId().equals(id)){
			cartList.remove(p);
		}
	}*/
	response.sendRedirect("cart.jsp");%>