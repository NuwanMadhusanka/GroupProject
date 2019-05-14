 <%@page import="com.gp.service.UrlHelper"%>

<h3>DRIVO</h3>
      <hr/>

      <ul class="nav nav-pills nav-stacked">
      	<%Object roleObj1=session.getAttribute("role");
      	  if(roleObj1!=null && roleObj1.toString().equals("1")){%>
		        <li class="active"><a href="<%=UrlHelper.base_url()%>main.jsp">Dash Board</a></li>
		         
		         <li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Staff
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				       <li><a href="<%=UrlHelper.base_url()%>admin_staff/register.jsp" title="Register Administrative Staff">Register</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>staff/list.jsp" title="View Staff Details">Staff Details</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>complain/admin_list.jsp" title="staff complain details">Complain Details</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>leave/list.jsp" title="staff leave details">Leave Details</a></li>
				    </ul>
				</li>
		       
		       	 <li><a href="<%=UrlHelper.base_url()%>student/list.jsp">Student</a></li>
		         
		         <li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Vehicle
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				     	<li><a href="<%=UrlHelper.base_url()%>vehicle/list.jsp">Vehicle Details</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>vehicle_category/list.jsp">Vehicle Category Details</a></li>
				    </ul>
				</li>
		        
		       
		         <li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Package
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				      <li><a href="<%=UrlHelper.base_url()%>package/add.jsp">New Package</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>package/list.jsp">Package Details</a></li>
				    </ul>
				</li>
				
		        <li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Report
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				      <li><a href="#">Income</a></li>
				      <li><a href="#">Vehicle</a></li>
				      <li><a href="#">Salary</a></li> 
				    </ul>
				</li>
				
		 <%}else if(roleObj1!=null && roleObj1.toString().equals("2")){ %>
		 		<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Student
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				      <li><a href="<%=UrlHelper.base_url()%>student/register.jsp" title="Register Student">Register Student</a></li>
		 			  <li><a href="<%=UrlHelper.base_url()%>student/list.jsp" title="Student Details">Student Details</a></li>
				    </ul>
				</li>
				<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Complain
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				     	<li><a href="<%=UrlHelper.base_url()%>complain/add.jsp">Add Complain</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>complain/staff_list.jsp">Complain Details</a></li>
				    </ul>
				</li>
		 		
		 <%}else if(roleObj1!=null && roleObj1.toString().equals("3")){%>
		 		<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Instructor
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				      <li><a href="<%=UrlHelper.base_url()%>instructor/register.jsp" title="Register Instructor">Register</a></li>
		 			  <li><a href="<%=UrlHelper.base_url()%>instructor/list.jsp" title="Instructor Details">Instructor Details</a></li>
		 			  <li><a href="<%=UrlHelper.base_url()%>leave/list.jsp" title="Instructor leave details">Leave Details</a></li>
				    </ul>
				</li>
				
				<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Vehicle
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				      <li><a href="<%=UrlHelper.base_url()%>vehicle/add.jsp">New Vehicle</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>vehicle/list.jsp">Vehicle Details</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>vehicle_category/add.jsp">New Vehicle Category</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>vehicle_category/list.jsp">Vehicle Category Details</a></li>
				      <li><a href="<%=UrlHelper.base_url()%>vehicle/list_assign.jsp">Vehicle-Instructor Assign Details</a></li>
				    </ul>
				</li>
				
				<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Complain
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				     	<li><a href="<%=UrlHelper.base_url()%>complain/add.jsp">Add Complain</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>complain/staff_list.jsp">Complain Details</a></li>
				    </ul>
				</li>
				
				<li class="dropdown">
				    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Time Table
				    <span class="caret"></span></a>
				    <ul class="dropdown-menu">
				     	<li><a href="<%=UrlHelper.base_url()%>lesson/list.jsp">Time Table</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>lesson/add.jsp">Add Lesson</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>time_slot/list.jsp">Time Slot</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>time_slot/add.jsp">Add Time Slot</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>lesson/list.jsp">Path</a></li>
				     	<li><a href="<%=UrlHelper.base_url()%>lesson/list.jsp">Add Path</a></li>
				    </ul>
				</li>
		 		
		 <%}else if(roleObj1!=null && roleObj1.toString().equals("4")){%>
		 
		 <%}else{%>
		 	
		 <%} %>
      </ul><br>