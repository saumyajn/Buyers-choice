<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<style>
.navbar {
	background-color: #EBC330;
	height: 65px;
	-webkit-box-shadow: 10px 10px 10px #EBEBE0;
	-moz-box-shadow: 10px 10px 10px #EBEBE0;
	box-shadow: 10px 10px 10px #EBEBE0;
	z-index: 999;
}

.navbar .navbar-nav>li>a:hover, .navbar-default .navbar-nav>li>a:focus {
	background-color: #F1D56E;
	color: #a52a2a;
	padding: 22px;
}

.navbar .navbar-right>li>a:hover, .navbar-default .navbar-right>li>a:focus
	{
	background-color: #F1D56E;
	color: #00004D;
}

</style>


<nav class="navbar  navbar-fixed-top">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar" style="background-color: white;">
			<span class="icon-bar" style="background-color: black;"></span> <span
				class="icon-bar" style="background-color: black;"></span> <span
				class="icon-bar" style="background-color: black;"></span>
		</button>

		<a class=" navbar-brand" href="index.jsp" title="Buyer's Choice">
			<img src="resources/images/logoo.jpg" width="195px" height="50px"
			style="position: absolute; top: 5px; left: 50px;"> &nbsp &nbsp
			&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
			&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
			&nbsp

		</a>

	</div>
	<div class="collapse navbar-collapse" id="myNavbar"
		style="font-size: 18px;">
		<ul class="nav navbar-nav">
			<li><a href="userdest">Destinations</a></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${not sessionScope.UserLoggedIn}">
				<li><a href="login"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</c:if>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${sessionScope.UserLoggedIn}">
				<li><h3>Hello ${Userid}</h3></li>
				
					
						<li><a href="#"><span
								class="glyphicon glyphicon-shopping-cart"></span>
								Cart(0)</a></li>
					
			
				<li><a href="perform_logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>

			</c:if>
		</ul>
	</div>
</div>
</nav>
</html>