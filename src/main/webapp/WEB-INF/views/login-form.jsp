<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/styles.css" />
</head>
<body>
<h1>Log In</h1>
	<c:if test="${ not empty message }">
		<p class="message">${ message }</p>
	</c:if>
	<form action="/login" method="post">
	<p>
		<label>Email</label> <input type="email" name="email" required autocomplete="off"/>
	</p>
	<p>
		<label>Password</label> <input type="password" name="password" required autocomplete="off"/>
	</p>
	<button type="submit" class="btn btn-primary">Log In</button>
	<a class="btn btn-secondary" href="/">Cancel</a>
	</form>
</body>
</html>