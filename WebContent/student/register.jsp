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
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/user_validate.js"></script>
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
    		
    			<form action="../student_register_action" method="post" name="myForm" onsubmit="return validateFrom()">
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
				  
				  <h5>Packages:</h5>
				  <!-- Start row -->
				  <div class="row">
				  <%
				  Connection con=DB.getConnection();
				  String sql="SELECT pac_id,title,auto_les,manual_les FROM package";
				  Statement st=con.createStatement();
				  ResultSet rs=st.executeQuery(sql);
				  while(rs.next()){
					  String pacId=rs.getString("pac_id");
					  String title=rs.getString("title");
					  int autoLes=Integer.parseInt(rs.getString("auto_les"));
					  int manualLes=Integer.parseInt(rs.getString("manual_les"));
					  
				  %>
				  	<div class="col-md-4">
						  <div id="oneLineBlock">
							  <label id="pactitle" class="checkbox-inline"><input type="checkbox" value="<%=pacId%>" name="<%=title%>"><%=title %></label>
							  <%if(autoLes!=0 && manualLes!=0){ %>
							  	<div class="radio" id="package">
								  <label><input type="radio" name="<%=pacId%>" value="1">Manual</label>
								</div>
								<div class="radio" id="package">
								  <label><input type="radio" name="<%=pacId%>" value="2">Auto</label>
								</div>
							  <%}else if(autoLes!=0){ %>
							  	<div class="radio" id="package">
								  <label><input type="radio" name="<%=pacId%>" value="2">Auto</label>
								</div>
							  <%}else if(manualLes!=0){ %>
							  	<div class="radio" id="package">
								  <label><input type="radio" name="<%=pacId%>" value="1">Manual</label>
								</div>
							  <%} %>
						 </div>
					</div>
				
				  <%} %>
				 </div>
				 <!-- Start row -->
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
