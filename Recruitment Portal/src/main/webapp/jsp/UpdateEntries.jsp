<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<br><br><br><br><br><br>
<h1 align="center">Search for Record to Update</h1>
<form name="information" action="/recruitmentportal/jsp/UpdateSearchResult.jsp"  method="post" >
<div class="row">	

<br>	
        <div class="col col-lg-4"></div>
        <div class="col col-lg-4">
		<input type="text" class="form-control" name="updatesearch" placeholder="Search"  required>
        </div>
        <div class="col col-lg-1">    
        <button class="btn btn-default"  type="Submit">Search</button>    
        </div>
        <div class="col col-lg-3"></div>   
</div>
</form>
<nav class="navbar navbar-inverse navbar-fixed-top" >
<div class="container-fluid">
<div class="navbar-header">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">                    
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
       </button>
   <a class="navbar-brand " href="/recruitmentportal/main.html">IDeas</a>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="/recruitmentportal/jsp/ViewAll.jsp">View</a></li>
        <li><a href="/recruitmentportal/jsp/NewEntryForm.jsp">New Entry</a></li>
        <li class="active"><a href="/recruitmentportal/jsp/UpdateEntries.jsp">Update Information</a></li>
        <li><a href="#">Upload from Excel</a></li>
        
      </ul>

    </div>
    </div>
 </nav>
 


</body>
</html>