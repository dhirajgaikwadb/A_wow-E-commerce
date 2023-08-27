<%@page import="com.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	UserEntity auth2 = (UserEntity) request.getSession().getAttribute("auth");
	if (auth2 != null) {
		response.sendRedirect("index.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="components\common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="components\navbar.jsp"%>
	<div class="row mt-5">
		<div class="col-md-4 offset-md-4"
			style="box-shadow: 0 3px 10px rgb(0 0 0/ 0.2); border-radius: 10px;">
			
			<h3 class="text-center my-2">Login here</h3>
			<%@include file="components\message.jsp"%>
			<form action="Login" method="post">
				<div class="form-group mt-3">
					<label for="Email">User Email</label> <input type="email"
						id="Email" class="form-control" placeholder="Enter Email" name="email">
				</div>
				<div class="form-group mt-3">
					<label for="Password">User Password</label> <input type="password"
						id="Password" class="form-control" placeholder="Enter Password" name="password">
				</div>
				<div class="container text-center my-3">
				Do not have Account? please click <a href="Register.jsp">here</a>
				</div>
				<div class="container text-center my-3">
					<button class="btn btn-outline-success">Login</button>
				</div>
			</form>
		</div>
	</div>
	<%@include file="components/common_cart.jsp" %>
</body>
</html>