<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	if(request.getParameter("submit") != null) {
		String name = request.getParameter("sname");
		String course = request.getParameter("course");
		String fee = request.getParameter("fee");
		
		Class.forName("org.sqlite.JDBC");
		
		Connection conn = DriverManager.getConnection("jdbc:sqlite:/home/simardeep/eclipse-workspace/StudentManagement/MainDB");
		PreparedStatement ps = conn.prepareStatement("INSERT INTO StudentData VALUES(?,?,?)");
		ps.setString(1, name);
		ps.setString(2, course);
		ps.setString(3, fee);
		
		ps.executeUpdate();
		
%>

<script>
	alert("Data Saved");
</script>
			
<%
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DASHBOARD | STUDENT MANAGEMENT</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-validate");
		
		if(session.getAttribute("username")==null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<h1 class="h1" align="center">WELCOME TO YOUR DASHBOARD</h1>
	<br>
	<div class="row" style="margin: 0px auto">
		<div class="col-sm-4">
			<form method="POST" action="#">
				<div align="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required>
				</div>
				<div align="left">
					<label class="form-label">Course</label>
					<input type="text" class="form-control" placeholder="Course" name="course" id="course" required>
				</div>
				<div align="left">
					<label class="form-label">Fee</label>
					<input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>
				</div>
				<br>
				<div align="right">
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-warning">
				</div>
			</form>
		</div>
	
		<div class="col-sm-7">
			<div class="panel-body">
				<table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>Student Name</th>
							<th>Course</th>
							<th>Fee</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
						
						<%
							Class.forName("org.sqlite.JDBC");
						
							Connection conn = DriverManager.getConnection("jdbc:sqlite:/home/simardeep/eclipse-workspace/StudentManagement/MainDB");
							
							String query = "SELECT * FROM StudentData";
							Statement st = conn.createStatement();
							
							ResultSet rs = st.executeQuery(query);
							
							while(rs.next()) {
									String name = rs.getString("name");
						
						%>
						
						<tr>
							<td><%= rs.getString("name")%></td>
							<td><%= rs.getString("course")%></td>
							<td><%= rs.getString("fee")%></td>
							<td><a href="update.jsp?name=<%=name%>">Edit</a></td>
							<td><a href="delete.jsp?name=<%=name%>">Delete</a></td>
						</tr>
						<%
							}
						%>
					
				</table>
			</div>
		</div>
	
	
	</div>
	
	<div class="row">
		<form action="Logout" method="POST" class="col-sm-2 float-right">
			<input type="submit" value="Logout" class="btn btn-danger">
		</form>
	</div>
</body>
</html>