<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Package -ADD</title>
    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/register.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/package.js"></script>
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
		    			<h3>Insert Package Details</h3>
		    			
		    		</div>
	    		
	    			<form action="../package_add_action" method="post">
					  <div class="form-group">
					    <label for="usr">Title:</label>
					    <input type="text" class="form-control" name="title" >
					  </div>
					  
					  <div class="form-group">
						  <label for="sel1">Vehicle Category:</label>
						  <select class="form-control" id="sel1" name="category">
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
						
					  <label>Number of Lessons:</label>
					  <div id="oneLine">
						  <div class="checkbox">
							  <label><input type="checkbox" value="1" onclick="activeManual()" name="checkManual">Manual</label>
						  </div>
						  <div class="form-group">
						    <label for="num">Manual:</label>
						    <input type="text" class="form-control" name="manual" readonly="readonly" id="manual">
						  </div>
					  </div>
					  
					  <div id="oneLine">
						  <div class="checkbox">
							  <label><input type="checkbox" value="2" onclick="activeAuto()" name="checkAuto">Auto</label>
						  </div>
						  <div class="form-group">
						    <label for="num">Auto:</label>
						    <input type="text" class="form-control" name="auto" readonly="readonly" id="auto">
						  </div>
					  </div>
					
					  <div class="form-group">
					    <label for="num">Price(RS):</label>
					    <input type="text" class="form-control" name="price">
					  </div>
					  
					  <div class="form-group">
					    <label for="num">Image:</label>
					    <input type="file" class="form-control" name="url">
					  </div>
					 
					  <div class="form-group">
						  <label for="qul">Description:</label>
						  <textarea class="form-control" rows="3" name="description"></textarea>
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
