<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<title> Manage Hotels</title>
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
						Add new Hotels..
					</h2>
					<hr class="colorgraph">
					
						<div class="row">
							<div class="col-xs-12">



								<div class="form-group col-xs-12">
									<sf:input path="suppliername" class="form-control input-lg"
										placeholder="Hotel Name" tabindex="1" pattern=".{3,15}"
										required="true" title="Supplier Name should be between 3 to 15"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="supplierdesc" class="form-control input-lg"
										placeholder=" Hotel Description" tabindex="1" pattern=".{3,50}"
										required="true"
										title="Description should be between 3 to 50"></sf:input>
								</div>
								

								<div class="col-xs-12">
									<input type="submit" value="Add Hotel"
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
						 Update Hotels..
					</h2>
					<hr class="colorgraph">
					
						<div class="row">
							<div class="col-xs-12">


								<div class="form-group col-xs-12">
									<sf:input path="supplierid" class="form-control input-lg"
										placeholder="Hotel ID" tabindex="1" pattern=".{1,15}"
										required="true" title="minimum length for hotel ID is 1"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="suppliername" class="form-control input-lg"
										placeholder="Hotel Name" tabindex="1" pattern=".{3,20}"
										required="true" title="Hotel Name should be between 3 to 20"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="supplierdesc" class="form-control input-lg"
										placeholder="Description" tabindex="1" pattern=".{3,100}"
										required="true"
										title="Description should be between 3 to 100"></sf:input>
								</div>
								

								<div class="col-xs-12">
									<input type="submit" value="Update-Hotel"
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
		<h2>Search Hotel</h2>

		<div class="input-group col-md-4 has-feedback">
			<input type="text" class="search-query form-control"
				placeholder="Search" ng-model="searchText" /><i class="glyphicon glyphicon-search form-control-feedback"></i>

		</div>
	</div>
<br><br>
	<table class="table table-responsive">


		<thead>
			<tr>
				<th>Hotel id</th>

				<th>Hotel Name</th>
				<th>Description</th>
				

			</tr>
		</thead>

		<tr ng-repeat="destination in destinations|filter:searchText">


			<td>{{destination.supplierid}}</td>
			<td>{{destination.suppliername}}</td>
			<td>{{destination.supplierdesc}}</td>
			
			<td><a href="Deletesupp?did={{destination.supplierid}}"><button type="button" class="btn btn-default">Delete</button></a></td>
			<td><a href="plzUpdatedsupplier?did={{destination.supplierid}}"><button type="button" class="btn btn-default">Update</button></a></td>



		</tr>
	</table>

</div>






</div>
<%@ include file="footer.jsp"%>