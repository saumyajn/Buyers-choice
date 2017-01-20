<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script>
	var dest = ${destlist};
	angular.module('repeatSample', []).controller('repeatController',
			function($scope) {
				$scope.destlist = dest;
				$scope.sort = function(keyname) {
					$scope.sortKey = keyname; //set the sortKey to the param passed
					$scope.reverse = !$scope.reverse; //if true make it false and vice versa
				}
			});
</script>


<title>Destination</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<div ng-app="repeatSample" ng-controller="repeatController">

	<div class="container">
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<br>
		<br> <br> <br>
		<br>
		<div class="jumbotron"
			style="background-image: url(resources/images/fadedjumbo.jpg); background-repeat: no-repeat;">
			<h1 align="center" style="color: #ffffff;">
				<b>{{destlist.destname}}</b>
			</h1>
		</div>
		<br>
		<img src="resources/images/{{destlist.destid}}.jpg"
			style="float: left; margin: 0 30px 15px 20px; width: 500px; padding: 15px; border: 1px solid black; text-align: center;">

		<div class="caption">
			<h3>Id: {{destlist.destid}}</h3>
			<h3>Name: <b>{{destlist.destname}}</b></h3>
			<h3> {{destlist.destdesc}}</h3>
			<h3> {{destlist.suppliername}}</h3>
			<h3>Price: Rs. {{destlist.price}}</h3>
		</div>
		<c:if test="${not sessionScope.UserLoggedIn}">
		<a href="login"><button
				type="button" class="btn btn-default btn-lg">Go to
				{{destlist.destname}}</button></a>
		</c:if>
		<c:if test="${sessionScope.UserLoggedIn}">
		<a href="Carddetails?pid={{destlist.destid}}"><button
				type="button" class="btn btn-default btn-lg">Go to
				{{destlist.destname}}</button></a>
</c:if>
	</div>
	<br>
	<br><br>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>