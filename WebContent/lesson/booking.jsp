<%@page import="java.sql.PreparedStatement"%>
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
	<title>Booking</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/list.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/booking.js"></script>
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
	    			
	    				<h3 style="color:blue;">Booking Your Lesson</h3>
	    				
	    				<form action="../lesson_book_action" method="post" name="myForm" onsubmit="return validateFrom()">
					   
						   <div class="form-group">
							  <label for="sel1">Select Package:</label>
							  <select class="form-control" id="sel1" name="package">
							     <option value="0">Select Package</option>
							     <%
							     String userId=session.getAttribute("id").toString();//stuId===>user Id
							     Connection con=DB.getConnection();
							     String sql="SELECT title,student_package.pac_id FROM student_package,package,student,user WHERE "+
							     			"user.stu_id=student.stu_id AND student_package.pac_id=package.pac_id AND "+
							     			"student_package.stu_id=student.stu_id AND user.id=?";
							     PreparedStatement ps=con.prepareStatement(sql);
							     ps.setString(1,userId);
							     ResultSet rs=ps.executeQuery();
							     while(rs.next()){
							    	 String pacId=rs.getString("pac_id");
							    	 String title=rs.getString("title");
							     %>
							     <option value="<%=pacId%>"><%=title %></option>
							     <%} %>
							  </select>
							</div> 
						 
						  <div class="form-group">
							  <label for="sel1">Select Time Slot:</label>
							  <select class="form-control" id="sel2" name="time">
							     <option value="0">select time slot</option>
							     <%
							     sql="SELECT * FROM time_slot";
							     Statement st=con.createStatement();
							     rs=st.executeQuery(sql);
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
							    <label for="num">Date:</label>
							    <input type="date" class="form-control" name="date" id="sel3">
							 </div>
							
							<div id="timeTable">
							
							</div> 
		
						  <button type="submit" class="btn btn-default" data-confirm='Are sure to reserve this Lesson.(When you reserve the lesson you cannot change)'>Book</button>
						</form>
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>