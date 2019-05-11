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
	<title>Instructor Details</title>
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
	    					<caption>Instructor Details</caption>
	    					<tr>
	    						<th>Name</th>
	    						<th>Status</th>
	    						<th>Option</th>
	    					</tr>
	    					
	    						<%
	    						Connection con=DB.getConnection();
	    						String sql="SELECT user.id,user.status,staff.name FROM staff,user WHERE staff.emp_id=user.emp_id AND role=4";
	    						Statement st=con.createStatement();
	    						ResultSet rs=st.executeQuery(sql);
	    						while(rs.next()){
	    							String id=rs.getString("id");
	    							String name=rs.getString("name");
	    							String status=rs.getString("status");
	    							
	    						%>
	    						<tr>
	    						<td><%=name %></td>
	    	
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
									<a href="<%=UrlHelper.base_url() %>leave/add.jsp?id=<%=id %>" class="btn btn-warning"  title="Record Leave"><i class="fas fa-marker"></i></a>					
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