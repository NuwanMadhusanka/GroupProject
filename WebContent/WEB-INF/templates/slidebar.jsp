 <%@page import="com.gp.service.UrlHelper"%>

<h3>DRIVE ME</h3>
      <hr/>

      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="<%=UrlHelper.base_url()%>admin/main.jsp">Dash Board</a></li>
        <li><a href="<%=UrlHelper.base_url()%>admin/register.jsp" title="Register Administrative Staff">Register</a></li>
        <li><a href="#section3" title="View Staff Details">Staff</a></li>
        <li><a href="#section3">Vehicle</a></li>
        <li><a href="#section3">Student</a></li>
        <li class="dropdown">
		    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Report
		    <span class="caret"></span></a>
		    <ul class="dropdown-menu">
		      <li><a href="#">Income</a></li>
		      <li><a href="#">Vehicle</a></li>
		      <li><a href="#">Salary</a></li> 
		    </ul>
		</li>
      </ul><br>