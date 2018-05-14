<%-- 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello World Java EE</title>
</head>
<body>
    <h1>Hello JSP and Servlet!</h1>
  
<form action="AppleHttpServlet" method="post">
    Enter your name: <input type="text" name="yourName" size="20">
    <input type="submit" value="Call Servlet" />
</form>
</body>
</html>

--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Instaread</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<nav class="navbar navbar-light nav-bar-bg">
		<div class="container-fluid">
			<div class="navbar-header">
				<span class="navbar-brand mb-0 h1">InstaRead</span>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="https://github.com/rsainaveen" target="_blank">About Me</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<section class="search-section">
			<div class="row">
				<div class="offset-md-2 col-md-7">
					<input class="searchBox" type="text"
						placeholder="Search Books or Author" id="searchQuery" />
				</div>
				<div class="col-md-3">
					<button type="button" class="btn btn-default btn-sm searchButton"
						id="searchBooks">Search Books</button>
				</div>
			</div>
		</section>
		<section class="list-section">
		<div class="row">
			<div class="list-group">
			
				
			</div>
		</div>
		</section>
	</div>
	<br>
	<div id="snackbar">Sorry, no results found with the given name.</div>
	<!-- <script src="//code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>  -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script> 
	
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script> -->
	<!-- <script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script> -->
	<script src="js/bootstrap.min.js"></script> 
	
	<script src="index.js" type="text/javascript"></script>
</body>
</html>