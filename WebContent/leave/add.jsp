<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="../WEB-INF/templates/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Leave</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/list.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/leave_validate.js"></script>
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
	    					<%
	    					int count=0;
	    					String userId=request.getParameter("id");
	    					Connection con=DB.getConnection();
	    					String sql="SELECT lea_id FROM `leave`,`user` WHERE "+
	    								"`leave`.emp_id=`user`.emp_id AND user.id=?";
	    					PreparedStatement ps=con.prepareStatement(sql);
	    					ps.setString(1,userId);
	    					ResultSet rs=ps.executeQuery();
	    					while(rs.next()){
	    						count++;
	    					}
	    					
	    					int totalLeave=0;
	    					sql="SELECT * FROM leave_setting";
	    					ps=con.prepareStatement(sql);
	    					rs=ps.executeQuery();
	    					if(rs.next()){
	    						totalLeave=Integer.parseInt(rs.getString("num_leave"));
	    					}
	    					int avlLeave=totalLeave-count;
	    					%>
	    					
	    					<tr>
	    						<th>Total Leaves(Already get):</th>
	    						<td><%=count %></td>
	    					</tr>
	    					<tr>
	    						<th>Remain Leave:</th>
	    						<td><%=avlLeave %></td>
	    					</tr>
	    				</table>
	    				
	    				<h3  style="color:blue;">Add New Leave</h3>
	    				<form action="../staff_leave_add_action" method="post" name="myForm" onsubmit="return validateFrom()">
						  <div class="form-group">
							  <label for="qul">Reason:</label>
							  <textarea class="form-control" rows="5" name="reason" ></textarea>
						  </div>
						  <div class="form-group">
						    <input type="hidden" class="form-control"  name="userId" value="<%=userId%>">
						  </div>
						  <button type="submit" class="btn btn-warning">Submit</button>
						</form>
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>