<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<%
	request.setAttribute("pageUser", null);
	session.setAttribute("pageUser", null);
	request.getRequestDispatcher("/login.do").forward(request, response);
%>