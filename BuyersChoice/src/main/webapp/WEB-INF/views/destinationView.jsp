
<%@ include file="AdminHeader.jsp"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Manage Destinations</title>
<script>
	var dest1 = ${destlist};
	var dest2 = ${packlist};
	var dest3 = ${supplist};
	angular.module('repeatSample', []).controller('repeatController',
			function($scope) {
				$scope.destlist = dest1;//dest
				$scope.packlist = dest2;//package
				$scope.supplist = dest3;//supplier
				$scope.sort = function(keyname) {
					$scope.sortKey = keyname; //set the sortKey to the param passed
					$scope.reverse = !$scope.reverse; //if true make it false and vice versa
				}
			});
</script>
<div class="container" ng-app="repeatSample"
	ng-controller="repeatController">
	<%@ include file="AdminHeader.jsp"%>
	<c:if test="${!checkk}">

		<div class="container" ng-app="repeatSample">

			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<sf:form role="form" action="insertdest" commandName="dest"
						method="post" modelAttribute="dest" enctype="multipart/form-data">
						<h2>
							<br> <br>Add new Destinations..
						</h2>
						<hr class="colorgraph">
						<div class="row">


							<div class="form-group col-xs-12">

								<sf:input type="file" path="pimage"
									class="form-control input-lg" placeholder="file" tabindex="1"
									title="minimum length for image is 1" />

							</div>
							<div class="form-group col-xs-12">
								<sf:input path="destname" class="form-control input-lg"
									placeholder="destination name" tabindex="1" pattern=".{1,15}"
									required="true"
									title="Destination name should be between 1 to 15"></sf:input>
							</div>
							<div class="form-group col-xs-12">
								<sf:input path="destdesc" class="form-control input-lg"
									placeholder="description" tabindex="1" pattern=".{1,300}"
									required="true"
									title="Destination desc should be between 1 to 300"></sf:input>
							</div>
<div class="form-group col-xs-12">
									<sf:input path="price" class="form-control input-lg"
										placeholder="price" tabindex="1"
										required="true" title="minimum length for price is 2"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="stock" class="form-control input-lg"
										placeholder="stock" tabindex="1"
										required="true" title="minimum length for stock is 2"></sf:input>
								</div>
							<div class="form-group col-xs-6">
								<sf:label path="packagename">Package Name</sf:label>
								<sf:select path="packagename" class="form-control input-sm"
									ng-controller="repeatController">
									<option ng-repeat="destination in packlist"
										value="{{destination.packagename}}">{{destination.packagename}}</option>
								</sf:select>
							</div>


							<div class="form-group col-xs-6">
								<sf:label path="suppliername">Hotel Name</sf:label>
								<sf:select path="suppliername" class="form-control input-sm"
									ng-controller="repeatController">
									<option ng-repeat="destination in supplist"
										value="{{destination.suppliername}}">{{destination.suppliername}}</option>
								</sf:select>
							</div>


							<div class="col-xs-12">
								<input type="submit" value="Add destination"
									class="btn btn-primary btn-block btn-lg" tabindex="7">
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>

	</c:if>
	<div class="container">
		<c:if test="${checkk}">

			<div class="container" ng-app="repeatSample">

				<div class="row">
					<div
						class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<sf:form role="form" action="plzNowUpdateddest" commandName="dest"
							method="post">
							<h2>
								<br> <br>Update Destinations..
							</h2>
							<hr class="colorgraph">

							<div class="row">
								<div class="col-xs-12">

									<sf:input type="file" path="pimage"
										class="form-control input-lg" placeholder="file" tabindex="1"
										title="minimum length for image is 1" />
								</div>

								<div class="col-xs-12">
									<sf:input path="destid" class="form-control input-lg"
										placeholder="destid" tabindex="1" pattern=".{1,15}"
										required="true"
										title="Destination id should be between 1 to 15"></sf:input>
								</div>
								<div class="col-xs-12">
									<sf:input path="destname" class="form-control input-lg"
										placeholder="destname" tabindex="1" pattern=".{1,15}"
										required="true"
										title="Destination name should be between 1 to 15"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="destdesc" class="form-control input-lg"
										placeholder="description" tabindex="1" pattern=".{1,300}"
										required="true"
										title="Destination desc should be between 1 to 300"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="price" class="form-control input-lg"
										placeholder="price" tabindex="1"
										required="true" title="minimum length for price is 2"></sf:input>
								</div>
								<div class="form-group col-xs-12">
									<sf:input path="stock" class="form-control input-lg"
										placeholder="stock" tabindex="1"
										required="true" title="minimum length for stock is 0"></sf:input>
								</div>

								<div class="form-group col-xs-6">
									<sf:label path="packagename">Package Name</sf:label>
									<sf:select path="packagename" class="form-control input-sm"
										ng-controller="repeatController">
										<option ng-repeat="destination in packlist"
											value="{{destination.packagename}}">{{destination.packagename}}</option>
									</sf:select>
								</div>

								<div class="form-group col-xs-6">
									<sf:label path="suppliername">Hotel Name</sf:label>
									<sf:select path="suppliername" class="form-control input-sm"
										ng-controller="repeatController">
										<option ng-repeat="destination in supplist"
											value="{{destination.suppliername}}">{{destination.suppliername}}</option>
									</sf:select>
								</div>



								<div class="col-xs-12">
									<input type="submit" value="Update Dest"
										class="btn btn-primary btn-block btn-lg" tabindex="7">
								</div>
							</div>

						</sf:form>
					</div>
				</div>
			</div>
		</c:if>
	</div>


	<div class="row">
		<h2>Search Destinations</h2>

		<div class="input-group col-md-4 has-feedback">


			<input type="text" class="search-query form-control"
				placeholder="Search" ng-model="searchText" /><i
				class="glyphicon glyphicon-search form-control-feedback"></i>
		</div>
	</div>
	<br>
	<br>
	<table class="table table-responsive">


		<thead>
			<tr>
				<th>Id</th>
				<th>Dest Name</th>
				<th>Description</th>
				<th>Price(in Rs.)</th>
				<th>Stock</th>
				<th>Package name</th>
				<th>Hotel name</th>
				<th>Image</th>

			</tr>
		</thead>
		
		<tr ng-repeat="destination in destlist|filter:searchText">
			<td>{{destination.destid}}</td>
			<td>{{destination.destname}}</td>
			<td>{{destination.destdesc}}</td>
			<td>{{destination.price}}</td>
			<td>{{destination.stock}}</td>
			<td>{{destination.packagename}}</td>
			<td>{{destination.suppliername}}</td>
			<td><img src="resources/images/{{destination.destid}}.jpg"
				width="60px" height="50px"></td>
			<td><a href="Deletedest?pid={{destination.destid}}"><button type="button" class="btn btn-default">Delete</button></a></td>
			<td><a href="plzUpdateddest?pid={{destination.destid}}"><button type="button" class="btn btn-default">Update</button></a></td>
		</tr>
	</table>
</div>
<br>

<%@ include file="footer.jsp"%>