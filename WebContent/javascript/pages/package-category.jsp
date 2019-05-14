<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	boolean flag=true;//check whether caregory has relevant category
	String value=request.getParameter("categoryVal");
	Connection con=DB.getConnection();
	String sql="SELECT distinct(transmission) FROM vehicle_category,vehicle WHERE "+
				"vehicle_category.cat_id=vehicle.cat_id AND vehicle_category.cat_id=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,value);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		String transmission=rs.getString("transmission");
		if(transmission.equals("1")){
			flag=false;
%>
	<div id="oneLine">
		<div class="checkbox">
				<label><input type="checkbox" value="1" onclick="activeManual()" name="checkManual">Manual</label>
		</div>
		<div class="form-group">
			<label for="num">Manual:</label>
			<input type="text" class="form-control" name="manual" readonly="readonly" id="manual">
		</div>
	</div>
<%
		}
		if(transmission.equals("2")){
			flag=false;
%>
	<div id="oneLine">
		<div class="checkbox">
				<label><input type="checkbox" value="2" onclick="activeAuto()" name="checkAuto">Auto</label>
		</div>
		<div class="form-group">
			<label for="num">Auto:</label>
			<input type="text" class="form-control" name="auto" readonly="readonly" id="auto">
		</div>	
	</div>
<%	
		}
	}
	if(flag){
		out.println("<span class='label label-danger'>No vehicle for this category.Firstly add the vehicle for this category and then try it.</span>");
	}
%>
	
	