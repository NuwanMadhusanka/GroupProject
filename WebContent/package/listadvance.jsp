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
	<title>Package Details</title>
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
	    					<caption>Package Details</caption>
	    						<%
	    						String pacId=request.getParameter("id");
	    									
	    						Connection con=DB.getConnection();
	    						String sql="SELECT * FROM package,vehicle_category WHERE package.cat_id=vehicle_category.cat_id "+
	    								   "AND package.pac_id=?";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,pacId);
	    					
	    						ResultSet rs=ps.executeQuery();
	    						if(rs.next()){
	    							
	    							String title=rs.getString("title");
	    							String category=rs.getString("category");
	    							String price=rs.getString("price");
	    							String url=rs.getString("url");
	    							String manualLes=rs.getString("manual_les");
	    							String autoLes=rs.getString("auto_les");
	    							String description=rs.getString("description");
	    							
		    						%>
		    						<tr>
		    							<th>Title:</th>
		    							<td><%=title %></td>
		    						</tr>
		    						<tr>
		    							<th>Vehicle Category:</th>
		    							<td><%=category %></td>
		    						</tr>
		    						<tr>
		    							<th>Price:</th>
		    							<td><%=price%></td>
		    						</tr>
		    						<tr>
		    							<th>Manual Lesson:</th>
		    							<td><%=manualLes %></td>
		    						</tr>
		    						<tr>
		    							<th>Auto Lesson:</th>
		    							<td><%=autoLes%></td>
		    						</tr>
		    						<tr>
		    							<th>Url:</th>
		    							<td><%=url%></td>
		    						</tr>
		    						<tr>
		    							<th>Description:</th>
		    							<td><%=description%></td>
		    						</tr>
		    						
	    						<%} %>
	    				</table>
	    				
	    				<a href="<%=UrlHelper.base_url() %>package/edit.jsp?id=<%=pacId %>" class="btn btn-default">Edit</a>
	    				
	    			</div>
	    			
	    			
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>