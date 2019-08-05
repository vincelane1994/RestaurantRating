<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="/styles.css" />
</head>
<body>
	<nav>
		<c:if test="${ empty user }">
		<a href="/login">Log in</a>
		<a href="/signup">Sign up!</a>
		</c:if>
		<c:if test="${ not empty user }">
		<a href="/logout">Log out</a>
		Welcome ${ user.name }
		</c:if>
	</nav>
	<div class="container">
		<h1>Restaurants</h1>
		<table class="table">
			<thead>
				<tr>
					<th>Rating</th>
					<th>Name</th>
					<th>Price</th>
					<th>Food Type</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="restaurant" items="${restaurant}">
					<tr>
						<td>${restaurant.rating}</td>
						<td>${restaurant.name}</td>
						<td>${restaurant.price}</td>
						<td>${restaurant.foodType}</td>
						<td>
							<a class="btn btn-secondary" href="/add-rating?id=${ restaurant.id }">+ 1</a>
							<a href="/remove-rating?id=${ restaurant.id }" class="btn btn-secondary">- 1</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td><a class="btn btn-primary" href="/add">Add</a></td>

				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>