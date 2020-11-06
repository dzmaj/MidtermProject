<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	<link rel="stylesheet" href="css/brewery.css">
<title>Brewery edit</title>
</head>

<body>

<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>
<br><br><br><br>




<br><br><br><br>
	<table class="table table-striped table-hover">
		<thead class="thead thead-dark">
		  <tr>
			<th >Brewery Name</th>
			<th></th>
			<th></th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${breweries}" var="breweries">
				<tr>
					<td><a href="getBrewery.do?id=${breweries.id}">${breweries.name}</a></td>
					<td>${breweries.address.city } ${breweries.address.state}</td>
					<td><img src="${breweries.breweryLogoUrl}" width = "150" height = "150"></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
<div class="container-fluid">	


	<form action="addBrewery.do" method="GET">
	<button type="submit" class="btn btn-primary btn-lg btn-block">Add brewery button</button>
	</form>
	<br><br><br><br>
	
	

	
	
	
	
	<%-- <form action="addBrewery.do" method="GET">
		<input type="hidden" name="" value="" /> <input type="submit"
			value="Add Brewery" /> --%>
	</form><br>
	
	
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>


</body>
</html>