<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Time Slot</title>
    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/register.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/timeslot_validate.js"></script>
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
		    			<h3>Time Slot</h3>
		    			
		    		</div>
	    		
	    			<form action="../time_slot_add_action" method="post" name="myForm" onsubmit="return validateFrom()">
					  <div class="form-group">
					    <label for="usr">Start Time:</label>
					    <input type="time" name="sTime" />
					  </div>
					   <div class="form-group">
					    <label for="usr">Finish Time:</label>
					    <input type="time" name="fTime" />
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
