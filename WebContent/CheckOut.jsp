<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Check out Page</title>
<style>
table {
	margin-top: 10px;
}

table td, table th {
	border: 2px solid black;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">

		<nav class="navbar bg-secondary">
			<img src="Images/myntra_logo.jpeg" class="rounded-circle"
				style="width: 80px; height: 80px; margin-left: 30px">

			<ul class="nav">
				<li class="nav-item"><button type="button"
						class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						<c:out value="${user.name}"></c:out>
					</button></li>&nbsp;&nbsp;
				<li class="nav-item"><button type="button"
						class="btn btn-primary" data-toggle="modal"
						data-target="#myModal1" style="margin-right: 30px">Logout</button></li>
			</ul>
		</nav>

	</div>


	<!-- The Modal -->
	<div class="modal" id="myModal1">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<form style="font-weight: bold;" action="myntraHome" method="post">
						<h3>Are you sure you want to Logout?</h3>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<input type="submit" class="form-control col-sm-4 bg-warning"
						value="Yes" name="action">
					</form>
				</div>

			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<b>User Name : </b> <input type="text" name="user"
			value="${user.name}">
	</center>
	<br>
	<br>
	<form action="myntraHome" method="post">
		<table class="table table-hover container" border="2px"
			cellpadding="10px" cellspacing="0px">
			<thead>
				<tr>

					<th>Image</th>
					<th>Name</th>
					<th>UnitPrice</th>
					<th>Quantity</th>
				</tr>

			</thead>
			<tbody>
				<c:forEach var="j" items="${items}" varStatus="st">
					<tr>

						<td><img src="Images/${j.image_url}"
							style="width: 200px; height: 200px;"></td>
						<td><c:out value="${j.name}"></c:out></td>
						<td><c:out value="${j.price}"></c:out></td>
						<td>${qlist.get(st.index)}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<center>
			<h1>
				Total price of all Products =
				<c:out value="${tp}"></c:out>
			</h1>
			<center>
				<br>
				<center>
					<input type="submit" name="action" value="Continue"
						class="btn btn-primary"> <br>

				</center>
	</form>
	<br>
	<br>
</body>
</html>
