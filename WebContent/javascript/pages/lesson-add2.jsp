<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<div class="form-group">
		<label for="sel1">Instructor :</label>
		<select class="form-control" id="sel4" name="instructor">
			<option value="0">Select Instructor</option>
<%
	String pacId=request.getParameter("packageId");
	String transmissionId=request.getParameter("traId");
	String dayId=request.getParameter("day");
	String timeId=request.getParameter("time");
	
	
	Connection con=DB.getConnection();
	String sql="SELECT instructor.ins_id,staff.name FROM package,vehicle_category,vehicle,instructor,staff WHERE "+
			  	"package.cat_id=vehicle_category.cat_id AND vehicle.cat_id=vehicle_category.cat_id AND "+
				"vehicle.ins_id=instructor.ins_id AND instructor.emp_id=staff.emp_id AND "+
			  	"package.pac_id=? AND vehicle.transmission=? AND "+
				"instructor.ins_id NOT IN (SELECT ins_id FROM lesson WHERE day=? AND time_slot_id=?)";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,pacId);
	ps.setString(2,transmissionId);
	ps.setString(3,dayId);
	ps.setString(4,timeId);
	ResultSet rs=ps.executeQuery();
	
	
	while(rs.next()){
		String insId=rs.getString("ins_id");
		String insName=rs.getString("name");	
%>
	<option value="<%=insId%>"><%=insName%></option>
<%} %>
	</select>
	
</div>

						  	
						  	
						  
	