
<%
String mesage = (String) request.getSession().getAttribute("message");
if (mesage != null) {
%>

<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong>
		<%= mesage %>
	</strong>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
request.getSession().removeAttribute("message");
}
%>
<%
String mesage1 = (String) request.getSession().getAttribute("message1");
if (mesage1 != null) {
%>

<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<strong>
		<%= mesage1 %>
	</strong>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
request.getSession().removeAttribute("message1");
}
%>