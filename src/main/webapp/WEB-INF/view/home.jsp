<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<html>

<head>
<title>Employee</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="icon"
	href="https://my.milkapp.io/img/milk-icon-round_70@2x.png">

<style type="text/css">
body {
	padding: 20px;
}
</style>
</head>

<body>
	<h2>Employee Home Page</h2>
	<hr>

	<p>Welcome to the Milk Dairy !</p>

	<hr>

	<!-- display user name and role -->

	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>

	<hr>

	<!-- Add a link to point to /leaders ... this is for the managers -->

	<security:authorize access="hasRole('MANAGER')">

		<a href="${pageContext.request.contextPath}/api/customers">
			<button class="btn btn-info col-2">Get All Customers</button>
		</a>

		<hr>

		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership
				Meeting</a> (Only for Manager peeps)
		</p>
		<hr>
	</security:authorize>

	<!-- Add a link to point to /systems ... this is for the admins -->
	<security:authorize access="hasRole('ADMIN')">

		<a href="${pageContext.request.contextPath}/api/customers">
			<button class="btn btn-info col-2">Get All Customers</button>
		</a>

		<hr>
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems
				Meeting</a> (Only for Admin peeps)
		</p>
		<hr>
	</security:authorize>

	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">

		<input type="submit" class="btn btn-danger col-2" value="Logout" />

	</form:form>

</body>

</html>


