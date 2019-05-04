<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Register</title>
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
		    			<h3>Registration Form</h3>
		    			
		    		</div>
	    		
	    			<form action="../adminstaff_register_action" method="post">
					  <div class="form-group">
					    <label for="usr">Name:</label>
					    <input type="text" class="form-control" name="name" placeholder="Full Name With Initials">
					  </div>
					  <div class="form-group">
					    <label for="num">NIC:</label>
					    <input type="text" class="form-control" name="nic" placeholder="960150429V">
					  </div>
					  <div class="form-group">
					    <label for="num">TEL:</label>
					    <input type="text" class="form-control" name="tel" placeholder="0773015590">
					  </div>
					  <div class="form-group">
					    <label for="add">Address:</label>
					    <input type="text" class="form-control" name="address" placeholder="Address">
					  </div>
					  <div class="form-group">
					    <label for="email">Email:</label>
					    <input type="email" class="form-control" name="email" placeholder="Email">
					  </div>
					  <div class="form-group">
					    <label for="pwd">Password:</label>
					    <input type="password" class="form-control" name="password" placeholder="Password">
					    <h6>At least 8 characters</h6>
					  </div>
					  <div class="form-group">
					  	<label>Type</label>
					  	<select name="type" id="soflow-color">
					  		<option value="0">Select Type</option>
					  		<option value="1">Administrative Staff-Student</option>
					  		<option value="2">Administrative Staff-Instructor</option>
					  	</select>
					  </div>
					  <div class="form-group">
						  <label for="qul">Qualification:</label>
						  <textarea class="form-control" rows="3" name="qualification" placeholder="Qualification"></textarea>
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
