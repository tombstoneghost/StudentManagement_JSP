<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME | STUDENT MANAGEMENT</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<% 
		response.setHeader("Cache-Control","no-cache, no-store");
	
	%>
	<h1 align="center" class="h1">Login To Your Dashboard</h1>
	<br>
	<form action="Login" method="POST" align="center" class="col-sm-4">
		<label class="form-label">Username</label>
		<input type="text" class="form-control" placeholder="Username" name="uname"required>
		<br>
		<label class="form-label">Password</label>
		<input type="password" class="form-control" placeholder="Password" name="pass" required>
		<br>
		<input class="btn btn-primary" type="submit" value="Login">
	</form>
</body>
</html>