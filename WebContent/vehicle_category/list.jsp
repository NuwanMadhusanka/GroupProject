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
	<title>Category Details</title>
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
	    					<caption>Vehicle Category Details</caption>
	    					<thead>
	    					<tr>
	    						<th>Category</th>
	    						<%
	    						String role2=session.getAttribute("role").toString();
	    						if(role2.equals("3")){
	    						%>
	    						<th>Option</th>
	    						<%} %>
	    					</tr>
	    					</thead>
	    					
	    					<tbody id="searchTable">
	    						<%
	    						Connection con=DB.getConnection();
	    						String sql="SELECT * FROM vehicle_category";
	    						Statement st=con.createStatement();
	    						ResultSet rs=st.executeQuery(sql);
	    						while(rs.next()){
	    							String id=rs.getString("cat_id");
	    							String category=rs.getString("category");						
	    						%>
	    						<tr>
	    						<td><%=category %></td>
	    						<%
	    						if(role2.equals("3")){
	    						%>
	    						<td>
		    						<a href="<%=UrlHelper.base_url() %>vehicle_category/edit.jsp?id=<%=id %>" class="btn btn-warning"><i class="fas fa-edit" title="Edit"></i></a>
									<a href="<%=UrlHelper.base_url() %>vehiclecategory_delete_action?id=<%=id %>" class="btn btn-danger"><i class="fas fa-trash" title="Delete"></i></a>					
	    						</td>
	    						<%} %>
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