<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gp.service.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Package -Edit</title>
<!-- Head part -->
<%@ include file="../WEB-INF/templates/head.jsp"%>
<%@ include file="../WEB-INF/templates/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/register.css">
<script type="text/javascript"
	src="<%=UrlHelper.base_url()%>javascript/package.js"></script>
</head>

<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">

				<!-- SlideBar Part-->
				<%@ include file="../WEB-INF/templates/slidebar.jsp"%>

			</div>


			<div class="col-sm-10 ">

				<!-- First Row -->
				<div class="row">

					<!-- NavBar Part -->
					<%@ include file="../WEB-INF/templates/navbar.jsp"%>

				</div>



				<!-- Second Row -->
				<div class="row" id="content">

					<!-- Show message  -->
					<%@ include file="../WEB-INF/templates/msg.jsp"%>

					<div class="jumbotron">
					<%

					String pacId=request.getParameter("id");
	    									
	    			Connection con=DB.getConnection();
	    			String sql="SELECT * FROM package,vehicle_category WHERE package.cat_id=vehicle_category.cat_id "+
							   "AND package.pac_id=?";
	    			PreparedStatement ps=con.prepareStatement(sql);
	    			ps.setString(1,pacId);
	    					
	    			ResultSet rs=ps.executeQuery();
	    			if(rs.next()){
	    							
	    				String title=rs.getString("title");
	    				String category=rs.getString("category");
	    				String price=rs.getString("price");
	    				String url=rs.getString("url");
	    				String manualLes=rs.getString("manual_les");
	    				String autoLes=rs.getString("auto_Les");
	    				String description=rs.getString("description");
	    							
	    			
	    			%>
						<div id="title">
							<h3>Update Package Details</h3>

						</div>

						<form action="../package_edit_action" method="post">
							<div class="form-group">
								<label for="usr">Package ID:</label> <input type="text"
									class="form-control" name="id" value="<%=pacId%>"
									readonly="readonly">
							</div>

							<div class="form-group">
								<label for="usr">Title:</label> <input type="text"
									class="form-control" name="title" value="<%=title%>">
							</div>
							

							 <label>Number of Lessons:</label>
							 <%
							 if(!manualLes.equals("0")){
							 %>
							  <div id="oneLine">
								  <div class="form-group">
								    <label for="num">Manual:</label>
								    <input type="text" class="form-control" name="manual"  id="manual" value="<%=manualLes%>">
								  </div>
							  </div>
							  <%} %>
							  <%if(!autoLes.equals("0")){%>
							  <div id="oneLine">
								  <div class="form-group">
								    <label for="num">Auto:</label>
								    <input type="text" class="form-control" name="auto" id="auto" value="<%=autoLes%>">
								  </div>
							  </div>
							<%} %>
							<div class="form-group">
								<label for="num">Price(RS):</label> <input type="text"
									class="form-control" name="price" value="<%=price%>">
							</div>

							<div class="form-group">
								<label for="num">Image:</label> <input type="file"
									class="form-control" name="url" value="<%=url%>">
							</div>

							<div class="form-group">
								<label for="qul">Description:</label>
								<textarea class="form-control" rows="3" name="description"><%=description%></textarea>
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>
