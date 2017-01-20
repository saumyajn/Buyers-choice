
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
<title>Log in!</title>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="container">
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<h3 align="center">
			Hello, Guest<br>
		</h3>
		<br>
		<div class="container">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

					<form action="perform_login" method="post">
						<div class="well">
							<div class="form-group col-xs-12">
								<input placeholder="Enter USER NAME" tabindex="1"
									pattern=".{3,15}" required id="username"
									title="Username should be between 3 to 15"></input>
							</div>
							<div class="form-group col-xs-12">
								<input type="password" placeholder="Enter password" tabindex="1"
									pattern=".{5,15}" required id="password" 
									title="password should be between 5 to 15"></input>
							</div>

						
							<div>
								<input type="submit" value="Log in" /> <br><a href="#">Lost
									your password?</a> <a href="usersignup">Register</a>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	
<br><br>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>