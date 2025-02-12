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
	<title>Time Slot</title>
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
	    					<caption>Time Slot Details(24 hrs)</caption>
	    					<tr>
	    						<th>Start Time</th>
	    						<th>Finish Time</th>
	    						<th>Option</th>
	    					</tr>
	    					
	    						<%
	    						Connection con=DB.getConnection();
	    						String sql="SELECT * FROM time_slot ";
	    						Statement st=con.createStatement();
	    						ResultSet rs=st.executeQuery(sql);
	    						while(rs.next()){
	    							String tId=rs.getString("tim_slot_id");
	    							String sTime=rs.getString("s_time");
	    							String fTime=rs.getString("f_time");
	    							
	    						%>
	    						<tr>
	    						<td><%=sTime%></td>
	    						<td><%=fTime %></td>
	    						<td>
	    							<a href="<%=UrlHelper.base_url() %>time_slot/edit.jsp?id=<%=tId %>" class="btn btn-warning"><i class="fas fa-edit" title="edit"></i></a>
	    							<a href="<%=UrlHelper.base_url() %>time_slot/delete.jsp?id=<%=tId %>" class="btn btn-danger"><i class="fas fa-trash" title="delete"></i></a>
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