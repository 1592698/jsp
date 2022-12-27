<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="market.ver01.dto.Product"%>
<%@ page import="market.ver01.dao.ProductRepository"%>
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
    
    	String productId = multi.getParameter("productId");
    	String name = multi.getParameter("name");
    	String unitPrice = multi.getParameter("unitPrice");
    	String description = multi.getParameter("description");
    	String manufacturer = multi.getParameter("manufacturer");
    	String category = multi.getParameter("category");
    	String unitsInStock = multi.getParameter("unitsInStock");
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
    	
    	
    	Enumeration files = multi.getFileNames();
    	String fname=(String) files.nextElement();
    	String fileName = multi.getFilesystemName(fname);
    	
    	
    	ProductRepository dao = ProductRepository.getInstance();
    	
    	Product newProduct = new Product();
    	newProduct.setProductId(productId);
    	newProduct.setPname(name);
    	newProduct.setUnitPrice(price);
    	newProduct.setDescription(description);
    	newProduct.setManufacturer(manufacturer);
    	newProduct.setCategory(category);
    	newProduct.setUnitsInStock(stock);
    	newProduct.setCondition(condition);
    	newProduct.setFilename(fileName);
    	
    	dao.addProduct(newProduct);
    	response.sendRedirect("products.jsp");
    	
 %>
    	