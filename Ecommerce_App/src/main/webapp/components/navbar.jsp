
<%@page import="com.entity.UserEntity"%>
<%
UserEntity nornal = (UserEntity) request.getSession().getAttribute("auth");
String name1 = "";
String type = "";
if (nornal != null) {
	name1 = (String) nornal.getUserName();
	type = (String) nornal.getUserType();
}
%>
<nav
	class="navbar navbar-expand-lg bg-body-tertiary custom-bg text-white">
	<div class="container ">
		<a class="navbar-brand" href="index.jsp">Ecommerce</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<%
				if (type.equals("admin")) {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admin.jsp">Home</a></li>

				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<%
				}
				%>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
				<li class="nav-item active"><a class="nav-link"
					aria-current="page" href="about.jsp">about</a></li>

			</ul>
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a
					class="nav-link position-relative" aria-current="page" href="#"
					data-bs-toggle="modal" data-bs-target="#cart"><svg
							xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
  <path
								d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z" />
  <path
								d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
</svg><span
						class="position-absolute top-3 start-95 translate-middle badge rounded-pill bg-danger cart-items "></span><span
						class="visually-hidden">unread messages</span></a></li>
				<%
				if (nornal != null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					aria-current="page" href="home.jsp"><%=name1%></a></li>
				<li class="nav-item active"><a class="nav-link"
					aria-current="page" href="Logout">LogOut</a></li>
				<%
				} else {
				%>

				<li class="nav-item active"><a class="nav-link"
					aria-current="page" href="Login.jsp">Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					aria-current="page" href="Register.jsp">Register</a></li>

				<%
				}
				%>



			</ul>
		</div>
	</div>
</nav>