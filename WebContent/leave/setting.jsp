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
	<title>Leaves Setting</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/list.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/leave_setting_validate.js"></script>
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
	    				<h3 id="leave">Leave Setting</h3>
	    				<h5>Add number of leaves per year.Please insert no payment when overdue the number of leaves.</h5>
	    				
	    				<form action="../leave_setting_action" method="post" name="myForm" onsubmit="return validateFrom()">
						  <div class="form-group">
						    <label for="usr">Number Of Leaves(per year):</label>
						    <input type="text" class="form-control" name="numLeave">
						  </div>
						  <div class="form-group">
						    <label for="usr">No pay(Rs.):</label>
						    <input type="text" class="form-control" name="nopay">
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