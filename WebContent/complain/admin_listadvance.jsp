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
	    						String sql="SELECT complain.complain,complain.cmp_id,complain.title,complain.date,staff.name,user.role "+
	    									"FROM complain,staff,user "+
	    									"WHERE complain.emp_id=staff.emp_id AND complain.emp_id=user.emp_id AND  cmp_id=? "+
	    									"ORDER BY date,cmp_id  DESC";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,cmpId);
	    						ResultSet rs=ps.executeQuery();
	    						while(rs.next()){
	    							String pacId=rs.getString("cmp_id");
	    							String title=rs.getString("title");
	    							String complain=rs.getString("complain");
	    							String date=rs.getString("date");
	    							String name=rs.getString("name");
	    							String role=rs.getString("role");
	    							
	    							if(role.equals("2")){
	    								role="AS-Student";
	    							}else if(role.equals("3")){
	    								role="AS-Instructor";
	    							}else{
	    								role="Instructor";
	    							}
	    						%>
	    						<table class="table">
	    							<caption>Complain Details</caption>
	    								<tr>
	    									<th>Title:</th>
	    									<td><%=title %></td>
	    								</tr>
	    								<tr>
	    									<th>EmployeeName:</th>
	    									<td><%=name %></td>
	    								</tr>
	    								<tr>
	    									<th>Role:</th>
	    									<td><%=role %></td>
	    								</tr>
	    								<tr>
	    									<th>Date:</th>
	    									<td><%=date %></td>
	    								</tr>
	    								<tr>
	    									<th>Complain:</th>
	    									<td><%=complain %></td>
	    								</tr>
	    						<%}%>
	    				</table>
	    				<%
	    				sql="UPDATE complain SET view=? WHERE cmp_id=?";
	    				ps=con.prepareStatement(sql);
	    				ps.setString(1,"1");
	    				ps.setString(2,cmpId);
	    				ps.execute();
	    				%>
	    				 <form action="../complainreply_add_action" method="post" name="myForm" onsubmit="return validateFrom()">
	    				   <label>Reply:</label>
		    			   <div class="form-group">
						  	<textarea class="form-control" rows="8" name="reply"></textarea>
					  	   </div>
					  	   <div class="form-group">
						    <input type="hidden" class="form-control"  name="cmpId" value="<%=cmpId%>">
						  </div>
					
						  <button type="submit" class="btn btn-default">Submit</button>
						</form>
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>