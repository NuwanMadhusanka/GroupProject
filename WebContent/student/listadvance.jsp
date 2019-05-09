<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Url"%>
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
	<title>Student Details</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/list.css">
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
	    			
	    				<table class="table">
	    					<caption>Private Details</caption>
	    						<%
	    						ArrayList<String> pacName=new ArrayList<String>();//Store packages name
	    						ArrayList<String> pacId=new ArrayList<String>();//store package id
	    						ArrayList<Double> pacPrice=new ArrayList<Double>();//store pacage price
	    						String id=request.getParameter("id");
	    						String stuId="";
	    						String examDate="";
	    						String trialDate="";
	    						
	    						Connection con=DB.getConnection();
	    						String sql="SELECT * FROM student,user WHERE student.stu_id=user.stu_id AND user.id=? ";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,id);
	    					
	    						ResultSet rs=ps.executeQuery();
	    						if(rs.next()){
	    							stuId=rs.getString("stu_id");
	    							String name=rs.getString("name");
	    							String nic=rs.getString("nic");
	    							String address=rs.getString("address");
	    							String tel=rs.getString("tel");
	    							String email=rs.getString("email");
	    							String password="*********";
	    							examDate=rs.getString("exam_date");
	    							trialDate=rs.getString("trial_date");
	    							
	    							//get package details
	    							
	    							sql="SELECT package.pac_id,package.title,package.price FROM package,student_package WHERE "+
	    								"student_package.stu_id=? AND student_package.pac_id=package.pac_id";
	    							ps=con.prepareStatement(sql);
	    							ps.setString(1,stuId);
	    							rs=ps.executeQuery();
	    							while(rs.next()){
	    								pacName.add(rs.getString("title"));
	    								pacId.add(rs.getString("pac_id"));
	    								pacPrice.add(Double.parseDouble(rs.getString("price")));
	    							}
	    							
		    						%>
		    						<tr>
		    							<th>Name:</th>
		    							<td><%=name %></td>
		    						</tr>
		    						<tr>
		    							<th>NIC:</th>
		    							<td><%=nic%></td>
		    						</tr>
		    						<tr>
		    							<th>Address:</th>
		    							<td><%=address %></td>
		    						</tr>
		    						<tr>
		    							<th>Tel:</th>
		    							<td><%=tel%></td>
		    						</tr>
		    						<tr>
		    							<th>Email:</th>
		    							<td><%=email %></td>
		    						</tr>
		    						<tr>
		    							<th>Password</th>
		    							<td><%=password%></td>
		    						</tr>
		    						
	    						<%} %>
	    				</table>
	    				
	    				<%
	    				String role=session.getAttribute("role").toString(); 
	    				if(role.equals("2")){
	    				%>
	    				<a href="<%=UrlHelper.base_url() %>student/edit.jsp?id=<%=id %>" class="btn btn-default">Edit</a>
	    				<%} %>
	    				
	    				<table class="table">
	    					<caption>Course Details</caption>
	    					<tr>
		    					<th>ExamDate:</th>
		    					<td><%=examDate%></td>
		    				</tr>
		    				<tr>
		    					<th>TrialDate:</th>
		    					<td><%=trialDate %></td>
		    				</tr>
		    				<%
		    				for(int i=0 ; i<pacName.size() ; i++){
		    				%>
		    				<tr>
		    					<th>Package <%=(i+1) %></th>
		    					<th><%=pacName.get(i) %></th>
		    				</tr>
		    				<%
		    				}
		    				%>
	    				</table>
	    				
	    				<h3 id="payment">Payment Details</h3>
	    				<%
	    				for(int i=0 ; i<pacName.size() ; i++){
	    				
	    				%>
	    				<table class="table">
	    					<caption><%=(i+1)+")"+pacName.get(i) %></caption>
	    					<tr>
	    						<th>Date</th>
	    						<th>Payment</th>
	    					</tr>
	    					<%
	    					Double count=0.0;
	    					sql="SELECT * FROM course_fee WHERE pac_id=? AND stu_id=?";
	    					ps=con.prepareStatement(sql);
	    					ps.setString(1,pacId.get(i));
	    					ps.setString(2,stuId);
	    					rs=ps.executeQuery();
	    					while(rs.next()){
	    						String date=rs.getString("date");
	    						String amount=rs.getString("amount");
	    						count+=Double.parseDouble(amount);
	    					%>
	    					<tr>
	    						<td><%=date %></td>
	    						<td><%=amount %></td>
	    					</tr>
	    					<%} %>
	    				</table>
	    				<table class="table">
	    					<tr>
	    						<th>Package Fee:</th>
	    						<td><%=pacPrice.get(i)%></td>
	    					</tr>
	    					<tr>
	    						<th>Total Payment:</th>
	    						<td><%=count%></td>
	    					</tr>
	    					<tr class="warning">
	    						<th>Balance:</th>
	    						<td><%=(pacPrice.get(i)-count)>=0?(pacPrice.get(i)-count):"0" %></td>
	    					</tr>
	    				</table>
	    				
	    				<form action="../payment/add.jsp" method="post">
						  <div class="form-group">
						    <input type="hidden" class="form-control"  name="stuId" value="<%=stuId%>">
						  </div>
						  <div class="form-group">
						    <input type="hidden" class="form-control"  name="pacId" value="<%=pacId.get(i)%>">
						  </div>
						  <div class="form-group">
						    <input type="hidden" class="form-control"  name="count" value="<%=count%>">
						  </div>
						  <%
		    				if(role.equals("2")){
		    				%>
		    				<button type="submit" class="btn btn-default">Add Payment</button>
	    				  <%} %> 
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