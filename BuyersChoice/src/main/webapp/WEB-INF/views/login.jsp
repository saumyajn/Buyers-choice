
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<title>Log in!</title>
</head>
<body>
	<br>
	<br>
	<br>
	
		

		

	<div class="container">
	<%@ include file="/WEB-INF/views/header.jsp"%>
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
					<div
						style="float: right; font-size: 80%; position: relative; top: -10px">
						<a href="#">Forgot password?</a>
					</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

				
					<form  class="form-horizontal" role="form"
						action="perform_login" method="post">

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="username"
								type="text" class="form-control" name="username" value=""
								placeholder="username">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password"
								type="password" class="form-control" name="password"
								placeholder="password">
						</div>



						<div class="input-group">
							<div class="checkbox">
								<label> <input id="login-remember" type="checkbox"
									name="remember" value="1"> Remember me
								</label>
							</div>
						</div>


						<div style="margin-top: 10px" class="form-group">
							<!-- Button -->

				<div class="col-sm-12 controls"> 
				<input type="submit" value="Log in">
<!-- 								<a id="btn-login" href="#" class="btn btn-success" type="submit">Login </a> -->
							</div>
						</div>


						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a href="usersignup"> Sign Up Here
									</a>
								</div>
							</div>
						</div>
					</form>




					<br>
					<br>
				</div>
			</div>
		</div>
	</div><br><br>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>