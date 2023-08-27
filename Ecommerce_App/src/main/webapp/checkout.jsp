<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	UserEntity user = (UserEntity) request.getSession().getAttribute("auth");
	HttpSession http = request.getSession();
	String name = "";
	if (user == null) {
		http.setAttribute("message", "you are not logged in !! Login first to access checkoutpage");
		response.sendRedirect("Login.jsp");
		return;
	} 
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Out</title>
<%@include file="components\common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="components\navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 mt-2">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center mb-3">Your Selected item</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>


			<div class="col-md-6 mt-2"><div class="card">
					<div class="card-body">
					<h3 class="text-center mb-3">Your Details for Order</h3>
					<form action="" method="post">
				<div class="form-group mt-3">
					<label for="Name">Your Shipping Name</label> <input type="text"
									id="Name" value="<%=user.getUserName()%>" name="user_name"
									class="form-control" placeholder="Enter name">
							</div>
				<div class="form-group mt-3">
					<label for="Email">Your Email</label> <input type="email" value="<%=user.getUserEmail()%>" 
						id="Email" class="form-control" placeholder="Enter Email"
						name="user_email">
				</div>
				<div class="form-group mt-3">
					<label for="Phone">Your Phone no</label> <input type="number" value="<%=user.getUserPhones()%>" 
						id="Phone" class="form-control" placeholder="Enter Phone no" name="user_phone">
				</div>
				<div class="form-group mt-3">
					<label for="Phone">Your Shipping Address</label>
					<textarea style="height: 120px;" class="form-control" 
						name="user_address"><%=user.getUserAddress()%></textarea>
				</div>
				<div class="container text-center my-3">
					<button class="btn btn-outline-success">Order</button>
					<button class="btn btn-outline-primary">Continue Shopping</button>
				</div>
			</form>
					</div>
				</div></div>
		</div>
	</div>
	<%@include file="components/common_cart.jsp"%>
</body>
</html>