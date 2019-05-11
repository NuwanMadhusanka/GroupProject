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
	<title>Edit Assign</title>
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
	    					<caption>Vehicle Instructor(Assign)</caption>
	    						<%
	    						String vehId=request.getParameter("id");
	    						String instructor="Select Instructor";			
	    						Connection con=DB.getConnection();
	    						String sql="SELECT * FROM vehicle WHERE veh_id=?";
	    						PreparedStatement ps=con.prepareStatement(sql);
	    						ps.setString(1,vehId);
	    						ResultSet rs=ps.executeQuery();
	    						
	    						if(rs.next()){
	    							String insId=rs.getString("ins_id");//find whether or not instructor assign
	    							boolean isInsName=false;
	  
	    							if(insId!=null){
	    								sql="SELECT brand,model,number,category,transmission,fuel_type,document_lic,name "+
	 	    								   "FROM vehicle,vehicle_category,instructor,staff  "+
	 	    								   "WHERE vehicle.cat_id=vehicle_category.cat_id AND  instructor.ins_id=vehicle.ins_id "+
	 	    								   "AND  instructor.emp_id=staff.emp_id AND vehicle.veh_id=?";

	    	    						isInsName=true;
	    							}else{
	    								sql="SELECT brand,model,number,category,transmission,fuel_type,document_lic "+
		 	    							"FROM vehicle,vehicle_category  "+
		 	    							"WHERE vehicle.cat_id=vehicle_category.cat_id  AND vehicle.veh_id=?";	
	    								
	    							}
	    							ps=con.prepareStatement(sql);
	    							ps.setString(1,vehId);
	    							rs=ps.executeQuery();
	    							if(rs.next()){
	    								String brand=rs.getString("brand");
		    							String model=rs.getString("model");
		    							String number=rs.getString("number");
		    							String category=rs.getString("category");
		    							String transmission=rs.getString("transmission");
		    							String fuelType=rs.getString("fuel_type");
		    							String lic=rs.getString("document_lic");
		    							
		    							
		    							if(transmission.equals("1")){
		    								transmission="Manual";
		    							}
		    							if(transmission.equals("2")){
		    								transmission="Auto";
		    							}
		    							
		    							if(lic==null){
		    								lic="Add Licence(Document)";
		    							}
		    							
		    							if(isInsName){
		    								instructor=rs.getString("name");
		    							}
	    						
		    						%>
		    						<tr>
		    							<th>Brand:</th>
		    							<td><%=brand %></td>
		    						</tr>
		    						<tr>
		    						<tr>
		    							<th>Model:</th>
		    							<td><%=model %></td>
		    						</tr>
		    						<tr>
		    							<th>Number:</th>
		    							<td><%=number %></td>
		    						</tr>
		    						<tr>
		    							<th>Vehicle Category:</th>
		    							<td><%=category %></td>
		    						</tr>
		    						<tr>
		    							<th>Transmission:</th>
		    							<td><%=transmission%></td>
		    						</tr>
		    						<tr>
		    							<th>Fuel Type:</th>
		    							<td><%=fuelType %></td>
		    						</tr>
		    						<tr>
		    							<th>Licence:</th>
		    							<td><%=lic%></td>
		    						</tr>
	    						<%}%>
	    				</table>
	    				
	    				<!--select instructor form -->
	    				<form action="../vehicle_assign_action" method="post">
	    				  <div class="form-group">
						  	<label>Instructor(Assign Driver)</label>
						  	<select name="insId" id="soflow-color">
						  		<%if(isInsName){ %>	
						  		<option value="<%=insId%>"><%=instructor %></option>
						  		<%}else{ %>	
						  		<option value="0">Select Instructor</option>
						  		<%} %>
						  		
						  		<%
						  		//I want get instructor id in instructor table if this instructor id not in vehicle table.
						  		//(because of foreign key is null  I can't get this result by sql)
						  		ArrayList<String> instructorName=new ArrayList<>();
						  		ArrayList<String> instructorId=new ArrayList<>();
						  		sql="SELECT ins_id,name FROM instructor,staff WHERE instructor.emp_id=staff.emp_id";
						  		Statement st=con.createStatement();
						  		rs=st.executeQuery(sql);
						  		int i=0;
						  		while(rs.next()){
						  			instructorName.add(i,rs.getString("name"));
						  			instructorId.add(i,rs.getString("ins_id"));
						  			i++;
						  		}
						  		
						  		sql="SELECT ins_id FROM vehicle";
						  		st=con.createStatement();
						  		rs=st.executeQuery(sql);
						  		while(rs.next()){
						  			String insID=rs.getString("ins_id");
						  			if(insID!=null){
						  				int x=instructorId.indexOf(insID);
						  				instructorId.remove(x);
						  				instructorName.remove(x);
						  			}
						  		}
						  			
						  		for(int y=0 ; y<instructorId.size() ; y++){	
						  			String id=instructorId.get(y);	
						  			String name=instructorName.get(y);	
						  		%>	
						  		<option value="<%=id%>"><%=name %></option>	
						  		<%} %>
						  		<option value="-1">Not Assign</option>	
						  	</select>	
						  </div>
						  
						  <div class="form-group">
						    <input type="hidden" class="form-control"  name="vehId" value="<%=vehId%>">
						  </div>
	    				  <button type="submit" class="btn btn-default">Submit</button>
	    				</form> 
	    				<% }%>
	    			</div>
	    			
	    			
	    		</div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
</body>
</html>