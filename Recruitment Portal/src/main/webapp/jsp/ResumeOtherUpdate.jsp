<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.PrintWriter"%>
<%@page import="java.io.*" %>
<%@page import="com.ideas.LoadConfigFile" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Update Form</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
</head>
<nav class="navbar navbar-inverse">
<div class="navbar-header">
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
    </button>
      <a class="navbar-brand page-scroll" href="/recruitmentportal/main.html">Ideas</a>
            </div>    
  <div>
     <ul class="nav navbar-nav">     
     <li><a href="/recruitmentportal/jsp/NewEntryForm.jsp">New Entry</a></li>
     <li><a href="/recruitmentportal/jsp/UpdateEntries.jsp">Update Information</a></li>
     <li><a href="#">Upload from Excel</a></li>
     </ul>
     
  <form name="information" action="/recruitmentportal/jsp/SearchResult.jsp"  method="post" >    
    <div class="navbar-form navbar-right" role="search">
    <div class="form-group">
      <input type="text" name="searchbox" class="form-control" placeholder="Search" required> 
    </div>
      <button type="submit" class="btn btn-default">Search</button>
    </div>
  </form>
</div>
</nav>


<body>
<h1 align="center" >Update Required Fields</h1>
<%

String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
PreparedStatement stat1= con.prepareStatement("SELECT * FROM employee WHERE id=?");
stat1.setString(1, id);
ResultSet result=stat1.executeQuery();
while(result.next())
{

String resume=result.getString("resumelink");
String other=result.getString("otherfile");


%>

<div class="container">
<div class="jumbotron">
<form name="infoForm" id="infoForm" class="ajax" action="/recruitmentportal/UpdateResumeOtherController?id=<%=id%>"  enctype="multipart/form-data" method="post" onsubmit="submitbtn.disabled = true; return true;">

<div class="container">


<div class="form-group" align="left">
<label>Upload other documents</label>
<input type="file" name="other" id="other" value = "<%=other%>"> 
</div>

<div class="form-group" align="left">
<label>Upload Resume</label>
<span class="glyphicon glyphicon-upload"></span>
<input type="file" name="resumelink" id="resumelink" value="<%=resume%>" > 
</div>


<input type="submit" value="Submit" class="btn btn-primary" name="submitbtn" id="submitbtn">
<input type="reset" value="Reset" class="btn btn-primary" id="Reset Button">
<a href="/recruitmentportal/main.html" class="btn btn-primary">Back</a>



</div>
</form>

</div>
</div>
<%} %>
</body>
</html>