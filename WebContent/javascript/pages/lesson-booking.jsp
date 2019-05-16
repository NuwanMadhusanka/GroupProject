<%@page import="java.sql.Statement"%>
<%@page import="com.gp.service.UrlHelper"%>
<%@page import="java.time.LocalTime"%>
<%@page import="org.apache.tomcat.jni.Local"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.gp.service.Functions"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<link rel="stylesheet" type="text/css" href="../css/table.css">
<%
	String pacId=request.getParameter("pacId");
	String timeId=request.getParameter("timeId");
	String date=request.getParameter("date");
	
	int flag=Functions.validateDate(date);//1-->No error    ,2-->booking day is today  ,0-->error
	
	//validation
	//Booking constrains ==> If booking date is today then the diference of time slot and booking time ,should be one hour or more.
	String error="";
	if(flag==2){
		LocalTime time = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss"); 
		
		
		Connection con1=DB.getConnection();
		String sql1="SELECT s_time FROM time_slot WHERE tim_slot_id=?";
		PreparedStatement ps1=con1.prepareStatement(sql1);
		ps1.setString(1,timeId);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next()){
			boolean flag1=Functions.timeGap(time.format(formatter), rs1.getString("s_time"));//true-->Time gap is ok
			if(!flag1){
				error+="You have to reserve lesson before one Hour or more!.Sorry Now can't reserve lesson for that time slot in today<br>";
			}
		}
	}else if(flag==0){
		error="Must Select Valid date!<br>";
	}
	
	
	//get data from db of time table
	if(error.equals("")){
		//get the day name as integer
		String[] splitedDate = date.split("\\s+");
		String dayName=splitedDate[0];
		int intDate=Functions.getWeekDay(splitedDate[0]);

		//get current student user id
		String Id=session.getAttribute("id").toString();
		%>
		<table class="table" id="customers">
			<tr>
				<th>Day</th>
	    		<th>Veh-Category</th>
	    		<th>Type</th>
	    		<th>Instructor</th>
	    		<th>Path</th>
			</tr>
		<%
		Connection con2=DB.getConnection();
		String sql2="SELECT lesson.les_id,lesson.type,lesson.num_stu,staff.name,time_slot.s_time,time_slot.f_time,package.title,vehicle_category.category FROM "+
				"lesson,package,vehicle,vehicle_category,instructor,staff,time_slot,student_package,student,user WHERE "+
				"lesson.pac_id=package.pac_id AND "+
				"lesson.ins_id=instructor.ins_id AND "+
				"instructor.emp_id=staff.emp_id AND "+
				"vehicle.ins_id=instructor.ins_id AND "+
				"vehicle.cat_id=vehicle_category.cat_id AND "+
				"lesson.time_slot_id=time_slot.tim_slot_id AND "+
				"user.stu_id=student.stu_id AND "+
				"student_package.stu_id=student.stu_id AND "+
				"student_package.transmission=lesson.type AND "+
				"package.cat_id=vehicle_category.cat_id AND "+
				"package.pac_id=student_package.pac_id AND "+
				"day=? AND lesson.pac_id=? AND lesson.time_slot_id=? AND user.id=? "+
				"ORDER BY lesson.time_slot_id ASC LIMIT 1";
		PreparedStatement ps2=con2.prepareStatement(sql2);
		ps2.setInt(1,intDate);
		ps2.setString(2,pacId);
		ps2.setString(3,timeId);
		ps2.setString(4,Id);
		ResultSet rs2=ps2.executeQuery();
		boolean data=false;
		while(rs2.next()){
			data=true;
			String lesId=rs2.getString("les_id");
			String type=rs2.getString("type");
			int numStu=Integer.parseInt(rs2.getString("num_stu"));
			String name=rs2.getString("name");
			String title=rs2.getString("title");
			String category=rs2.getString("category");
			
			if(type.equals("1")){
				type="Manual";
			}else{
				type="Auto";
			}
			
			//find lesson has available space for booking.
			String sql3="SELECT count(les_id) as numStu FROM student_lesson WHERE les_id=?";
			PreparedStatement ps3=con2.prepareStatement(sql3);
			ps3.setString(1,lesId);
			ResultSet rs3=ps3.executeQuery();
			boolean available=false;
			if(rs3.next()){
				int countStu=rs3.getInt("numStu");
				if(numStu>countStu){
					available=true;
				}
			}
			
			if(available){
	%>
	<div class="form-group">
			<input type="hidden" class="form-control"  name="lesson" value="<%=lesId%>">
	</div>
	<tr>
		<td><%=dayName %></td>
		<td><%=category %></td>
		<td><%=type %></td>
		<td><%=name %></td>
		<td>p</td>
	</tr>
	<%}else{
		out.println("<div class='alert alert-danger'>Already Book those lesson!</div>");
	}
	if(!data){%>
		<div class='alert alert-danger'>No Any Lesson!</div>
		<tr>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
			<td>-</td>
		</tr>
	<%}
	} %>
	</table>	
	<%
	}else{
		out.println("<div class='alert alert-danger'>"+error+"</div>");
	}
%>
