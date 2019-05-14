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
	    					<caption>Complain Details(Not Read)</caption>
	    					<tr>
	    						<th>Title</th>
	    						<th>Option</th>
	    					</tr>
	    					
	    						<%
	    						Connection con=DB.getConnection();
	    						String sql="SELECT complain.cmp_id,complain.title FROM complain,user WHERE complain.emp_id=user.emp_id AND user.status=1 AND view=?  ORDER BY date,cmp_id  DESC ";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,"0");
	    						ResultSet rs=ps.executeQuery();
	    						while(rs.next()){
	    							String cmpId=rs.getString("cmp_id");
	    							String title=rs.getString("title");
	    							
	    							String role=session.getAttribute("role").toString();
	    						%>
	    						<tr>
	    						<td><%=title%></td>
	    						<td>
		    						<%if(role.equals("1")){ %>
										<a href="admin_listadvance.jsp?id=<%=cmpId %>" class="btn btn-info"><i class="fas fa-eye" title="Advanced"></i></a>
										<a href="complain_delete_action?id=<%=cmpId %>" class="btn btn-danger"><i class="fas fa-trash" title="Delete"></i></a>
									<%}%>
	    						</td>
	    						</tr>
	    						<%} %>
	    				</table>
	    				
	    				<table class="table">
	    					<caption>Complain Details(Read-Not Reply)</caption>
	    					<tr>
	    						<th>Title</th>
	    						<th>Option</th>
	    					</tr>
	    					
	    						<%
	    						con=DB.getConnection();
	    						sql="SELECT complain.cmp_id,complain.title FROM complain,user WHERE complain.emp_id=user.emp_id AND user.status=1 AND view=? ORDER BY date,cmp_id  DESC ";
	    						ps=con.prepareStatement(sql);
	    						ps.setString(1,"1");
	    						rs=ps.executeQuery();
	    						while(rs.next()){
	    							String cmpId=rs.getString("cmp_id");
	    							String title=rs.getString("title");
	    							
	    							String role=session.getAttribute("role").toString();
	    						%>
	    						<tr>
	    						<td><%=title%></td>
	    						<td>
		    						<%if(role.equals("1")){ %>
										<a href="admin_listadvance.jsp?id=<%=cmpId %>" class="btn btn-info"><i class="fas fa-eye" title="Advanced"></i></a>
										<a href="<%=UrlHelper.base_url() %>complain_delete_action?id=<%=cmpId %>" class="btn btn-danger"><i class="fas fa-trash" title="Delete"></i></a>
									<%}%>
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