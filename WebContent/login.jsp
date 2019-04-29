<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	errorPage="WEB-INF/template/error.jsp"%>

<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<!-- Head part -->
		<%@ include file="../WEB-INF/templates/head.jsp"%>
		<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="container-flud">
		<div class="row">
			<div class="col-md-9" id="side1">
				<!-- Show message  -->
    			<%@ include file="../WEB-INF/templates/msg.jsp" %>
			</div>
			<div class="col-md-3" id="side2">
				<div class="box">
					<div id="login">
						<i class="fas fa-user-circle fa-5x"></i>
					</div>
					<form action="login_action" method="post">
					  <div class="form-group">
					    <label for="email">Email address:</label>
					    <input type="email" class="form-control" id="email" name="email" placeholder="Email">
					  </div>
					  <div class="form-group">
					    <label for="pwd">Password:</label>
					    <input type="password" class="form-control" id="pwd" name="password" placeholder="Password">
					  </div>
					  <button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>