<%@page import="com.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
UserEntity auth = (UserEntity) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="components\common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="components\navbar.jsp"%>
	<div class="row mt-5">
		<div class="col-md-4 offset-md-4"
			style="box-shadow: 0 3px 10px rgb(0 0 0/ 0.2); border-radius: 10px;">

			<h3 class="text-center my-2">Sign up here</h3>
			<form action="RegisterServlet" method="post">
				<div class="form-group mt-3">
					<label for="Name">User Name</label> <input type="text" id="Name"
						name="user_name" class="form-control" placeholder="Enter name">
				</div>
				<div class="form-group mt-3">
					<label for="Email">User Email</label> <input type="email"
						id="Email" class="form-control" placeholder="Enter Email"
						name="user_email">
				</div>
				<div class="form-group mt-3">
					<label for="Password">User Password</label> <input type="password"
						id="Password" class="form-control" placeholder="Enter Password" name="user_password">
				</div>
				<div class="form-group mt-3">
					<label for="Phone">User Phone no</label> <input type="number"
						id="Phone" class="form-control" placeholder="Enter Phone no" name="user_phone">
				</div>
				<div class="form-group mt-3">
					<label for="Phone">User Address</label>
					<textarea style="height: 120px;" class="form-control"
						placeholder="Enter Your Address"name="user_address"></textarea>
				</div>
				<div class="container text-center my-3">
					<button class="btn btn-outline-success">Register</button>
					<button class="btn btn-outline-warning">Reset</button>
				</div>
			</form>
		</div>
	</div>
	<%@include file="components/common_cart.jsp" %>
</body>
</html>