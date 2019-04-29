<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">
	
<head>
    <title>Main</title>
    <!-- Head part -->
	<%@ include file="WEB-INF/templates/head.jsp" %>
	<%@ include file="WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="css/common.css">
</head>

<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">

     <!-- SlideBar Part-->
     <%@ include file="WEB-INF/templates/slidebar.jsp" %>
      
    </div>
	
	
    <div class="col-sm-10">
    	
    	<!-- First Row -->
    	<div class="row">
    		
    		<!-- NavBar Part -->
    		<%@ include file="WEB-INF/templates/navbar.jsp" %>
    		
    	</div>
    	
    	<!-- Show message  -->
    	<%@ include file="../WEB-INF/templates/msg.jsp" %>
    	
    	<!-- Second Row -->
    	<div class="row">
    		<h1>Hello</h1>
    	</div>
    	
    </div>
  </div>
</div>



</body>
</html>
