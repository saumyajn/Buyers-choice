<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<%@ include file="header.jsp"%>
<title>Cart</title>
<script>
	var dest3 = ${cart};
	angular.module('repeatSample', []).controller('repeatController',
			[ '$scope', function($scope) {

				$scope.destlist = dest3;
				$scope.value = 1;
				$scope.change = function(value) {
					$scope.products.qty = Number($scope.value);
				};

			} ]);
</script>
<style>
 #links{
 
    background-color: #EBC330;
  color:black;
    padding: 10px 40px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
</style>
<br><br><br><br><br><br>
<div class="container">
	<sf:form class="form-horizontal" method="post" action=""
		commandName="addcart" enctype="multipart/form-data">

		<div ng-app="repeatSample" ng-controller="repeatController">
			<table class="table table-bordered table-hover table-striped">
				<tr>
				<tr>

					<th>Image</th>
					<th>Destination name</th>
					<th>No of persons</th>
					<th>Price</th>

					<th>Total</th>



				</tr>

				<tr class="success" ng-repeat="dest in destlist">
					<td><img src="./resources/images/{{dest.destid}}.jpg"
						height="50px" width="50px"></td>
					<td>{{dest.destname}}</td>
					<td>{{dest.qty}}</td>

					<td>{{dest.price}}</td>





					<td>{{dest.qty*dest.price}}</td>


					<td><a href="Removecart?pid={{dest.destid}}">Remove</a></td>
					


				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>Grand Total:${sessionScope.grandtotal}</td>
				</tr>

			</table>
		</div></sf:form>







<center>
	<a href="AddToCartgoback">Edit</a>
	
</center>
<br>
<br>
<br>
<h3><b> Customer Information</b></h3>
<div class="row">
	<div class="col-xs-6 col-sm-6 col-md-6">
		<div class="form-group">
			<table class="table table-responsive">

				<tr>
				<thead>


					<th>Emailid</th>
					<th>Mobile</th>
					<th>Address</th>

					</tr>
				</thead>
				<td>${email}</td>
				<td>${mobile}</td>
				<td>${useraddr}</td>


			</table>

		</div>

	</div>
	
	<div class="col-md-4 ">
		<div class="pull-right">
			<h1><a href="OrderConfirmed" id="links">Confirm your Order</a></h1>

		</div>
</div>
</div>

	</div>