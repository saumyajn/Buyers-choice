
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
<title>Manage Packages</title>
<script>
	var packs = ${mylist};
	angular.module('repeatSample', []).controller('repeatController',
			function($scope) {
				$scope.packages = packs;

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
				<sf:form role="form" action="http://localhost:8080/BuyersChoice/Insertpackage" commandName="pack">
					<h2><br><br>
						Add new Packages...
					</h2>
					<hr class="colorgraph">
					<div class="row">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group col-xs-12">
									<sf:input path="packagename" class="form-control input-lg"
										placeholder="Package Name" tabindex="1" pattern=".{3,15}"
										required="true" title="minimum length for PackageName is 3"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="packagedescription"
										class="form-control input-lg"
										placeholder="Package Description" tabindex="1" pattern=".{3,100}" required="true"
										title="package description should be between 3 to 100"></sf:input>
								</div>
								
								<div class="form-group col-xs-12">
									<input type="submit" value="Add-Package"
										class="btn btn-primary btn-block btn-lg" tabindex="7"><br><br><br><br><br>
								</div>

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

				<sf:form role="form" action="http://localhost:8080/BuyersChoice/plzUpdatedpackage"
					commandName="pack" method="post">
					<h2><br><br>
						 Update the packages...
					</h2>
					<hr class="colorgraph">
					<div class="row">
						<div class="row">
							<div class="col-xs-12">


								<div class="form-group col-xs-12">

									<sf:input path="packageid" class="form-control input-lg"
										placeholder="Package Id" tabindex="1" pattern=".{1,15}"
										required="true" title="minimum length for package ID is 1"></sf:input>
								</div>

								<div class="form-group col-xs-12">
									<sf:input path="packagename" class="form-control input-lg"
										placeholder="Package Name" tabindex="1" pattern=".{3,15}"
										required="true" title="minimum length for package Name is 3"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="packagedescription"
										class="form-control input-lg"
										placeholder="Package Description" tabindex="1" pattern=".{3,100}" required="true"
										title="package description should be between 3 to 100"></sf:input>
								</div>
								
								<div class="col-xs-12">
									<input type="submit" value="Update-package"
										class="btn btn-primary btn-block btn-lg" tabindex="7">
								</div><br>
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
		<h2>Search packages</h2>

		<div class="input-group col-md-4 has-feedback">
			<input type="text" class="search-query form-control"
				placeholder="Search" ng-model="searchText" /><i class="glyphicon glyphicon-search form-control-feedback"></i>

		</div>
	</div><br><br>
	<table class="table table-responsive">


		<thead>
			<tr>
				<th>Package Id</th>
				<th>Package Name</th>
				<th>Package Description</th>
				
			</tr>
		</thead>
		<tr ng-repeat="package in packages|filter:searchText">

			<td>{{package.packageid}}</td>
			<td>{{package.packagename}}</td>
			<td>{{package.packagedescription}}</td>
				
			
			<td><a href="Deletepackage?did={{package.packageid}}"><button>Delete</button></a></td>
			<td><a href="plzUpdatedpackage?did={{package.packageid}}"><button>Update</button></a></td>
		</tr>
	</table>
</div></div>

<%@ include file="footer.jsp"%>
