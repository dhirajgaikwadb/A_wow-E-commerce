<%@page import="com.helper.helper"%>
<%@page import="org.hibernate.boot.model.source.internal.hbm.Helper"%>
<%@page import="com.entity.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.helper.FactoryProvider"%>
<%
UserEntity auth = (UserEntity) request.getSession().getAttribute("auth");
String name = "";
if (auth != null) {
	request.setAttribute("person", auth);
	name = (String) auth.getUserName();
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Ecommerce</title>
<%@include file="components\common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="components\navbar.jsp"%>
	<%@include file="components\message.jsp"%>

	<div class="container-fluid">
		<div class="row  mx-4">
			<%
			String cat = request.getParameter("Category");

			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = null;

			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();
			} else {
				int catid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsbyId(catid);
			}

			CategoryDao caDao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> cList = caDao.getCategories();
			%>
			<!-- above category -->
			<div class="col-md-2 mt-4">

				<div class="list-group category-list">
					<a href="index.jsp?Category=all"
						class="list-group-item list-group-item-action active "> All
						Products </a>
					<%
					for (Category category : cList) {
					%>
					<a href="index.jsp?Category=<%=category.getCategoryId()%>"
						class="list-group-item category list-group-item-action"><%=category.getCategoryTitle()%></a>
					<%
					}
					%>

				</div>

			</div>
			<!-- above product -->
			<div class="col-md-10 mt-3">

				<!-- 			//show product-->
				<div class="row">
					<div class="col-md-12">
						<div class="card-columns">
							<!-- tranversing products -->
							<%
							for (Product product : list) {
							%>
							<div class="card mt-2 mx-2"
								style="max-width: 300px; height: auto; display: inline-block;">
								<div class="container text-center">
									<img class="card-img-top mt-2"
										style="max-height: 250px; min-height: 250px; max-width: 100%;height:auto; width: auto;"
										src="img/products/<%=product.getProductPhoto()%>"
										alt="Card image cap">
								</div>
								<div class="card-body">
									<a style="text-decoration: none;" href="productinfo.jsp?pid=<%=product.getProductId()%>"><h5 class="card-title"><%=product.getProductName()%></h5></a>
									<p class="card-text"><%=helper.get10Words(product.getProductDesc())%></p>
								</div>
								<div class="card-footer">
									<button onclick="add_to_cart(<%= product.getProductId() %>,'<%= product.getProductName() %>',<%=product.getPriceAfterDiscount()%> )" class="btn custom-bg text-black">Add to cart</button>
									<button class="btn btn-outline-primary">
										&#8377;<%=product.getPriceAfterDiscount()%>-<span
											class="text-secondary discount-label">&#8377;<%=product.getProductPrice()%> <%=product.getProductDiscount()%>%
											off
										</span>
									</button>
								</div>
							</div>
							<%
							
							}

							if (list.size() == 0) {
							out.println("<h3>No item in this category<h3>");
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="components/common_cart.jsp" %>
</body>
</html>
