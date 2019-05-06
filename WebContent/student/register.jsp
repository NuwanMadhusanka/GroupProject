<%@page import="java.sql.PreparedStatement"%>
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
	    			<h3>Registration Form</h3>
	    		</div>
    		
    			<form action="../student_register_action" method="post">
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
				    <input type="password" class="form-control" name="password">
				  </div>
				  
				  <label>Packages:</label>
				  <%
				  Connection con=DB.getConnection();
				  String sql="SELECT pac_id,title FROM package";
				  Statement st=con.createStatement();
				  ResultSet rs=st.executeQuery(sql);
				  int count=0;
				  while(rs.next()){
					  String pacId=rs.getString("pac_id");
					  String title=rs.getString("title");
					  count++;
				  %>
				  <label class="checkbox-inline"><input type="checkbox" value="<%=pacId%>" name="<%=title%>"><%=title %></label>
				  <%} %>
				
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
