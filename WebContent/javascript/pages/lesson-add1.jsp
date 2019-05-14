<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String pacId=request.getParameter("packageId");
	
	Connection con=DB.getConnection();
	String sql="SELECT auto_les,manual_les FROM package WHERE pac_id=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,pacId);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		String autoLes=rs.getString("auto_les");
		String manualLes=rs.getString("manual_les");
		if(!autoLes.equals("0")){
%>
	<div id="oneLine">
		<div class="radio">
	  		<label class="radio-inline"><input type="radio" name="transmission" value="2">Auto</label>
		</div>	
	</div>
<%
		}
		if(!manualLes.equals("0")){
%>
	<div id="oneLine">
		<div class="radio">
	  		<label class="radio-inline"><input type="radio" name="transmission" value="1">Manual</label>
		</div>
	</div>
<%	
		}
	}
%>
	
	