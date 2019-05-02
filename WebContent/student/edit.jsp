<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Edit</title>
    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/edit.css">
	<link rel="stylesheet" type="text/css" href="../css/register.css">
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
		    			<h3>Edit  Details</h3>
		    			
		    		</div>
	    			
	    			<%
	    			String id=request.getParameter("id");
	    			Connection con=DB.getConnection();
	    			String sql="SELECT * FROM user,student WHERE "+
	    					   "user.stu_id=student.stu_id  AND user.id=?";
	    			PreparedStatement ps=con.prepareStatement(sql);
	    			ps.setString(1,id);
	    			ResultSet rs=ps.executeQuery();
	    			
	    			String name="";
    				String address="";
    				String tel="";
    				String email="";
    				String pws="";
    				String nic="";
    				
	    			if(rs.next()){
	    				name=rs.getString("name");
	    				address=rs.getString("address");
	    				tel=rs.getString("tel");
	    				email=rs.getString("email");
	    				pws=rs.getString("password");
	    				nic=rs.getString("nic");
	    			}
	    			%>
	    			<form action="../student_edit_action" method="post">
	    			  <div class="form-group">
					    <label for="usr">ID:</label>
					    <input type="text" class="form-control" name="id" value="<%=id %>" readonly="readonly">
					  </div>
					  
					  <div class="form-group">
					    <label for="usr">Name:</label>
					    <input type="text" class="form-control" name="name" value="<%=name %>">
					  </div>
					  
					  <div class="form-group">
					    <label for="num">NIC:</label>
					    <input type="text" class="form-control" name="nic" value="<%=nic %>">
					  </div>
					  <div class="form-group">
					    <label for="num">TEL:</label>
					    <input type="text" class="form-control" name="tel" value="<%=tel %>">
					  </div>
					  <div class="form-group">
					    <label for="add">Address:</label>
					    <input type="text" class="form-control" name="address" value="<%=address %>">
					  </div>
					  <div class="form-group">
					    <label for="email">Email:</label>
					    <input type="email" class="form-control" name="email" value="<%=email %>">
					  </div>
					  <div class="form-group">
					    <label for="pwd">Password:</label>
					    <input type="password" class="form-control" name="password" placeholder="********">
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
