<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME | STUDENT MANAGEMENT</title>
</head>
<body>
	<% 
		response.setHeader("Cache-Control","no-cache, no-store");
	
	%>
	<form action="Login" method="POST">
		Enter Username: <input type="text" name="uname"><br>
		Enter Password: <input type="password" name="pass"><br>
		<input type="submit" value="login">
	</form>
</body>
</html>