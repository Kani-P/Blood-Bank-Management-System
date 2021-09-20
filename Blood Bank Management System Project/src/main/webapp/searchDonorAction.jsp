<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 95%
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<center>
	
		<table id="customers">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Father Name</th>
				<th>Mother Name</th>
				<th>Mobile Number</th>
				<th>Gender</th>
				<th>Email</th>
				<th>Blood Group</th>
				<th>Address</th>
				
			</tr>
			
				<%
				try {
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					String bloodgroup=request.getParameter("bloodgroup");
					String sql="select * from donor where bloodgroup='"+bloodgroup+"'";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr>
				<td><%=rs.getInt("id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("father")%></td>
				<td><%=rs.getString("mother")%></td>
				<td><%=rs.getString("mobilenumber")%></td>
				<td><%=rs.getString("gender")%></td>
				<td><%=rs.getString("email")%></td>

				<td><%=rs.getString("bloodgroup")%></td>
				<td><%=rs.getString("address")%></td>
				
				
			</tr>
			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>

		</table>

	</center>

</body>
</html>