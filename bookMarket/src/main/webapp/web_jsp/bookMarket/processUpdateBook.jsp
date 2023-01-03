<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import ="java.sql.*" %>
<%@ include file = "dbconn.jsp" %>
    <%
    request.setCharacterEncoding("UTF-8");
	
	String realPath = request.getServletContext().getRealPath("resources/images"); //파일저장된 경로
	File dir = new File(realPath);//dir directory(=폴더)
	if(!dir.exists()){
		dir.mkdirs(); //makedirectorys 폴더없으면 폴더 만들어라
	}
	
	String filename="";
	String encType="utf-8"; //인코딩 타입
	int maxSize = 5 *1024 *1024; //최대 업르도될 파일의 크기 5mb

	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());
    
	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String autor = multi.getParameter("autor");
	String description = multi.getParameter("description");
	String publisher = multi.getParameter("publisher");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String totalPages = multi.getParameter("totalPages");
	String releaseDate = multi.getParameter("releaseDate");
	String condition = multi.getParameter("condition");
    	
    	Integer price;
    	
    	if(unitPrice.isEmpty())
    		price = 0;
    	
    	else 
    		price = Integer.valueOf(unitPrice);
    	
    	long stock;
    	if(unitsInStock.isEmpty())
    		stock =0;
    	else
    		stock = Long.valueOf(unitsInStock);
    	long tPage;
    	if(totalPages.isEmpty())
    		tPage=0;
    	else
    		tPage=Long.valueOf(totalPages);
    	
    	Enumeration files = multi.getFileNames();
    	String fname = (String) files.nextElement();
    	String fileName = multi.getFilesystemName(fname);

    	
    	String sql = "select * from book where b_id = ?";
    
    	
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, bookId);
    	rs= pstmt.executeQuery();
    	
    	if (rs.next()) {
    		if (fileName != null) {
		    	sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, "
		    		+ "b_category=?, b_unitsInStock=?, b_totalPages=?, b_releaseDate=?, b_condition=?, b_fileName=? WHERE b_id=?";
		    	pstmt = conn.prepareStatement(sql);
		       	pstmt.setString(1,name);
		    	pstmt.setInt(2,price);
		    	pstmt.setString(3,autor);
		    	pstmt.setString(4,description);
		    	pstmt.setString(5,publisher);
		    	pstmt.setString(6,category);
		    	pstmt.setLong(7,stock);
		    	pstmt.setLong(8,tPage);
		    	pstmt.setString(9,releaseDate);
		    	pstmt.setString(10,condition);
		    	pstmt.setString(11,fileName);
		    	pstmt.setString(12,bookId);
		    	pstmt.executeUpdate();
		    	} else {
			    	sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, "
				    		+ "b_category=?, b_unitsInStock=?, b_totalPages=?, b_releaseDate=?, b_condition=? WHERE b_id=?";
			    	
			    	//out.print(sql+bookId+name);
			    	pstmt = conn.prepareStatement(sql);
			    	
			    	pstmt.setString(1,name);
			    	pstmt.setInt(2,price);
			    	pstmt.setString(3,autor);
			    	pstmt.setString(4,description);
			    	pstmt.setString(5,publisher);
			    	pstmt.setString(6,category);
			    	pstmt.setLong(7,stock);
			    	pstmt.setLong(8,tPage);
			    	pstmt.setString(9,releaseDate);
			    	pstmt.setString(10,condition);
			    
			    	pstmt.setString(11,bookId);
			    	pstmt.executeUpdate();
		    	}
    	}

        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
        
        response.sendRedirect("editBook.jsp?edit=update");

 %>
    	