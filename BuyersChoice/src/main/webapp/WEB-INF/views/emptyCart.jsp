<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<title>Cart</title>
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
	<br>
<h1> CART IS EMPTY</h1>
	<div class="container">
		<h3><a href="userdest" id="links">Continue Shopping</a></h3>
</div>
<br>
	</div><br><br><br><br><br><br><br><br><br>
	<jsp:include page="footer.jsp"></jsp:include>