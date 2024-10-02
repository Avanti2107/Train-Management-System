<%@page import="java.sql.*" errorPage="exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="enter2.css">
</head>
<body>
	<div class="container">
		<h1>Find Trains</h1>
		<form action="view2.jsp">
			<div class="input-container">
				<label for="source">Source Station:</label> <select id="source"
					name="source" required>
					<option value="">Select Source</option>
					<!-- Source options can be fetched from a database -->
					<%
					String dbdriver = application.getInitParameter("dbdriver");
					String dburl = application.getInitParameter("dburl");
					String dbuser = application.getInitParameter("dbuser");
					String dbpass = application.getInitParameter("dbpass");

					Class.forName(dbdriver);
					Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
					String query = "select source from TrainDetails";
					PreparedStatement stat = con.prepareStatement(query);
					ResultSet rs = stat.executeQuery();
					while (rs.next()) {
					%>
					<option><%=rs.getString(1)%></option>
					<%
					}
					%>
				</select>
			</div>

			<div class="input-container">
				<label for="destination">Destination Station:</label> <select
					id="destination" name="destination" required>
					<option value="">Select Destination</option>
					<!-- Destination options can be fetched from a database -->
					<%
					String query2 = "select destination from TrainDetails";
					PreparedStatement stat2 = con.prepareStatement(query2);
					ResultSet rs2 = stat2.executeQuery();
					while (rs2.next()) {
					%>
					<option><%=rs2.getString(1)%></option>
					<%
					}
					stat.close();
					con.close();
					%>
				</select>
			</div>

			<button type="submit">Submit</button>
		</form>
	</div>

</body>
</html>