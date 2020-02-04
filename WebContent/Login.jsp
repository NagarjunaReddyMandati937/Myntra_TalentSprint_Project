<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Myntra Shopping</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div class="container-full">
		<nav class="navbar bg-secondary"> <img
			src="Images/myntra_logo.jpeg" class="rounded-circle"
			style="height: 120px; width: 120px" alt="not found">
		<h1>
			<b style="color: Yellow"><i>Myntra Online Shopping</i></b>
		</h1>

		<ul class="nav">

			<li class="nav-item"><button class="btn btn-primary"
					data-toggle="modal" data-target="#myModal">Signup</button></li>&nbsp;&nbsp;&nbsp;
			<li class="nav-item"><button class="btn btn-primary"
					data-toggle=modal data-target="#Modal">Login</button></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</ul>
		</nav>
	</div>
</head>
<body>
	<br>
	<br>

	<center>
		<h1>
			<b>Our Services</b>
		</h1>

		<br> <br> <br>
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
				<li data-target="#demo" data-slide-to="3"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="Images/cr1.jpeg" alt="Los Angeles" width="1100"
						height="500">
				</div>
				<div class="carousel-item">
					<img src="Images/cr2.jpeg" alt="Chicago" width="1100" height="500">
				</div>
				<div class="carousel-item">
					<img src="Images/cr3.jpeg" alt="New York" width="1100" height="500">
				</div>
				<div class="carousel-item">
					<img src="Images/cr4.jpeg" alt="Texas" width="1100" height="500">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</center>
	<br>
	<br>
	<br>
	<br>
	<center>
		<form action="myntraHome" method="post">
			<b>Select Category : </b><select name="category">
				<c:forEach var="il" items="${cl}">
					<option>${il}</option>
				</c:forEach>
			</select>&nbsp;&nbsp;&nbsp; <input type="submit" class="btn btn-primary"
				name="action" value="Go" />

		</form>
		<br> <br> <br>
	</center>
	<form action="myntraHome" method="post">
		<table class="table table-hover">
			<tr>
				<td></td>
				<th>Image</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Quantity</th>

			</tr>

			<c:forEach var="i" items="${il}">
				<tr>
					<td><input type="hidden" name="itemid" value="${i.id}"></td>
					<td><img style="width: 220px; height: 220px"
						src="Images/${i.image_url}"></td>
					<td>${i.name}</td>
					<td>${i.price}</td>
					<td><input type="number" name="quantity" min="0" value="0"></td>
				</tr>
			</c:forEach>

			</form>

			<!-- The Modal Registration-->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<form action="myntraHome" method="post">
							<div class="modal-header">
								<h4 class="modal-title">Enter Registration Details</h4>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<div class="form-group">
									Enter Name:<input type="text" name="name"
										class="form-control col-sm-8">

								</div>
								<div class="form-group">
									Enter Email:<input type="email" name="mail"
										class="form-control col-sm-8">

								</div>
								<div class="form-group">
									Enter password:<input type="password" name="pwd"
										class="form-control col-sm-8">

								</div>
								<!-- Modal footer -->
								<div class="form-group">
									<input type="submit" name="action" value="Register"
										class="form-control col-sm-3">
								</div>
						</form>
					</div>
				</div>
			</div>
			</div>


			<!-- The Modal Login-->
			<form action="myntraHome" method="post">
				<div class="modal" id="Modal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Enter Login Details</h4>
							</div>
							<!-- Modal body -->
							<div class="modal-body">
								<form action="show" method="post">
									<div class="form-group">
										Enter Email:<input type="email" name="mail"
											class="form-control col-sm-8">

									</div>
									<div class="form-group">
										Enter password:<input type="password" name="pwd"
											class="form-control col-sm-8">

									</div>
									<!-- Modal footer -->
									<div class="form-group">
										<input type="submit" name="action" value="Login"
											class="form-control col-sm-3">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</form>
		</table>
		<%-- <center>
				<input type="submit" name="action" class="btn btn-primary"
					value="Add to Cart">
			</center> --%>
		<br> <br>
</body>
</html>