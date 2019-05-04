<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Vehicle Category-Edit</title>
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
    		
	    		<div class="jumbotron">
	    			<div id="title">
		    			<h3>Edit Vehicle Category</h3>
		    		</div>
	    		
	    			<form action="../vehiclecategory_edit_action" method="post">
	    			  <%
	    			  String id=request.getParameter("id");//id==>Category ID
	    			  Connection con=DB.getConnection();
	    			  String sql="SELECT * FROM vehicle_category WHERE cat_id=?";
	    			  PreparedStatement ps=con.prepareStatement(sql);
	    			  ps.setString(1,id);
	    			  ResultSet rs=ps.executeQuery();
	    			  
	    			  if(rs.next()){
	    				  String category=rs.getString("category");
	    			  %>
	    			   <div class="form-group">
					    <label for="usr">Category ID:</label>
					    <input type="text" class="form-control" name="id" value="<%=id%>">
					  </div>
					  <div class="form-group">
					    <label for="usr">Category:</label>
					    <input type="text" class="form-control" name="category" value="<%=category%>">
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					  <%} %>
					</form>
	    		</div>
	    	</div>
    	</div>
    </div>
  </div>
</div>

</body>
</html>
