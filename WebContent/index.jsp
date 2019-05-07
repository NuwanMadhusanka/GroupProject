<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 
	<title>DRIVO</title>
	<!-- Head part -->
	<%@ include file="../WEB-INF/templates/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="css/index.css"> 
</head>
<body>

	<!-- Part 1(Head) -->
	<div id="part1">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<h3>DRIVO</h3>
				</div>
				<div class="col-md-2" id="socialmedia">
					<a href="#" class="btn btn-primary" title="Face Book"><i class="fab fa-facebook-f"></i></a>
					<a href="#" class="btn btn-info" title="Twitter"><i class="fab fa-twitter"></i></a>
					<a href="#" class="btn btn-success" title="Whatsapp"><i class="fab fa-whatsapp"></i></a>
				</div>
				<div class="col-md-1" id="login">
					<a href="login.jsp" class="btn btn-default" title="Login"><i class="fas fa-sign-in-alt"></i></i></a>
				</div>
			</div>
		</div>
	</div>
	<!-- Finish Part 1 -->

	<!-- Part 2 -->
	<div id="part2">
		<div class="container">
			<div class="row">

				<div class="col-md-2">
					<button class="btn btn-success" id="p2box">
						<h4>ABOUT US</h4>
					</button>
				</div>
				

				<div class="col-md-2">
					<button class="btn btn-success" id="p2box">
						<h4>CLASSES</h4>
					</button>
				</div>

				<div class="col-md-2">
					<button class="btn btn-success" id="p2box">
						<h4>SAFETY</h4>
					</button>
				</div>

				<div class="col-md-2">
					<button class="btn btn-success" id="p2box">
						<h4>BLOG</h4>
					</button>
				</div>

				<div class="col-md-2">
					<button class="btn btn-success" id="p2box">
						<h4>CONTACTS</h4>
					</button>
				</div>

			</div>
		</div>
	</div>
	<!-- Finish part 2 -->

</body>
</html>