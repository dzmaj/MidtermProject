<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="/WEB-INF/custom-functions.tld" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show beer</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/review.css"></link>
</head>
<body>
	<div class="container">
		<jsp:include page="../headersFooters/header.jsp"></jsp:include>
	</div>
	<br>
	<br>
	<br>
	<br>
	



	<div class="container-fluid">
		<h2>${beer.name}</h2>
		<br>
		<h4>${beer.typeOfBeer.typeName}</h4>
		Alcohol Content:
		<h4>${beer.alcoholContent}%</h4>

		
		<table class="table table-dark">
		<thead>
		  <tr>
		  <th>List of Bars</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach items="${beer.beerPrice}" var="beerPrice">
				<tr>
					<td><a href="getBar.do?id=${beerPrice.bar.id}">${beerPrice.bar.name}</a></td>
					<td><img src="${beerPrice.bar.logoUrl}" width ="100" height = "100">
				</tr>
		</c:forEach>
		</tbody>
	</table>
	<%-- 	<form action="updateBeerForm.do" method="GET">
			<button class="btn btn secondary" type="submit" name="id"
				value="${beer.id }">Edit Beer</button>

		</form> --%>
	


	
	
	
	
		
		<form action="updateBeerForm.do" method="GET">
				<button class="btn btn-outline-secondary" type="submit" name="id"
					value="${beer.id}">Edit Beer</button>
			</form>
		
		

		<br> <a href="getBrewery.do?id=${beer.brewery.id}">${beer.brewery.name}</a>
		<br> <img src="${beer.imageUrl}" width="200" height="200">
		
		${beer.description}

	</div>
	<div class="container-fluid">
<br>



<h2>Reviews</h2>
			<c:set var="sum" value="${0}"/>
<c:forEach items="${beer.beerRating}" var="ratings">
			<c:set var="counter" value="${counter + 1}"/>
			<c:set var="sum" value="${sum + ratings.starRating}"/>
			</c:forEach>
			<p>Average rating ${sum / counter} stars</p>
	<table class="table table-dark">
		<thead>
			<tr>
				<th>Rating</th>
				<th>Date</th>
				<th>Username</th>
				<th>Review</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${beer.beerRating}" var="ratings">
			
				<tr>
					<td>${ratings.starRating} stars</td>
					<td>${ratings.ratingDate}</td>
					<td><a href="getUser.do?id=${ratings.user.id}">${ratings.user.username}</a></td>
					<td>${ratings.review}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 


<br>
<br>
<br>


<c:if test="${! empty loginUser }">

	<form:form action="addedBeerRating.do" method="GET"
		modelAttribute="beerRating">
		<input path="beer" name="beerId" value="${ beer.id }" type="hidden">

		<fieldset class="rating">
			<input type="radio" id="star5" name="starRating" value=5 /><label
				class="full" for="star5" title="Awesome - 5 stars"></label> <input
				type="radio" id="star4" name="starRating" value=4 /><label
				class="full" for="star4" title="Pretty good - 4 stars"></label> <input
				type="radio" id="star3" name="starRating" value=3 /><label
				class="full" for="star3" title="Meh - 3 stars"></label> <input
				type="radio" id="star2" name="starRating" value=2 /><label
				class="full" for="star2" title="Kinda bad - 2 stars"></label> <input
				type="radio" id="star1" name="starRating" value=1 /><label
				class="full" for="star1" title="Sucks big time - 1 star"></label>
		</fieldset>
		<br>
		<br>


		
		<textarea name ="review" value="" placeholder="leave review here" rows="5" cols="60"></textarea>
		<br>
		<br>

		<button type=“submit”>Submit</button>
	</form:form>
</c:if>

<c:if test="${empty loginUser }">

				<form action="login" method="GET">
					<input type="hidden" name="" value="" /> <input type="submit"
						value="Login to add a review" />
				</form>


			</c:if>


	
	<!-- add to favorites -->
	<c:if test="${not empty loginUser }">
	<c:choose>
	<c:when test="${ ! fn:contains( loginUser.favoriteBeerList, beer ) }">
	<div>
		<form action="favoriteBeer.do" method="GET">
			<button class="btn btn-outline-secondary" type="submit" name="beerId"
					value="${beer.id}">Add to Favorites
			</button>
		</form>
	</div>
	</c:when>
	<c:otherwise>
		<form action="favoriteBeer.do" method="GET">
			<button class="btn btn-outline-secondary" type="submit" name="beerId"
					value="${beer.id}">Remove from Favorites
			</button>
		</form>
	</c:otherwise>
	</c:choose>
	</c:if>

	
	

		
	<%-- 	<form action="updateBeerForm.do" method="GET">
				<button class="btn btn-outline-secondary" type="submit" name="id"
					value="${beer.id}">Edit Beer</button>
			</form>
		 --%>
		



	

	<div class="container-fluid">
	


	<br>
	<br>
	<br>

	</div>
		<div class="container">
<%-- <jsp:include page = "../headersFooters/footer.jsp"></jsp:include> --%>
</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>



</body>
</html>
