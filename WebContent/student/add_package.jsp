<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
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
	
	
    <div class="col-sm-10">
    	
    	<!-- First Row -->
    	<div class="row">
    		
    		<!-- NavBar Part -->
    		<%@ include file="../WEB-INF/templates/navbar.jsp" %>
    		
    	</div>
    	
    	<!-- Second Row -->
    	<div class="row" id="content">
    		
    		<!-- Message -->
    		<%@ include file="../WEB-INF/templates/msg.jsp" %>
    		
    		<div class="jumbotron">
    			<div id="title">
	    			<h3>Add Package Details</h3>
	    		</div>
    		
    			<form action="../student_package_add_action" method="post">
				  
				   <div class="form-group">
					  	<label>Package</label>
					  	<select name="category" id="soflow-color">
					  		<option value="0">Select Package</option>
					  		<%
					  		Connection con=DB.getConnection();
					  		String sql="SELECT pac_id,title FROM package";
					  		Statement st=con.createStatement();
					  		ResultSet rs=st.executeQuery(sql);
					  		while(rs.next()){
					  			String pacId=rs.getString("pac_id");
					  			String title=rs.getString("title");
					  		%>
					  		<option value="<%=pacId%>"><%=title %></option>
					  		<%} %>
					  	</select>
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
