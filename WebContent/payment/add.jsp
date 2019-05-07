<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="WEB-INF/templates/error.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Payment-ADD</title>
    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/register.css">
</head>

<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">

     <!-- SlideBar Part-->
     <%@ include file="../WEB-INF/templates/slidebar.jsp" %>
      
    </div>
	
	
    <div class="col-sm-10">
    	
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
	    					<caption></caption>
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
	    						</td>
	    						</tr>
	    						<%} %>
	    				</table>
	    			
	    			</div>
	    		</div>
    		
    		<div class="boxForm">
    			<div id="title">
	    			<h3>Add Payment</h3>
	    		</div>
    			
    			<form action="../payment_add_action" method="post">
				  <div class="form-group">
				    <label for="usr">Name:</label>
				    <input type="text" class="form-control" name="name">
				  </div> 
				  <button type="submit" class="btn btn-default">Submit</button>
				</form>
    		</div>
    	</div>
    	
    </div>
  </div>
</div>

</body>
</html>