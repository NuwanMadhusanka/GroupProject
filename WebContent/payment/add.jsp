<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="../WEB-INF/templates/error.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Payment-ADD</title>
    <!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/register.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/payment_validate.js"></script>
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
    	
    		<!-- Show message  -->
    		<%@ include file="../WEB-INF/templates/msg.jsp" %>
    		
    		
    		<div class="jumbotron">
    			<div id="title">
	    			<h3>Add Payment</h3>
	    		</div>
    			
    			<%
    			String pacName="";
    			Double balance=0.0;
    			Double price=0.0;
    			String stuId=request.getParameter("stuId");
    			String pacId=request.getParameter("pacId");
    			Double count=Double.parseDouble(request.getParameter("count"));//count==>total payment for this course
    			Connection con=DB.getConnection();
    			String sql="SELECT title,price FROM package WHERE pac_id=?";
    			PreparedStatement ps=con.prepareStatement(sql);
    			ps.setString(1,pacId);
    			ResultSet rs=ps.executeQuery();
    			if(rs.next()){
    				pacName=rs.getString("title");
    				price=Double.parseDouble(rs.getString("price"));
    				if(price>=count){
    					balance=price-count;
    				}else{
    					balance=0.0;
    				}
    			}
    			%>
    			
    			<table>
    				<tr>
    					<th>Package:</th>
    					<td><%=pacName %></td>
    				</tr>
    				<tr>
    					<th>Package Fee:</th>
    					<td><%=price %></td>
    				</tr>
    				<tr>
    					<th>Balance:</th>
    					<td><%=balance%></td>
    				</tr>
    			</table>
    			<br/>
    			<form action="../payment_add_action" method="post" name="myForm" onsubmit="return validateFrom()">
				  <div class="form-group">
				    <label for="usr">Amount(Rs):</label>
				    <input type="text" class="form-control" name="amount">
				  </div> 
				  <div class="form-group">
					<input type="hidden" class="form-control"  name="stuId" value="<%=stuId%>">
				  </div>
				  <div class="form-group">
				    <input type="hidden" class="form-control"  name="pacId" value="<%=pacId%>">
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