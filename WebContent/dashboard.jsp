<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DASHBOARD | STUDENT MANAGEMENT</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-validate");
		
		if(session.getAttribute("username")==null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<h1>WELCOME TO YOUR DASHBOARD</h1>
	
	<form action="Logout" method="POST">
		<input type="submit" value="Logout">
	</form>
</body>
</html>