<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>

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
    			<form action="/action_page.php">
				  <div class="form-group">
				    <label for="usr">Name:</label>
				    <input type="text" class="form-control" name="name">
				  </div>
				  <div class="form-group">
				    <label for="num">NIC:</label>
				    <input type="text" class="form-control" name="nic">
				  </div>
				  <div class="form-group">
				    <label for="num">TEL:</label>
				    <input type="text" class="form-control" name="tel">
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
				    <input type="password" class="form-control" name="pwd">
				  </div>
				   <div class="form-group">
				    <label for="ed">Exam Date:</label>
				    <input type="date" class="form-control" name="examdate">
				  </div>
				  <div class="form-group">
				    <label for="td">Trial Date:</label>
				    <input type="date" class="form-control" name="trialdate">
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
