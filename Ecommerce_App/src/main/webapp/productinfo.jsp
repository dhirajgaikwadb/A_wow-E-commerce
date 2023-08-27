<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserEntity auth = (UserEntity) request.getSession().getAttribute("auth");
String name = "";
if (auth != null) {

} else {
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
<%@include file="components\common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="components\navbar.jsp"%>
	<%@include file="components\message.jsp"%>
	<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	ProductDao dao = new ProductDao(FactoryProvider.getFactory());
	Product product = dao.getProductById(pid);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<!-- tranversing products -->


				<div class="card mt-5 mx-5">
					<div class="card-horizontal">
						<div class="container text-center">
							<img class="card-img-top mt-2 mb-2"
								
								src="img/products/<%=product.getProductPhoto()%>"
								alt="Card image cap">
						</div>
						<div class="card-body">
							<a style="text-decoration: none;">
								<h5 class="card-title"><%=product.getProductName()%></h5>
							</a>
							<p class="card-text"><%=product.getProductDesc()%></p>
							<h6 class="mt-2">Available quantity <%=product.getProductQuantity() %></h6>
							<button
								onclick="add_to_cart(<%=product.getProductId()%>,'<%=product.getProductName()%>',<%=product.getPriceAfterDiscount()%> )"
								class="btn custom-bg text-black mx-2">Add to cart</button>
							<button class="btn btn-outline-primary mx-2">
								&#8377;<%=product.getPriceAfterDiscount()%>-<span
									class="text-secondary discount-label">&#8377;<%=product.getProductPrice()%>
									<%=product.getProductDiscount()%>% off
								</span>
							</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/common_cart.jsp"%>
</body>
</html>