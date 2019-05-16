<%@page import="com.gp.service.UrlHelper"%>

<div class="col-sm-12" id="bar">
					 
					 <div class="row">
					 
					 	<%
					 	String role1=session.getAttribute("role").toString();
					 	if(role1!=null && role1.equals("1")){
					 	%>
					 		<div class="col-md-2">
						 		<div class="dropdown">
								  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fas fa-cog"></i>
								  <span class="caret"></span></button>
								  <ul class="dropdown-menu">
								    <li><a href="<%=UrlHelper.base_url()%>leave/setting.jsp">Leave Setting</a></li>
								  </ul>
								</div> 
						 	</div>
						 	
						 	<div class="col-md-10">
						 		<ul class="nav navbar-nav navbar-right">
							      <li><a href="#"><span class="glyphicon glyphicon-user" id="logout"></span>
							      		LOGIN AS 
							      		<%
							      		Object roleObj=session.getAttribute("role");
							      		if(roleObj!=null && roleObj.toString().equals("1")){
							      		%>
							      		<%="ADMIN"%>
							  			<%}else if(roleObj!=null && roleObj.toString().equals("2")){%>
										<%="ADMINISTRATIVE STAFF(STUDENT)" %>
										<%}else if(roleObj!=null && roleObj.toString().equals("3")){%>
										<%="ADMINISTRATIVE STAFF(INSTRUCTOR)" %>
										<%}else if(roleObj!=null && roleObj.toString().equals("4")){%>
										<%="INSTRUCTOR" %>
										<%}else { %>
										<%="STUDENT" %>
										<%} %>
							      	</a>
							      </li>
							      <li><a href="<%=UrlHelper.base_url()%>logout_action"><span class="glyphicon glyphicon"></span> LOGOUT</a></li>
							    </ul>
						 	</div>
					 	<%} else{%>
					 		<div class="col-sm-12" id="loginAs">
						 		<ul class="nav navbar-nav navbar-right">
							      <li><a href="#"><span class="glyphicon glyphicon-user" id="logout"></span>
							      		LOGIN AS 
							      		<%
							      		Object roleObj=session.getAttribute("role");
							      		if(roleObj!=null && roleObj.toString().equals("1")){
							      		%>
							      		<%="ADMIN"%>
							  			<%}else if(roleObj!=null && roleObj.toString().equals("2")){%>
										<%="ADMINISTRATIVE STAFF(STUDENT)" %>
										<%}else if(roleObj!=null && roleObj.toString().equals("3")){%>
										<%="ADMINISTRATIVE STAFF(INSTRUCTOR)" %>
										<%}else if(roleObj!=null && roleObj.toString().equals("4")){%>
										<%="INSTRUCTOR" %>
										<%}else { %>
										<%="STUDENT" %>
										<%} %>
							      	</a>
							      </li>
							      <li><a href="<%=UrlHelper.base_url()%>logout_action"><span class="glyphicon glyphicon"></span> LOGOUT</a></li>
							    </ul>
						 	</div>
					 	<%} %>
					 </div>
</div>