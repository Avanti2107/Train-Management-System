<%@page import="java.sql.*" errorPage="exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="view1.css">
</head>
<body>
 <h1>Train Details</h1>
    <form>
		<%
		String TrainNo = request.getParameter("TrainNo");
		String dbdriver = application.getInitParameter("dbdriver");
		String dburl = application.getInitParameter("dburl");
		String dbuser = application.getInitParameter("dbuser");
		String dbpass = application.getInitParameter("dbpass");

		Class.forName(dbdriver);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
		String query = "select * from TrainDetails where TrainNo=?";
		PreparedStatement stat = con.prepareStatement(query);
		stat.setString(1, TrainNo);
		
		ResultSet rs = stat.executeQuery();
		while(rs.next()) {
		%>
		<table border='1'>
			<tr>
				<th>Train Name</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Route</th>
			</tr>
			<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
			</tr>
		</table>
		<%
		}  
		stat.close();
		con.close();
		%>
	</form>
    <a href="Index.jsp">Back to Index</a>
</body>
</html>