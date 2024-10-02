<%@page import="java.sql.*" errorPage="myexception.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="enter1.css">
</head>
<body>
	<form action="view1.jsp">
		<div class="container">
			<h1>Select Train Information</h1>
			<div class="dropdown-container">
				<label for="trainNumber">Select Train Number:</label> <select
					id="trainNumber" name="TrainNo">
					<option value="">Select Train</option>
					<%
				String dbdriver = application.getInitParameter("dbdriver");
				String dburl = application.getInitParameter("dburl");
				String dbuser = application.getInitParameter("dbuser");
				String dbpass = application.getInitParameter("dbpass");

				Class.forName(dbdriver);
				Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
				String query = "select TrainNo from TrainDetails";
				PreparedStatement stat = con.prepareStatement(query);
				ResultSet rs = stat.executeQuery();
				
				while (rs.next()) {
					String TrainNo=rs.getString("TrainNo");
				%>
					<option value="<%=TrainNo%>">
						<%=TrainNo%>
					</option>
					<%
				}
				stat.close();
				con.close();
				%>
				</select>
			</div>
			<button id="submitBtn">Submit</button>
			<div id="trainDetails" class="info"></div>
		</div>


	</form>

</body>
</html>