<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    errorPage="../WEB-INF/templates/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Time Table</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<%@ include file="../WEB-INF/templates/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<link rel="stylesheet" type="text/css" href="../css/list.css">
	<link rel="stylesheet" type="text/css" href="../css/table.css">
	<script type="text/javascript" src="<%=UrlHelper.base_url()%>javascript/search.js"></script>
	
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
	    				
	    				
	    				
	    				<table class="table" id="customers">
	    				<caption>Time Table(Trial)</caption>
	    					<tr class="warning">
	    						<th>Day</th>
	    						<th>Time Slot</th>
	    						<th>Veh-Category</th>
	    						<th>Type</th>
	    						<th>Instructor</th>
	    						<th>Package</th>
	    						<th>Path</th>
	    						<th>Num-Stu</th>
	    						<%
	    						String role=session.getAttribute("role").toString();
	    						if(role!=null && role.equals("3")){
	    						%>
	    						<th>Option</th>
	    						<%} %>
	    					</tr>
	    					<%
	    					ArrayList<String> dayName=new ArrayList<>();
	    					dayName.add(0,"Monday");
	    					dayName.add(1,"Tuesday");
	    					dayName.add(2,"Wednesday");
	    					dayName.add(3,"Thursday");
	    					dayName.add(4,"Friday");
	    					dayName.add(5,"Saturday");
	    					dayName.add(6,"Sunday");
	    					
	    					ArrayList<Integer> dayArray=new ArrayList<>();
	    					for(int i=0 ; i<7 ; i++){
	    						dayArray.add(i, 1);	
	    					}
	    					
	    					
	    					Connection con=DB.getConnection();
	    					String sql="SELECT day,count(*) FROM lesson day  GROUP BY day  ORDER BY  day ASC";
	    					PreparedStatement ps=con.prepareStatement(sql);
	    					ResultSet rs=ps.executeQuery();
	    					while(rs.next()){
	    						int day=Integer.parseInt(rs.getString("day"));
	    						int numRow=Integer.parseInt(rs.getString("count(*)"));
	    						
	    						dayArray.set(day-1,numRow);
	    					}
	    					
	    				
	    					
	    					for(int x=0 ; x<7 ; x++){
	    						
	    					%>
	    					
	    					<tr>
	    						
	    						<td rowspan="<%=dayArray.get(x)%>"><%=dayName.get(x) %></td>
	    						<%
	    						//I have to modify this because not add path for this query
	    						sql="SELECT lesson.les_id,lesson.type,lesson.num_stu,staff.name,time_slot.s_time,time_slot.f_time,package.title,vehicle_category.category FROM "+
	    							"lesson,package,vehicle,vehicle_category,instructor,staff,time_slot WHERE "+
	    							"lesson.pac_id=package.pac_id AND "+
	    							"lesson.ins_id=instructor.ins_id AND "+
	    							"instructor.emp_id=staff.emp_id AND "+
	    							"vehicle.ins_id=instructor.ins_id AND "+
	    							"vehicle.cat_id=vehicle_category.cat_id AND "+
	    							"lesson.time_slot_id=time_slot.tim_slot_id AND "+
	    							"day=?  ORDER BY lesson.time_slot_id ASC";
	    						ps=con.prepareStatement(sql);
	    						ps.setInt(1, x+1);
	    						rs=ps.executeQuery();
	    						boolean flag=true;
	    						int count=0;
	    						while(rs.next()){
	    							flag=false;
	    							String lesId=rs.getString("les_id");
	    							String type=rs.getString("type");
	    							String numStu=rs.getString("num_stu");
	    							String name=rs.getString("name");
	    							String sTime=rs.getString("s_time");
	    							String fTime=rs.getString("f_time");
	    							String title=rs.getString("title");
	    							String category=rs.getString("category");
	    							
	    							if(type.equals("1")){
	    								type="Manual";
	    							}else{
	    								type="Auto";
	    							}
	    							count++;
	    						%>
	    						<%if(count>=2){ %>
	    						<tr>
	    						<%} %>
	    						<td><%=sTime+"-"+fTime %></td>
	    						<td><%=category %></td>
	    						<td><%=type %></td>
	    						<td><%=name %></td>
	    						<td><%=title %></td>
	    						<td>p</td>
	    						<td><%=numStu %></td>
	    						<%if(role!=null && role.equals("3")){ %>
	    						<td>
	    							<a href="<%=UrlHelper.base_url() %>lesson_delete_action?id=<%=lesId%>" class="btn btn-danger"  title="Delete"><i class="fas fa-trash"></i></a>
	    						</td>
	    						<%} %>
	    						<%}if(flag){ %>
	    							<td>-</td>
		    						<td>-</td>
		    						<td>-</td>
		    						<td>-</td>
		    						<td>-</td>
		    						<td>-</td>
		    						<%if(role!=null && role.equals("3")) {%>
		    						<td>-</td>
		    						<%} %>
	    						<%} %>
	    					</tr>
	    					<%} %>
	    					
	    				</table>
	    			
	    			</div>
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>