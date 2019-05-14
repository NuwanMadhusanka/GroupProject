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
	<title>Package Details</title>
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
	    					<caption>Package Details</caption>
	    					<thead>
	    					<tr class="info">
	    						<th>Title</th>
	    						<th>Vehicle Type</th>
	    						<th>Status</th>
	    						<th>Option</th>
	    					</tr>
	    					</thead>
	    					
	    					<tbody id="searchTable">
	    						<%
	    						Connection con=DB.getConnection();
	    						String sql="SELECT pac_id,title,category,status FROM package,vehicle_category WHERE package.cat_id=vehicle_category.cat_id";
	    						Statement st=con.createStatement();
	    						ResultSet rs=st.executeQuery(sql);
	    						while(rs.next()){
	    							String pacId=rs.getString("pac_id");
	    							String title=rs.getString("title");
	    							String category=rs.getString("category");
	    							String status=rs.getString("status");
	    							
	    						%>
	    						<tr>
	    						<td><%=title %></td>
	    						<td><%=category %></td>
	    						<td>
		    						<%
									if(status.equals("1")){
										out.println("<span class='label label-success'>Active</span>");
									}else{
										out.println("<span class='label label-danger'>BackList</span>");
									}
									%>
	    						</td>
	    						<td>
		    						<a href="listadvance.jsp?id=<%=pacId %>" class="btn btn-info"><i class="fas fa-eye" title="Advanced"></i></a>
									<%
									if(status.equals("1")){
										out.println("<a href='../package_blacklist_action?id="+pacId+"' class='btn btn-danger' title='BlackList' ><i class='fas fa-window-close'></i></a>");
									}else{
										out.println("<a href='../package_active_action?id="+pacId+"' class='btn btn-success' title='Active Package'><i class='fas fa-check'></i></a>");
									}
									%>	
									<a href="../package_delete_action?id=<%=pacId %>" class="btn btn-danger"><i class="fas fa-trash"></i></a>				
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