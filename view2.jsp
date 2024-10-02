<%@page import="java.sql.*" errorPage="exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="view2.css">
</head>
<body>
	<h1>Train Running Details Entry</h1>
	<form>
		<%
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String dbdriver = application.getInitParameter("dbdriver");
		String dburl = application.getInitParameter("dburl");
		String dbuser = application.getInitParameter("dbuser");
		String dbpass = application.getInitParameter("dbpass");

		Class.forName(dbdriver);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
		String query = "select * from TrainDetails where source=? and destination=?";
		PreparedStatement stat = con.prepareStatement(query);
		stat.setString(1, source);
		stat.setString(2, destination);

		ResultSet rs = stat.executeQuery();
		if (rs.next()) {
		%>
		<table border='1'>
			<tr>
				<th>Train No</th>
				<th>Train Name</th>
				<th>Route</th>
			</tr>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(5)%></td>
			</tr>
		</table>
		<%
		} else {
		out.println("No trains found");
		}
		stat.close();
		con.close();
		%>
	</form>
	<a href="Index.jsp">Back to Index</a>

</body>
</html>