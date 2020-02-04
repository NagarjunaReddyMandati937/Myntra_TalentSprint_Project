<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Myntra Shopping</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-full">
		<nav class="navbar bg-secondary"> <img
			src="Images/myntra_logo.jpeg" class="rounded-circle"
			style="height: 150px; width: 150px" alt="not found">
		<h1>
			<b style="color: yellow">Welcome to Myntra, Enjoy Your Shopping</b>
		</h1>
		<ul class="nav">

			<li class="nav-item"><button type="button"
					class="btn btn-primary" data-toggle="modal" data-target="#myModal">
					Welcome
					<c:out value="${user.name}"></c:out>
				</button></li>&nbsp;&nbsp;
			<li class="nav-item"><button type="button"
					class="btn btn-primary" data-toggle="modal" data-target="#myModal1"
					style="margin-right: 30px">Logout</button></li>
		</ul>
	</div>
	</nav>
	<br>
	<br>
	<center>
		<form action="myntraHome" method="post">
			<input type="submit" class="btn btn-primary" name="action"
				value="Cart">
		</form>
	</center>
	<br>
	<br>


	<br>
	<br>
	<center>
		<form action="myntraHome" method="post">
			<b>Select Category : </b><select name="category">
				<c:forEach var="i" items="${cl}">
					<option>${i}</option>
				</c:forEach>
			</select>&nbsp;&nbsp;&nbsp; <input type="submit" class="btn btn-primary"
				name="action" value="Search" />

		</form>

	</center>
	<br>
	<br>

	<br>
	<form action="myntraHome" method="post">
		<table class="table table-hover">
			<tr>
				<th></th>
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
			<br>
			<!-- The Modal -->
			<div class="modal" id="myModal1">
				<div class="modal-dialog">
					<div class="modal-content">


						<!-- Modal body -->
						<div class="modal-body">

							<form style="font-weight: bold;" action="myntraHome"
								method="post">
								<h3>Are you sure you want to Logout?</h3>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<input type="submit" class="form-control col-sm-4 bg-success"
								value="Yes" name="action">
							</form>

						</div>

					</div>
				</div>
			</div>

		</table>
	</form>
	<center>
		<input type="submit" name="action" class="btn btn-primary"
			value="Add to Cart">
	</center>
	<br>
	<br>
</body>
</html>