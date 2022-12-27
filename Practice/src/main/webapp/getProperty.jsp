<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	getProperty 액션태그에 자바빈즈 Person으로 아이디와 이름을 설정하여 출력하기
	1) 자바빈즈로 Person 클래스를 사용하도록 useBean 액션 태그를 작성
	2) useBean 액션 태그의 id 속성 값을 통해 자바빈즈 Person의 프로퍼티 id와 name에 값을 저장하도록
	setProperty 액션 태그를 작성
	3) useBean 액션 태그의 id 속성 값을 통해 자바빈즈 Person의 프로퍼티 id와 name에 값을 가져와
	출력하도록 getProperty 액션 태그를 작성--%>
	
	<jsp:useBean id="person" class="user.Person"/>
	<jsp:setProperty name="person" property="id" value="20000314"/>
	<jsp:setProperty name="person" property="name" value="박지훈" />
	<p> 아 이 디 : <jsp:getProperty property="id" name="person"/>
	<p> 이 름 : <jsp:getProperty property="name" name="person"/>
</body>
</html>