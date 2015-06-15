<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Database Information</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<h1 align="center">Table Showing content of all Database</h1>
<%
String name=request.getParameter("name");
String experience=request.getParameter("experience");
String designation=request.getParameter("designation");


	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	
	/*
    PreparedStatement stat2=con.prepareStatement("INSERT INTO employee (name, designation, experince) VALUES (?, ?, ?)");
	stat2.setString(1, name);
	stat2.setString(2, designation );
	stat2.setString(3, experience);
	stat2.executeUpdate();
	*/
	Statement stat1=con.createStatement();
	ResultSet result=stat1.executeQuery("SELECT * FROM employee");
	%>
	<div class="container" >
	<table class="table table-bordered">
		 <thead>
		  <tr>
		   <th>Name</th>
		   <th>Designation</th>
		   <th>Experience</th>
		 </tr>
		</thead>
		<tbody>
		<%
	while(result.next())
	{
		%>
		
		 <tr>
		  <td><%=result.getString("name") %></td>
		  <td><%=result.getString("designation") %></td>
		  <td><%=result.getString("experince") %>
		 </tr>
		
		<% 		
	}
		%>
		</tbody>
		</table>
		</div>
		<%
		stat1.close();
		con.close();
		%>
		

</body>
</html>