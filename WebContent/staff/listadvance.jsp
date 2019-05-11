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
	    						String sql="SELECT * FROM staff,user WHERE staff.emp_id=user.emp_id AND user.id=? ";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,id);
	    					
	    						ResultSet rs=ps.executeQuery();
	    						if(rs.next()){
	    							String empId=rs.getString("emp_id");
	    							String name=rs.getString("name");
	    							roleNum=rs.getString("role");
	    							String nic=rs.getString("nic");
	    							String address=rs.getString("address");
	    							String tel=rs.getString("tel");
	    							String email=rs.getString("email");
	    							String password="*********";
	    							
	    							String qul="";
	    							String lic="";
	    							String role="";
	    							
	    							sql="SELECT * FROM administrative_staff WHERE emp_id=?";//If admin staff member
	    							if(roleNum.equals("2")){
	    								role="Admin Satff Employee(S)";
	    							}else if(roleNum.equals("3")){
	    								role="Admin Satff Employee(I)";
	    							}else{
	    								role="Instructor";
	    								sql="SELECT * FROM instructor WHERE emp_id=?";//If Instructor
	    							}
	    							
	    							ps=con.prepareStatement(sql);
	    							ps.setString(1,empId);
	    							ResultSet rs1=ps.executeQuery();
	    							while(rs1.next()){
	    								if(roleNum.equals("4")){
	    									lic=rs1.getString("licence");
	    								}else{
	    									qul=rs1.getString("qualification");
	    								}
	    							}
	    						
		    						%>
		    						<tr>
		    							<th>Name:</th>
		    							<td><%=name %></td>
		    						</tr>
		    						<tr>
		    							<th>Role:</th>
		    							<td><%=role%></td>
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
		    							<%if(roleNum.equals("4")){ %>
		    							<th>Licence:</th>
		    							<td><%=lic %></td>
		    							<%}else{ %>
		    							<th>Qualification:</th>
		    							<td><%=qul %></td>
		    							<%} %>
		    						</tr>
		    						
	    						<%} %>
	    				</table>
	    				<%if(!roleNum.equals("4")){ %>
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