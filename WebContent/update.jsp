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
		PreparedStatement ps = conn.prepareStatement("UPDATE StudentData SET name = ?, course = ?, fee = ? WHERE name = ?");
		ps.setString(1, name);
		ps.setString(2, course);
		ps.setString(3, fee);
		ps.setString(4, name);
		
		ps.executeUpdate();
		
%>

<script>
	alert("Data Updated");
</script>
			
<%
	}
	response.sendRedirect("dashboard.jsp");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EDIT | STUDENT MANAGEMENT</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1 class="h1" align="center">Student Update</h1>
	
	<br>
	<div class="row">
		<div class="col-sm-4">
			<form method="POST" action="#">
				
				<%
					Class.forName("org.sqlite.JDBC");
					Connection conn = DriverManager.getConnection("jdbc:sqlite:/home/simardeep/eclipse-workspace/StudentManagement/MainDB");
				
					String name = request.getParameter("name");
					
					PreparedStatement ps = conn.prepareStatement("SELECT * FROM StudentData WHERE name = ?");
					ps.setString(1, name);
					
					ResultSet rs = ps.executeQuery();
					
					while(rs.next()) {
					
				%>
			
			
				<div align="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("name") %>" name="sname" id="sname" required>
				</div>
				<div align="left">
					<label class="form-label">Course</label>
					<input type="text" class="form-control" placeholder="Course" value="<%= rs.getString("course") %>" name="course" id="course" required>
				</div>
				<div align="left">
					<label class="form-label">Fee</label>
					<input type="text" class="form-control" placeholder="Fee" value="<%= rs.getString("fee") %>" name="fee" id="fee" required>
				</div>
				
				<%
					}
				%>
				
				
				<br>
				<div align="right">
					<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" value="Reset" name="reset" class="btn btn-warning">
				</div>
				
				<div align="right">
					<p><a href="dashboard.jsp">Click to Back</a></p>
				
				</div>
			</form>
		</div>
	</div>
</body>
</html>