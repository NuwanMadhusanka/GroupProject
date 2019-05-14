<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Lesson-Add</title>
    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/register.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/lesson_validate.js"></script>
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
		    			<h3>Add Lesson</h3>	
		    		</div>
	    		
	    			<form action="../lesson_add_action" method="post" name="myForm" onsubmit="return validateFrom()">
					   
					   <div class="form-group">
						  <label for="sel1">Select Day:</label>
						  <select class="form-control" id="sel1" name="day">
						     <option value="0">Select Day</option>
						     <option value="1">Monday</option>
						     <option value="2">Tuesday</option>
						     <option value="3">Wednesday</option>
						     <option value="4">Thursday</option>
						     <option value="5">Friday</option>
						     <option value="6">Saturday</option>
						     <option value="7">Sunday</option>
						  </select>
						</div> 
					 
					  <div class="form-group">
						  <label for="sel1">Select Time Slot:</label>
						  <select class="form-control" id="sel2" name="time">
						     <option value="0">select time slot</option>
						     <%
						     Connection con=DB.getConnection();
						     String sql="SELECT * FROM time_slot";
						     Statement st=con.createStatement();
						     ResultSet rs=st.executeQuery(sql);
						     while(rs.next()){
						    	String timeId=rs.getString("tim_slot_id");	 
						     	String sTime=rs.getString("s_time");
						     	String fTime=rs.getString("f_time");
						     %>
						     <option value="<%=timeId%>"><%=sTime+" - "+fTime %></option>
						     <%} %>
						  </select>
						</div> 
					 
					 
					  <div class="form-group">
						  <label for="sel1">Select Package:</label>
						  <select class="form-control"  name="package" id="sel3">
						     <option value="0">select package</option>
						     <%
						     con=DB.getConnection();
						     sql="SELECT pac_id,title FROM package";
						     st=con.createStatement();
						     rs=st.executeQuery(sql);
						     while(rs.next()){
						    	String pacId=rs.getString("pac_id");	 
						     	String title=rs.getString("title");
						     %>
						     <option value="<%=pacId%>"><%=title%></option>
						     <%} %>
						  </select>
					 </div> 
					 
					 <div id="transmission">
					 	
					 </div>
					 
					 <div id="instructor">
					 
					 </div>
					 
					  <div id="vehicle">
					 
					 </div>
					  
					 <div class="form-group">
					    <label for="num">Number of Students:</label>
					    <input type="number" class="form-control" name="numStu">
					 </div>
					 
					 <div class="form-group">
					    <label for="num">Path :</label>
					    <input type="number" class="form-control" name="pathUrl">
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
