 <%@page import="com.gp.service.UrlHelper"%>

<h3>DRIVO</h3>
      <hr/>

      <ul class="nav nav-pills nav-stacked">
      	<%Object roleObj1=session.getAttribute("role");
      	  if(roleObj1!=null && roleObj1.toString().equals("1")){%>
		        <li class="active"><a href="<%=UrlHelper.base_url()%>main.jsp">Dash Board</a></li>
		        <li><a href="<%=UrlHelper.base_url()%>admin_staff/register.jsp" title="Register Administrative Staff">Register</a></li>
		        <li><a href="<%=UrlHelper.base_url()%>staff/list.jsp" title="View Staff Details">Staff</a></li>
		        <li><a href="#section3">Vehicle</a></li>
		        <li><a href="<%=UrlHelper.base_url()%>student/list.jsp">Student</a></li>
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
		 		<li><a href="<%=UrlHelper.base_url()%>student/register.jsp" title="Register Student">Register</a></li>
		 		<li><a href="<%=UrlHelper.base_url()%>student/list.jsp" title="Student Details">Students</a></li>
		 <%}else if(roleObj1!=null && roleObj1.toString().equals("3")){%>
		 		<li><a href="<%=UrlHelper.base_url()%>instructor/register.jsp" title="Register Instructor">Register</a></li>
		 		<li><a href="<%=UrlHelper.base_url()%>instructor/list.jsp" title="Instructor Details">Instructor</a></li>
		 <%}else if(roleObj1!=null && roleObj1.toString().equals("4")){%>
		 
		 <%}else{%>
		 	
		 <%} %>
      </ul><br>