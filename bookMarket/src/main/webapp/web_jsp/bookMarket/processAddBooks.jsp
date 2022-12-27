<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookMarket.ver01.dto.Book"%>
<%@ page import="bookMarket.ver01.dao.BookRepository"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
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
    	String fname=(String) files.nextElement();
    	String fileName = multi.getFilesystemName(fname);
    	
    	BookRepository dao = BookRepository.getInstance();
    	
    	Book newBook = new Book();
    	newBook.setBookId(bookId);
    	newBook.setName(name);
    	newBook.setAutor(autor);
    	newBook.setUnitPrice(price);
    	newBook.setDescription(description);
    	newBook.setPublisher(publisher);
    	newBook.setCategory(category);
    	newBook.setUnitsInStock(stock);
    	newBook.setTotalPages(tPage);
    	newBook.setReleaseDate(releaseDate);
    	newBook.setCondition(condition);
    	newBook.setFilename(fileName);
    	
    	dao.addBook(newBook);
    	response.sendRedirect("books.jsp");
    	
 %>
    	