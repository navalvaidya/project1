<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

     
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
   
<title>Update Entries</title>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" >
<div class="container-fluid">
<div class="navbar-header">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">                    
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
       </button>
   <a class="navbar-brand " href="main.html">Ideas</a>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
        <li><a href="uploadui.html">New Entry</a></li>
        <li><a href="#">Update Information</a></li>
        <li><a href="#">Upload from Excel</a></li>
      </ul>

    </div>
    </div>
 </nav>
 
 <div class="container" align="centre">
<form name="information" action="http://localhost:8080/recruitmentportal/jsp/SearchResult.jsp"  method="post" >     
   <div class="navbar-form navbar-right" role="search">
     <div class="form-group">
     <input type="text" name="searchbox" class="form-control" placeholder="Search" required> 
     </div>
   <button type="submit" class="btn btn-default">Search</button>
   </div>
</form>
</div>


</body>
</html>