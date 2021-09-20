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
	<br>
	<%
	String msg = request.getParameter("msg");
	if ("invalid".equals(msg)) {
	%>
	<center>
		<font color="red" size="7">Something went wrong! Try Again</font>
	</center>
	<%
	}
	%>
	<%
	if ("valid".equals(msg)) {
	%>
	<center>
		<font color="red" size="7">Successfully Updated</font>
	</center>
	<%
	}
	%>
	<%
	if ("deleted".equals(msg)) {
	%>
	<center>
		<font color="red" size="7">Successfully Deleted</font>
	</center>
	<%
	}
	%>
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
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<tr>
				<%
				try {
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from donor");
					while (rs.next()) {
				%>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>

				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
				<td><a href="updateDonor.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
				<td><a href="deleteDonor.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
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