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
	<title>Staff Details</title>
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
	    			
	    				<nav class="navbar navbar-default">
	    					
	    					<form class="navbar-form navbar-left" action="/action_page.php">
			    					
								<div class="input-group">
									<input type="text" class="form-control" placeholder="user name">
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit">
											   <i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form> 
	    				</nav>
	    			
	    			
	    				<table class="table">
	    					<caption>Staff Details</caption>
	    					<tr>
	    						<th>Name</th>
	    						<th>Role</th>
	    						<th>Status</th>
	    						<th>Option</th>
	    					</tr>
	    					
	    						<%
	    						Connection con=DB.getConnection();
	    						String sql="SELECT user.id,user.role,user.status,staff.name FROM staff,user WHERE staff.emp_id=user.emp_id ORDER BY user.role ASC";
	    						Statement st=con.createStatement();
	    						ResultSet rs=st.executeQuery(sql);
	    						while(rs.next()){
	    							String id=rs.getString("id");
	    							String name=rs.getString("name");
	    							String role=rs.getString("role");
	    							String status=rs.getString("status");
	    							
	    							if(role.equals("2")){
	    								role="Admin Satff(S)";
	    							}else if(role.equals("3")){
	    								role="Admin Satff(I)";
	    							}else{
	    								role="Instructor";
	    							}
	    							
	    						%>
	    						<tr>
	    						<td><%=name %></td>
	    						<td><%=role %></td>
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
		    						<a href="listadvance.jsp?id=<%=id %>" class="btn btn-info"><i class="fas fa-eye" title="Advanced"></i></a>
									<%
									if(status.equals("1")){
										out.println("<a href='../user_blcklist_action?id="+id+"' class='btn btn-danger' title='BlackList' ><i class='fas fa-window-close'></i></a>");
									}else{
										out.println("<a href='../user_active_action?id="+id+"' class='btn btn-success' title='Membership'><i class='fas fa-check'></i></a>");
									}
									%>
									<%if(!role.equals("Instructor")){ %>
										<a href="<%=UrlHelper.base_url() %>leave/add.jsp?id=<%=id %>" class="btn btn-warning"  title="Record Leave"><i class="fas fa-marker"></i></a>
									<%} %>					
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