<%@page import="java.util.Map"%>
<%@page import="com.helper.helper"%>
<%@page import="com.dao.userDao"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserEntity admin = (UserEntity) request.getSession().getAttribute("auth");
HttpSession http = request.getSession();
String name = "";
if (admin == null) {
	http.setAttribute("message", "you are not logged in !! Login first");
	response.sendRedirect("Login.jsp");
} else {

	if (admin.getUserType().equals("normal")) {
		http.setAttribute("message", "you are not Admin in !! do not access this page");
		response.sendRedirect("index.jsp");
	} else {
		name = (String) admin.getUserName();
	}
}
%>
<%
userDao user = new userDao(FactoryProvider.getFactory());

CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cDao.getCategories();

//getting count
Map<String,Long> map= helper.getCounts(FactoryProvider.getFactory());


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components\common_CSS_JS.jsp"%>

</head>
<body>
	<%@include file="components\navbar.jsp"%>


	<div class="container admin">
		<%@include file="components\message.jsp"%>
		<div class="container-fluid mt-3">

			<div class="row  mt-3">
				<!-- Users count -->
				<!-- first row first column -->
				<div class="col-md-4">
					<div class="card">
						<div class="card-body text-center">
							<div class="container">
								<img class="img-fluid" style="max-width: 120px"
									src="img/user.png" alt="User_Icons">
							</div>
							<h1><%=map.get("userCount") %></h1>
							<h1 class="text-uppercase text-muted">User</h1>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body text-center">
							<div class="container">
								<img class="img-fluid" style="max-width: 120px"
									src="img/list.png" alt="Category_Icons">
							</div>
							<h1><%=list.size() %></h1>
							<h1 class="text-uppercase text-muted">Categories</h1>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body text-center">
							<div class="container">
								<img class="img-fluid" style="max-width: 120px"
									src="img/product.png" alt="Product_Icons">
							</div>
							<h1><%=map.get("productCount") %></h1>
							<h1 class="text-uppercase text-muted">Products</h1>
						</div>
					</div>
				</div>
			</div>
			<!-- second row first column -->
			<div class="row  mt-3">
				<div class="col-md-6">
					<div class="card" data-bs-toggle="modal"
						data-bs-target="#add-category-modal">
						<div class="card-body text-center">
							<div class="container">
								<img class="img-fluid" style="max-width: 120px"
									src="img/menu.png" alt="Category_Icons">
							</div>
							<p class="mt-2">click here to add categories</p>
							<h1 class="text-uppercase text-muted">Add Categories</h1>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" data-bs-toggle="modal"
						data-bs-target="#add-product-modal">
						<div class="card-body text-center">
							<div class="container">
								<img class="img-fluid" style="max-width: 120px"
									src="img/add.png" alt="Category_Icons">
							</div>
							<p class="mt-2">click here to add Product</p>
							<h1 class="text-uppercase text-muted">Add Product</h1>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- category Modal starts-->
		<div class="modal fade" id="add-category-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header custom-bg">
						<h5 class="modal-title " id="exampleModalLabel">Fill category
							details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="ProductOperation" method="post">
							<input type="hidden" name="operation" value="addcategory">
							<div class="form-group mt-3">
								<input type="text" class="form-control" name="title"
									placeholder="Add category title" required>
							</div>
							<div class="form-group mt-3">
								<textarea style="height: 150px" class="form-control"
									placeholder="Enter category Description" name="desc" required></textarea>
							</div>
							<div class="container text-center my-3">
								<button class="btn btn-outline-success">Add Category</button>
								<button type="button" class="btn btn-secondary m-2"
									data-bs-dismiss="modal">Close</button>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- category Modal ends-->
	<!-- product Modal starts-->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title " id="exampleModalLabel">Fill Product
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperation" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct">
						<div class="form-group mt-3">
							<input type="text" class="form-control" name="Product_Name"
								placeholder="Enter Product Name" required>
						</div>
						<div class="form-group mt-3">
							<textarea style="height: 150px" class="form-control"
								placeholder="Enter Product Description" name="product_desc"
								required></textarea>
						</div>
						<div class="form-group mt-3">
							<input type="number" class="form-control" name="Product_price"
								placeholder="Enter Product Price" required>
						</div>
						<div class="form-group mt-3">
							<input type="number" class="form-control" name="Product_discount"
								placeholder="Enter Product Discount" required>
						</div>
						<div class="form-group mt-3">
							<input type="number" class="form-control" name="Product_quantity"
								placeholder="Enter Product Quantity" required>
						</div>



						<div class="form-group mt-3">
							<select name="catId" class="form-control" id="">

								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

								<%
								}
								%>

							</select>
						</div>
						<div class="form-group mt-3">
							<label for="#picid">Add Product Image</label><br> <input
								type="file" id="picid" name="pic" required>
						</div>
						<div class="container text-center my-3">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary m-2"
								data-bs-dismiss="modal">Close</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- products Modal ends-->
	<%@include file="components/common_cart.jsp"%>
	
</body>
</html>