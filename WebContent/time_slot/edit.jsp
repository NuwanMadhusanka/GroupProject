<%@page import="java.sql.ResultSet"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/timeslot _validate.js"></script>
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
		    			<h3>Time Slot Update</h3>
		    			
		    		</div>
	    			<%
	    			String tId=request.getParameter("id");//time slot id
	    			Connection con=DB.getConnection();
	    			String sql="SELECT * FROM time_slot WHERE tim_slot_id=?";
	    			PreparedStatement ps=con.prepareStatement(sql);
	    			ps.setString(1,tId);
	    			ResultSet rs=ps.executeQuery();
	    			if(rs.next()){
	    				String sTime=rs.getString("s_time");
	    				String fTime=rs.getString("f_time");
	    			%>
	    			<form action="../time_slot_edit_action" method="post" name="myForm" onsubmit="return validateFrom()">
					  <div class="form-group">
					    <label for="usr">Start Time:</label>
					    <input type="time" name="sTime" value="<%=sTime%>"/>
					  </div>
					   <div class="form-group">
					    <label for="usr">Finish Time:</label>
					    <input type="time" name="fTime" value="<%=fTime%>"/>
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					</form>
					<%} %>
	    		</div>
	    	</div>
    	</div>
    </div>
  </div>
</div>

</body>
</html>
