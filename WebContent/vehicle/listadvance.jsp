<%@page import="org.apache.jasper.tagplugins.jstl.core.Url"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Vehicle Details</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/list.css">
</head>
<body>
	<div class="container-fluid">
	  <div class="row content">
	    <div class="col-sm-2 sidenav">
	
	     <!-- SlideBar Part-->
	     <%@ include file="../WEB-INF/templates/slidebar.jsp" %>
	      
	    </div>
		
		
	    <div class="col-sm-10 ">
	    	
	    	<!-- First Row -->
	    	<div class="row">
	    		
	    		<!-- NavBar Part -->
	    		<%@ include file="../WEB-INF/templates/navbar.jsp" %>
	    		
	    	</div>
	    	
	    	
	    	
	    	<!-- Second Row -->
	    	<div class="row" id="content">
	    		
	    		
	    		<!-- Show message  -->
	    		<%@ include file="../WEB-INF/templates/msg.jsp" %>
	    		
	    		<div class="container">
	    			<div class="jumbotron">
	    			
	    				<table class="table">
	    					<caption>Vehicle Details</caption>
	    						<%
	    						String vehId=request.getParameter("id");
	    									
	    						Connection con=DB.getConnection();
	    						String sql="SELECT brand,model,number,category,transmission,fuel_type,document_lic,name "+
	    								   "FROM vehicle,vehicle_category,instructor,staff  "+
	    								   "WHERE vehicle.cat_id=vehicle_category.cat_id AND  instructor.ins_id=vehicle.ins_id AND  instructor.emp_id=staff.emp_id AND vehicle.veh_id=?";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,vehId);
	    					
	    						ResultSet rs=ps.executeQuery();
	    						if(rs.next()){
	    							
	    							String brand=rs.getString("brand");
	    							String model=rs.getString("model");
	    							String number=rs.getString("number");
	    							String category=rs.getString("category");
	    							String transmission=rs.getString("transmission");
	    							String fuelType=rs.getString("fuel_type");
	    							String lic=rs.getString("document_lic");
	    							String instructor=rs.getString("name");
	    							
	    							if(transmission.equals("1")){
	    								transmission="Manual";
	    							}
	    							if(transmission.equals("2")){
	    								transmission="Auto";
	    							}
	    							
	    							if(lic==null){
	    								lic="Add Licence(Document)";
	    							}
		    						%>
		    						<tr>
		    							<th>Brand:</th>
		    							<td><%=brand %></td>
		    						</tr>
		    						<tr>
		    						<tr>
		    							<th>Model:</th>
		    							<td><%=model %></td>
		    						</tr>
		    						<tr>
		    							<th>Number:</th>
		    							<td><%=number %></td>
		    						</tr>
		    						<tr>
		    							<th>Vehicle Category:</th>
		    							<td><%=category %></td>
		    						</tr>
		    						<tr>
		    							<th>Transmission:</th>
		    							<td><%=transmission%></td>
		    						</tr>
		    						<tr>
		    							<th>Fuel Type:</th>
		    							<td><%=fuelType %></td>
		    						</tr>
		    						<tr>
		    							<th>Licence:</th>
		    							<td><%=lic%></td>
		    						</tr>
		    						<tr>
		    							<th>Assign Instructor:</th>
		    							<td><%=(instructor.equals("")?"Not Assign Instructor":instructor)%></td>
		    						</tr>
	    						<%} %>
	    				</table>
	    				<%
	    				String role=session.getAttribute("role").toString(); 
	    				if(role.equals("3")){
	    				%>
	    				<a href="<%=UrlHelper.base_url() %>vehicle/edit.jsp?id=<%=vehId %>" class="btn btn-default">Edit</a>
	    				<%} %>
	    				
	    			</div>
	    			
	    			
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>