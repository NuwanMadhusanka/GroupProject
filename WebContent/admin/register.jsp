<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Register</title>
    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
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
    		<div id="title">
    			<h3>Registration Form</h3>
    		</div>
    		<div class="boxForm">
    			<form action="../adminstaff_register_action" method="post">
				  <div class="form-group">
				    <label for="usr">Name:</label>
				    <input type="text" class="form-control" name="name">
				  </div>
				  <div class="form-group">
				    <label for="num">NIC:</label>
				    <input type="text" class="form-control" name="nic" placeholder="xxxxxxxxxV">
				  </div>
				  <div class="form-group">
				    <label for="num">TEL:</label>
				    <input type="text" class="form-control" name="tel" placeholder="xxxxxxxxxx">
				  </div>
				  <div class="form-group">
				    <label for="add">Address:</label>
				    <input type="text" class="form-control" name="address">
				  </div>
				  <div class="form-group">
				    <label for="email">Email:</label>
				    <input type="email" class="form-control" name="email">
				  </div>
				  <div class="form-group">
				    <label for="pwd">Password:</label>
				    <input type="password" class="form-control" name="password">
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
					  <textarea class="form-control" rows="3" name="qualification"></textarea>
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
