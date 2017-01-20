
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script>
	
</script>
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<sf:form action="InsertUser" method="post" commandName="user"
			class="form-horizontal">
			<div class="container">
				<div ng-app="" ng-init="name='Guest'">
					<h3 align="center">
						<br>
						<br> Hello, {{name}}<br> <small>Please fill up
							the following fields:</small>
					</h3>
					<br>



					<!--  NAME -->
					<div class="form-group">
						<label class=" control-label col-sm-4" for="name"> Name:</label>
						<div class="col-sm-4">
							<sf:input type="text" path="name" class="form-control"
								ng-model="name" id="name" placeholder="Enter Name" />
						</div>
					</div>
					<!--gender and AGE -->
					<div class="form-group">

						<label for="gender" class=" control-label col-sm-4">Gender:</label>
						<label class="checkbox-inline"> <sf:radiobutton
								path="gender" id="usergender" value="female" />Female
						</label> <label class="checkbox-inline"> <sf:radiobutton
								path="gender" id="usergender" value="male" />Male
						</label> <label class="checkbox-inline"> <sf:radiobutton
								path="gender" id="usergender" value="others" />Others
						</label>
					</div>


					<!-- ADDRESS -->
					<div class="form-group">
						<label class="control-label col-sm-4" for="addr">Address:</label>
						<div class="col-sm-4">
							<sf:textarea class="form-control" path="address" rows="3"
								id="addr" placeholder="Enter Residential Address" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="phno">Phone
							no.:</label>
						<div class="col-sm-4">
							<sf:input type="number" path="mobile" class="form-control "
								id="phno" placeholder="Enter 10 digit phone no"
								pattern="^[789]\d{9}$" required="true" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="emailid">Email:</label>
						<div class="col-sm-4">
							<sf:input type="email" path="emailid" class="form-control"
								id="emailid" placeholder="Enter email address" />
						</div>
					</div>

					<!-- USERNAME AND PASSWORD -->
					<div class="well">
						<div class=" form-group">
							<label class=" control-label col-sm-4" for="username">UserName:</label>
							<div class="col-sm-4">
								<sf:input path="username" type="text"
									class="form-control col-sm-10" id="username"
									placeholder="Enter desired username(min length: 3)"
									pattern=".{3,15}" required="true" />
							</div>
						</div>
						<div class="form-group">
							<label class=" control-label col-sm-4" for="pswrd">Password:</label>
							<div class="col-sm-4">
								<sf:input type="password" path="password" class="form-control"
									id="pswrd" name="password" placeholder="Enter desired password" />
							</div>


						</div>
					</div>
					<input class="col-sm-2" type="submit" value="Submit"
						onclick="return confirm('Are you sure?')" />
				</div>
			</div>
		</sf:form>

	</div>
</body>
</html>

<%@ include file="/WEB-INF/views/footer.jsp"%>
