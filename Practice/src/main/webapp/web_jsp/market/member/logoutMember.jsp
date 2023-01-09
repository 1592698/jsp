<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	session.removeAttribute("sessionId");
	session.removeAttribute("sessionName");

	response.sendRedirect("../index.jsp");
%>