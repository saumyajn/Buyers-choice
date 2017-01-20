<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<title> Manage Suppliers</title>
<script>
	var dest = ${mylist};
	
	angular.module('repeatSample', []).controller('repeatController',
			function($scope) {
				$scope.destinations = dest;

				$scope.sort = function(keyname) {
					$scope.sortKey = keyname; //set the sortKey to the param passed
					$scope.reverse = !$scope.reverse; //if true make it false and vice versa
				}

			});
</script>
<div class="container">

<%@ include file="AdminHeader.jsp"%>
<c:if test="${!checkk}">


	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<sf:form role="form" action="Insertsupp" commandName="supplier"
					method="post">
					<h2><br><br>
						Add new Suppliers..</small>
					</h2>
					<hr class="colorgraph">
					<div class="row">
						<div class="row">
							<div class="col-xs-12">



								<div class="form-group col-xs-12">
									<sf:input path="suppliername" class="form-control input-lg"
										placeholder="Supplier Name" tabindex="1" pattern=".{3,15}"
										required="true" title="Supplier Name should be between 3 to 15"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="supplierdesc" class="form-control input-lg"
										placeholder="supplier Description" tabindex="1" pattern=".{3,50}"
										required="true"
										title="Supplier description should be between 3 to 50"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="price" class="form-control input-lg"
										placeholder="Price" tabindex="1" pattern=".{3,15}"
										required="true" title="minimum length for Price is 3"></sf:input>
								</div>

								<div class="col-xs-12">
									<input type="submit" value="Get-Supplier"
										class="btn btn-primary btn-block btn-lg" tabindex="7"><br><br>
								</div>
							</div>
						</div>
				</sf:form>
			</div>
		</div>
	</div>

</c:if>

<c:if test="${checkk}">


	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<sf:form role="form" action="plzNowUpdatedsupplier"
					commandName="supplier" method="post">
					<h2>
						 Update Suppliers..</small>
					</h2>
					<hr class="colorgraph">
					<div class="row">
						<div class="row">
							<div class="col-xs-12">


								<div class="form-group col-xs-12">
									<sf:input path="supplierid" class="form-control input-lg"
										placeholder="supplierID" tabindex="1" pattern=".{1,15}"
										required="true" title="minimum length for supplierIDis 3"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="suppliername" class="form-control input-lg"
										placeholder="supplierName" tabindex="1" pattern=".{3,15}"
										required="true" title="minimum length for supplierNameis 3"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="supplierdesc" class="form-control input-lg"
										placeholder="supplierDesc" tabindex="1" pattern=".{3,100}"
										required="true"
										title="minimum length for supplierDesc is 3"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="price" class="form-control input-lg"
										placeholder="price" tabindex="1"
										required="true" title="minimum length for price is 2"></sf:input>
								</div>

								<div class="col-xs-12">
									<input type="submit" value="Update-Supplier"
										class="btn btn-primary btn-block btn-lg" tabindex="7">
								</div>
							</div>
						</div>
				</sf:form>
			</div>
		</div>
	</div>
</c:if>




<div ng-app="repeatSample" ng-controller="repeatController">
	<div class="row">
		<h2>Search Supplier</h2>

		<div class="input-group col-md-4 has-feedback">
			<input type="text" class="search-query form-control"
				placeholder="Search" ng-model="searchText" /><i class="glyphicon glyphicon-search form-control-feedback"></i>

		</div>
	</div>
<br><br>
	<table class="table table-responsive">


		<thead>
			<tr>
				<th>Supplier id</th>

				<th>Supplier Name</th>
				<th>Description</th>
				<th>Price</th>

			</tr>
		</thead>

		<tr ng-repeat="destination in destinations|filter:searchText">


			<td>{{destination.supplierid}}</td>
			<td>{{destination.suppliername}}</td>
			<td>{{destination.supplierdesc}}</td>
			<td>{{destination.price}}</td>
			<td><a href="Deletesupp?did={{destination.supplierid}}"><button >Delete</button></a></td>
			<td><a href="plzUpdatedsupplier?did={{destination.supplierid}}"><button>Update</button></a></td>



		</tr>
	</table>

</div>





<%@ include file="footer.jsp"%>
</div>
