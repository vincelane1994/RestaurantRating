<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
<link rel="stylesheet" href="/styles.css" />
</head>
<body>
	<h1>Sign up!</h1>
	<form action="/signup-confirmation">
	<p>
		<label>Name</label> <input type="text" name="name" required autocomplete="off"/>
	</p>
	<p>
		<label>Email</label> <input type="email" name="email" required autocomplete="off"/>
	</p>
	<p>
		<label>Password</label> <input type="password" name="password" required autocomplete="off"/>
	</p>
	<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>