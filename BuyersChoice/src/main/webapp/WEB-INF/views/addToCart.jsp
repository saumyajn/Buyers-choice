<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<title>Cart</title>
<script>
	var dest3 = ${cart};
	angular.module('repeatSample', []).controller('repeatController',
			[ '$scope', function($scope) {

				$scope.destination = dest3;
				$scope.value;
				$scope.change = function(value) {
					$scope.products.qty = Number($scope.value);
				};

			} ]);
</script>
<style>
  #links{
 
    background-color: #EBC330;
  color:black;
    padding: 10px 35px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
</style>
<br><br><br><br><br><br>
<div class="container">

<c:choose>
<c:when test="${count ==0}">
			<br><h2>	CART is empty</h2> 
</c:when>

<c:otherwise>
			<sf:form class="form-horizontal" method="get" action="updateqty">
				<div ng-app="repeatSample" ng-controller="repeatController">
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>

								<th>Image</th>
								<th>Destination name</th>
								<th>No of persons</th>
								<th>Price</th>
								<th>Total</th>


							</tr>
						</thead>
						<c:forEach items="${cartitm}" var="destination">
							<form action="updateqty" method="get">
								<tr>
									<td><img
										src="resources/images/${destination.destid}.jpg"
										height="50px" width="50px"></td>
									<td>${destination.destname}</td>
									<td><input type="text" name="qty" value="${destination.qty}" />
										<input type="hidden" name="pid" value="${destination.destid}" />&nbsp;&nbsp;&nbsp;
										<input type="submit" value="update"></td>
									<td>${destination.price}</td>
									<td>${destination.qty*destination.price}</td>

									<td><a href="Removecart?pid=${destination.destid}">Remove</a></td>

								</tr>
							</form>
						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>


							<td>GrandTotal:${sessionScope.grandtotal}</td>
						</tr>
					</table></div>
			</sf:form><br>

<h3> <a	href="HeyOrderConfirmation" id="links">Place Your Order</a></h3><br>

		</c:otherwise>

	</c:choose>


		<h3><a href="userdest" id="links">Continue Shopping</a></h3><br><br><br><br><br><br><br><br>
</div>

	<br>
	<jsp:include page="footer.jsp"></jsp:include>