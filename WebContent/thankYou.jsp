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

	<br>
	<br>

	<br>
	<br>

	<br>

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

	</table>
	</form>
	<br>
	<h1>
		<center>
			<i style="color: red">You have successfully ordered your products</i><br>
			<br> <b style="color: green">Thankyou for visiting us<img
				alt="not found" src="Images/smile.jpeg" style="height: 40px">
		</center>
	</h1>
	<br>
	<br>
</body>
</html>