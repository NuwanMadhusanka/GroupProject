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
	<title>Complain Details</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/list.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/complainreply_validate.js"></script>
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
	    			
	    				
	    					
	    						<%
	    						String cmpId=request.getParameter("id");
	    						
	    						Connection con=DB.getConnection();
	    						String sql="SELECT * FROM complain WHERE cmp_id=?";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,cmpId);
	    						ResultSet rs=ps.executeQuery();
	    						while(rs.next()){
	    							String title=rs.getString("title");
	    							String complain=rs.getString("complain");
	    							String date=rs.getString("date");
	    							String reply=rs.getString("reply");
	    							
	    						%>
	    						<table class="table">
	    							<caption>Complain Details</caption>
	    								<tr>
	    									<th>Title:</th>
	    									<td><%=title %></td>
	    								</tr>
	    								<tr>
	    									<th>Date:</th>
	    									<td><%=date %></td>
	    								</tr>
	    								<tr>
	    									<th>Complain:</th>
	    									<td><%=complain %></td>
	    								</tr>
	    								<%if(!reply.equals("0")){ %>
		    								<tr>
		    									<th>Reply:</th>
		    									<td><%=reply %></td>
		    								</tr>
	    								<%} %>
	    						<%}%>
	    				</table>
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>