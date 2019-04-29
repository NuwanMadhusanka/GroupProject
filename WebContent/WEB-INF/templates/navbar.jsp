<%@page import="com.gp.service.UrlHelper"%>
<div class="col-sm-12" id="bar">
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