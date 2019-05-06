<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Vehicle-Add</title>
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
		    			<h3>Add New Vehicle</h3>
		    			
		    		</div>
	    		
	    			<form action="../vehicle_add_action" method="post">
					  <div class="form-group">
					    <label for="usr">Brand:</label>
					    <input type="text" class="form-control" name="brand">
					  </div>
					  <div class="form-group">
					    <label for="num">Model:</label>
					    <input type="text" class="form-control" name="model">
					  </div>
					   <div class="form-group">
					    <label for="num">Number:</label>
					    <input type="text" class="form-control" name="number">
					  </div>
					   <div class="form-group">
					    <label for="num">Fuel Type:</label>
					    <input type="text" class="form-control" name="fueltype">
					  </div>
					  <div class="form-group">
					  	<label>Transmission</label>
					  	<select name="transmission" id="soflow-color">
					  		<option value="0">Vehicle Transmission</option>
					  		<option value="1">Manual</option>
					  		<option value="2">Auto</option>
					  	</select>
					  </div>
					  <div class="form-group">
					  	<label>Category</label>
					  	<select name="category" id="soflow-color">
					  		<option value="0">Select Category</option>
					  		<%
					  		Connection con=DB.getConnection();
					  		String sql="SELECT * FROM vehicle_category";
					  		Statement st=con.createStatement();
					  		ResultSet rs=st.executeQuery(sql);
					  		while(rs.next()){
					  			String id=rs.getString("cat_id");
					  			String category=rs.getString("category");
					  		%>
					  		<option value="<%=id%>"><%=category %></option>
					  		<%} %>
					  	</select>
					  </div>
					  
					  <div class="form-group">
					    <label for="num">Licence(document):</label>
					    <input type="file" class="form-control" name="url">
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
