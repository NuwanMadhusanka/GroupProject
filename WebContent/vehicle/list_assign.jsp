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
	<title>Vehicle-Instructor(Assign)</title>
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
	    					<caption>Assign Details(Vehicle-Instructor)</caption>
	    					<tr>
	    						<th>Vehicle</th>
	    						<th>Category</th>
	    						<th>vehNum</th>
	    						<th>Status</th>
	    						<th>Option</th>
	    					</tr>
	    					
	    						<%
	    						Connection con=DB.getConnection();
	    						String sql="SELECT veh_id,brand,category,number,model,ins_id FROM vehicle,vehicle_category "+
	    									"WHERE vehicle.cat_id=vehicle_category.cat_id";
	    						Statement st=con.createStatement();
	    						ResultSet rs=st.executeQuery(sql);
	    						while(rs.next()){
	    							String id=rs.getString("veh_id");
	    							String brand=rs.getString("brand");
	    							String model=rs.getString("model");
	    							String category=rs.getString("category");	
	    							String insId=rs.getString("ins_id");
	    							String number=rs.getString("number");
	    						%>
	    						<tr>
	    							<td><%=brand+"  "+model %></td>
	    							<td><%=category %></td>
	    							<td><%=number %></td>
	    							<td>
		    							<%
		    							if(insId!=null){
		    								out.println("<span class='label label-success'>Assign</span>");
		    							}else{
		    								out.println("<span class='label label-danger'>Not Assign</span>");
		    							}
		    							%>		
	    							</td>
	    							
	    							<td>
	    								<a href="<%=UrlHelper.base_url() %>vehicle/edit_assign.jsp?id=<%=id %>" class="btn btn-info"><i class="fas fa-eye" title="Advanced"></i></a>
	    							</td>
	    							
	    						</tr>
	    						<%} %>
	    				</table>
	    			
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>