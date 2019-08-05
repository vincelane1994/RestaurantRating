<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/styles.css" />
</head>
<body>
	<div class="container">
		<h2>Add a Restaurant</h2>
		<form action="/add-confirmation" method="post">
		<table class="table">
			<tr>
				<th scope="row">Name</th>
				<td><input type="text" name="name" autofocus/></td>
			</tr>
			<tr>
				<th scope="row">Rating</th>
				<td><input type="number" name="rating" min="0"/></td>
			</tr>
			<tr>
				<th scope="row">Price</th>
				<td>
					<input type="text" name="price"/>
				</td>
			</tr>
			<tr>
				<th scope="row">Food Type</th>
				<td>
					<input type="text" name="foodType"/>
				</td>
			</tr>
		</table>
	<button type="submit" class="btn btn-primary">Submit</button>
		<a class="btn btn-danger" href="/">Cancel</a>
		</form>
	</div>
</body>
</html>