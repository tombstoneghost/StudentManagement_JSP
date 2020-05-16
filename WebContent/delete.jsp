<%@ page import="java.sql.*" %>
<%
		String name = request.getParameter("name");
		
		Class.forName("org.sqlite.JDBC");
		
		Connection conn = DriverManager.getConnection("jdbc:sqlite:/home/simardeep/eclipse-workspace/StudentManagement/MainDB");
		PreparedStatement ps = conn.prepareStatement("DELETE FROM StudentData WHERE name = ?");
		ps.setString(1, name);
		
		ps.executeUpdate();
		
%>

<script>
	alert("Data Updated");
</script>

<%
	response.sendRedirect("dashboard.jsp");
%>
