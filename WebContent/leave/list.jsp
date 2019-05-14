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
	<title>Leaves Details</title>
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
	    				<h3 id="leave">Leave Details</h3>
	    				<nav class="navbar navbar-default">
	    					
	    					<div class="row">
	    						<div class="col-md-9">
	    							<form class="navbar-form navbar-left" action="/action_page.php">
	    					
			    					  <label for="sel1">Month:</label>
									  <select class="form-control" id="sel1">
									    <option>Select Month</option>
									    <option>January</option>
									    <option>February</option>
									    <option>March</option>
									    <option>April</option>
									    <option>May</option>
									    <option>June</option>
									    <option>July</option>
									    <option>August</option>
									    <option>September</option>
									    <option>October</option>
									    <option>November</option>
									    <option>December</option>
									  </select>
			    					
									  <div class="input-group">
									    <input type="text" class="form-control" placeholder="search" id="tableInput">
									    <div class="input-group-btn">
									      <button class="btn btn-default" type="submit">
									        <i class="glyphicon glyphicon-search"></i>
									      </button>
									    </div>
									  </div>
									</form> 
	    						</div>
	    						
	    						<div class="col-md-3">
	    							<%
	    							String role=session.getAttribute("role").toString();//Current login user role
	    							if(role.equals("1")){
	    							%>
	    								<a href="<%=UrlHelper.base_url() %>staff/list.jsp" class="btn btn-warning" id="leavebutton">Record Leave</a>
	    							<%}
	    							if(role.equals("3")){
	    							%>
	    								<a href="<%=UrlHelper.base_url() %>instructor/list.jsp" class="btn btn-warning" id="leavebutton">Record Leave</a>
	    							<%} %>
	    						</div>
	    					</div>
	    					
	    				</nav>
	    				
	    				<table class="table">
	    					<thead>
	    					<tr>
	    						<th>Date:</th>
	    						<th>Name:</th>
	    						<th>Reason</th>
	    					</tr>
	    					</thead>
	    					<tbody id="searchTable">
	    					<%
	    					
	    					Connection con=DB.getConnection();
	    					String sql="";
	    					if(role.equals("1")){
	    						sql="SELECT `leave`.reason,`leave`.date,`staff`.name FROM `leave`,`staff`,`user` WHERE "+
	    							"`leave`.emp_id=`staff`.emp_id AND `leave`.emp_id=`user`.emp_id AND (`user`.role=2 OR `user`.role=3) AND user.status=1";
	    					}
	    					if(role.equals("3")){
	    						sql="SELECT `leave`.reason,`leave`.date,`staff`.name FROM `leave`,`staff`,`user` WHERE "+
		    						"`leave`.emp_id=`staff`.emp_id AND `leave`.emp_id=`user`.emp_id AND `user`.role=4 AND user.status=1";
	    					}
	    					Statement st=con.createStatement();
	    					ResultSet rs=st.executeQuery(sql);
	    					while(rs.next()){
	    						String name=rs.getString("name");
	    						String reason=rs.getString("reason");
	    						String date=rs.getString("date");
	    					
	    					%>
	    					<tr>
	    						<td><%=date %></td>
	    						<td><%=name %></td>
	    						<td><%=reason %></td>
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