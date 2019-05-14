<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String insId=request.getParameter("insId");
	Connection con=DB.getConnection();
	String sql="SELECT brand,model,category,number FROM vehicle,vehicle_category WHERE vehicle.cat_id=vehicle_category.cat_id AND ins_id=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,insId);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		String brand=rs.getString("brand");
		String model=rs.getString("model");
		String category=rs.getString("category");
		String number=rs.getString("number");
%>
	<span class='label label-warning'>vehicle Category:<%=category %></span>
	<span class='label label-warning'>Vehicle:<%=brand+" "+model %></span>
	<span class='label label-warning'>Vehicle Number:<%=number %></span>
<%} %>

						  	
						  	
						  
	