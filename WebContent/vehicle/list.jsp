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
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/search.js"></script>
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
	    			
	    				<nav class="navbar navbar-default">
	    					
	    					<form class="navbar-form navbar-left" action="/action_page.php">
			    					
								<div class="input-group">
									<input type="text" class="form-control" placeholder="search" id="tableInput">
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit">
											   <i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form> 
	    				</nav>
	    			
	    				<table class="table">
	    					<caption>Vehicle Details</caption>
	    					<thead>
	    					<tr>
	    						<th>Brand</th>
	    						<th>Model</th>
	    						<th>category</th>
	    						<th>Number</th>
	    						<th>Option</th>
	    					</tr>
	    					</thead>
	    					
	    					<tbody id="searchTable">
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
	    							String number=rs.getString("number");
	    							String category=rs.getString("category");
	    							String insId=rs.getString("ins_id");
	    							
	    							int isInsId=0;//check instructor id null or not
	    							if(insId!=null){
	    								isInsId=1;
	    							}
	    						%>
	    						<tr>
	    							<td><%=brand %></td>
	    							<td><%=model %></td>
	    							<td><%=category %></td>
	    							<td><%=number %></td>
	    							<td>
	    								<a href="<%=UrlHelper.base_url() %>vehicle/listadvance.jsp?id=<%=id%>&isInsId=<%=isInsId %>" class="btn btn-info"><i class="fas fa-eye" title="Advanced"></i></a>
	    								<a href="<%=UrlHelper.base_url() %>vehicle_delete_action?id=<%=id %>" class="btn btn-danger"><i class="fas fa-trash" title="Delete"></i></a>
	    							</td>
	    						</tr>
	    						<%} %>
	    						</tbody>
	    				</table>
	    			
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>