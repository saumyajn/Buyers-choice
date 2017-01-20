
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	

<title>Buyer's choice</title>
<link rel="shortcut icon" type="image/jpg" href="resouces/images/logo1.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	
	
	
	width: 100%;
	height: 500px;
	opacity: 50%;
	color: white;
}

.body {
	position: relative;
	left: 100px;
}
</style>
<body>

	<div class="container">
	
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<div id="myCarousel" class="carousel slider" data-ride="carousel"
			data-interval="4000" style="position: relative; top: 80px;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>

			</ol>

			<div class="carousel-inner" role="listbox">
				<div class="item active">

					<img src="resources/images/goa1.jpg" >
				</div>

				<div class="item">
					<img src="resources/images/Shimla.jpg">
				</div>
				<div class="item">
					<img src="resources/images/Kerala.jpg">
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <i class="fa fa-chevron-circle-left fa-2x"
				aria-hidden="true" style="position: relative; top: 240px;"></i><span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <i class="fa fa-chevron-circle-right fa-2x"
				aria-hidden="true" style="position: relative; top: 240px;"></i> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<br> <br> <br>

		<div class="body">
			<br>
			<h2>Hello,Guest</h2>
			Choose from amazing packages and deals.<br> <br>
			<div class="row">
				<div class="col-sm-3">
					<div class="thumbnail">
						<a href="#" target="_blank"> <img
							src="resources/images/honeymoonPackage.jpg" alt="Season-end"
							style="width: 200px; height: 200px">
							<div class="caption">Just for You2</div>

						</a>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank"> <img
							src="resources/images/familyPackage.jpg" alt="shoes"
							style="width: 270px; height: 200px">
							<div class="caption">FamilyTime</div>
						</a>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="thumbnail">
						<a href="#" target="_blank"> <img
							src="resources/images/friendsPackage.jpg" alt="accessory"
							style="width: 270px; height: 200px">
							<div class="caption">Travel the world with Friends</div>

						</a>
					</div>
				</div>
			</div>

		
		</div>
		</div>
</body>
</html><br>
<%@ include file="/WEB-INF/views/footer.jsp"%>
