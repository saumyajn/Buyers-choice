<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<title>Destinations</title>
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

<style>
.crop {
	width: 150px;
	height: 90px;
	overflow: hidden;
}

.crop img {
	width: 400px;
	height: 200px;
	margin: -20px -50px -25px -85px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>


<div class="container" ng-app="repeatSample"
	ng-controller="repeatController">
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<br> <br> <br>
	<div ng-app="repeatSample" ng-controller="repeatController">
		<div class="row">
			<h2>Search </h2>
			<div class="input-group col-md-4 has-feedback">


				<input type="text" class="search-query form-control"
					placeholder="Search" ng-model="searchText" /><i
					class="glyphicon glyphicon-search form-control-feedback"></i>
			</div>
		</div>
		<br>
		<h2>All Destinations</h2>
		<table class="table table-responsive" cellspacing="7" >
			<tr ng-repeat="desti in destlist|filter:searchText" style="outline:1px solid black; ">
				<td class="crop"><a href="viewdest?pid={{desti.destid}}"><img
						src="resources/images/{{desti.destid}}.jpg" width="25%"
						height="25%"></a></td>
				<td><h4>
						<br> Id: {{desti.destid}} <br>
						<br> Name: {{desti.destname}}<br>
						<br> Description: {{desti.destdesc}}<br>

					</h4></td>
				
				<td><h4>
						<br> Price: Rs.{{desti.price}}<br> <br> Package
						Name: {{desti.packagename}}<br>
						<br> Supplier Name: {{desti.suppliername}}<br>
					</h4></td>
			</tr>
		</table>
	</div>

</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</html>