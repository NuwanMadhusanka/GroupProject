<%@page import="com.gp.service.UrlHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
		Object role=session.getAttribute("ROLE");
		if(role!=null && role.toString().equals("2")){
			//
		}else{
			response.sendRedirect(UrlHelper.base_url()+"login.jsp");
		}
%>