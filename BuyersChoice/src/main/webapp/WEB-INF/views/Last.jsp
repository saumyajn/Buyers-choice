

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buyer's choice</title>
<jsp:include page="headerl.jsp"></jsp:include>
<script>
var order = ${data};
angular.module('myApp', []).controller('myCtrl',
			function($scope) {
				$scope.pro = order;
               
				
			});
</script>
</head>
<body>
<br><br><br><br>
<div class="container" ng-app='myApp'>
<div class="row thumbnail">
			<div class="col-12">
                 <h2><b>Thank you!!!!....Your Receipt is Here  </b></h2>
				<div ng-app="repeatSample" ng-controller="myCtrl">
				<table class="table table-hover">
				<thead>
							<tr><th>Order No </th>
								<th>{{pro.orderId}}</th>
							</tr>
							<tr>
								<th>Order Status</th>
								<th>{{pro.orderStatus}}</th>
							</tr>

							<tr>
								<th>Order Date</th>
								<th>{{pro.orderDate}}</th>
							</tr>
							<tr>
								<th>Customer  ID</th>
								<th>{{pro.userId}}</th>
							</tr>
                                  <tr>
								<th>Amount Payable</th>
								<th>{{pro.grandTotal}}</th>
							</tr>
							  <tr>
								<th>Payment Method</th>
								<th>{{pro.paymentMode}}</th>
							</tr>
							  <tr>
								<th>Delivery Address</th>
								<th>{{pro.address}}</th>
							</tr>
						</thead>

					</table>
						</div>
				</div>
			</div>
				
		</div>	
  <jsp:include page="footer.jsp"></jsp:include>