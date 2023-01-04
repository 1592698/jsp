<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	Commons-FileUpload를 이용하여 파일 업로드 및 정보 출력하기.
	Commons-FileUpload 패키지를 사용하도록 page 디렉티브 태그의 import 속성 값에
	패키지 org.pache.commos.fileupload.*를 작성 --%>
	<%
	request.setCharacterEncoding("utf-8");
	//폼 페이지에서 전송된 파일을 저장할 서버의 경로를 작성
	String path = "C:\\upload";
	
	//파일 업로드를 위해 DiskFileUpload클래스를 생성
	DiskFileUpload upload = new DiskFileUpload();
	
	//업로드할 파일의 최대크기, 메모리상에 저장할 최대 크기, 업로드된 파일을 임시로 저장할 경로를 작성
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(4096);
	upload.setRepositoryPath(path);
	
	//폼 페이지에서 전송된 요청 파라미터를 전달받도록 DiskFileUpload 객체 타입의 parseRequest() 메서드를 작성
	List items = upload.parseRequest(request);
	
	//폼 페이지에서 전송된 요청 파라미터를 Iterator 클래스로 변환
	Iterator params = items.iterator();
	
	while(params.hasNext()){
		//폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록 Iterator 객체 타입의 hasNext() 메서드를 작성
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()){
			//폼 페이지에서 전송된 요청 파라미터가 일반 데이터이면 요청 파라미터의 이름과 값을 출력
			String name = item.getFieldName();
			String value = item.getString("utf-8");
			out.println(name + "=" + value + "<br>");
		}
		else {
			//폼 페이지에서 전송된 요청 파라미터가 파일이면
			//요청 파라미터의 이름 , 저장 파일의 이름, 파일 컨텐츠 유형, 파일 크기에 대한 정보를 출력
			String fileFieldName = item.getFieldName();
			String fileName = item.getName();
			String contentType = item.getContentType();
			
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			long fileSize = item.getSize();
			
			File file = new File(path + "/" + fileName);
			item.write(file);
			
			out.println("---------------------------<br>");
			out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
			out.println("저장 파일 이름 : " + fileName + "<br>");
			out.println("파일 콘텐츠 타임 : " + contentType + "<br>");
			out.println("파일 크기 : " + fileSize);
		}
	}
	%>
</body>
</html>