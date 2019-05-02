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
	    			
	    				<table class="table">
	    					<caption>Private Details</caption>
	    						<%
	    						String id=request.getParameter("id");
	    						String roleNum="";
	    						
	    						Connection con=DB.getConnection();
	    						String sql="SELECT * FROM staff,user,instructor WHERE staff.emp_id=user.emp_id  AND instructor.emp_id=user.emp_id AND user.id=?";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,id);
	    					
	    						ResultSet rs=ps.executeQuery();
	    						if(rs.next()){
	    							String empId=rs.getString("emp_id");
	    							String name=rs.getString("name");
	    							String nic=rs.getString("nic");
	    							String address=rs.getString("address");
	    							String tel=rs.getString("tel");
	    							String email=rs.getString("email");
	    							String password="*********";
	    							String lic=rs.getString("licence");
	    							
	    						
		    						%>
		    						<tr>
		    							<th>Name:</th>
		    							<td><%=name %></td>
		    						</tr>
		    						<tr>
		    							<th>NIC:</th>
		    							<td><%=nic%></td>
		    						</tr>
		    						<tr>
		    							<th>Address:</th>
		    							<td><%=address %></td>
		    						</tr>
		    						<tr>
		    							<th>Tel:</th>
		    							<td><%=tel%></td>
		    						</tr>
		    						<tr>
		    							<th>Email:</th>
		    							<td><%=email %></td>
		    						</tr>
		    						<tr>
		    							<th>Password</th>
		    							<td><%=password%></td>
		    						</tr>
		    						<tr>
		    							
		    							<th>Licence:</th>
		    							<td><%=lic %></td>
		    							
		    						</tr>
		    						
	    						<%} %>
	    				</table>
	    				<%
	    				String role=session.getAttribute("role").toString();
	    				if(role.equals("3")){%>
	    					<a href="<%=UrlHelper.base_url() %>instructor/edit.jsp?id=<%=id %>" class="btn btn-default">Edit</a>
	    				<%} %>
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>