<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show beer</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/review.css">
</head>
<body>
<div class="container">
<jsp:include page = "../headersFooters/header.jsp"></jsp:include>
</div>
<br>
<br>
<br>
<br>

<div class="container-fluid">

<h2>Reviews</h2>

			<c:set var="sum" value="${0}" />
			<c:forEach items="${beer.beerRating}" var="ratings">
				<c:set var="counter" value="${counter + 1}" />
				<c:set var="sum" value="${sum + ratings.starRating}" />
			</c:forEach>
			<p>Average rating for ${beer.name } is ${sum / counter} stars</p>
			
			<table class="table table-striped table-hover">
			<thead class="thead thead-dark">
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
							<td>
								<fmt:parseDate  value="${ratings.ratingDate}"  type="date" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" />
 								<fmt:formatDate type="date" value="${parsedDate }"/>
 							</td>
							<td><a href="getUser.do?id=${ratings.user.id}">${ratings.user.username}</a></td>
							<td>${ratings.review}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


<c:if test="${ ! empty loginUser }">
<h2>Add a review</h2>
	<br>

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

		<button type="submit" class="btn btn-primary">Submit</button>
	</form:form>
	</c:if>
	
	<c:if test="${ empty loginUser }">
	
	<form action="login" method="GET">
				<input type="hidden" name="" value="" /> <button type="submit" class="btn btn-primary">Login to add a review</button>
			</form><br>
			
			<form action="register.do" method="GET">
				<input type="hidden" name="" value="" /> <button type="submit" class="btn btn-primary">Create a user profile to leave a review</button>
			</form><br> 
	
	</c:if>
	
	<br>
	<br>
	<br>
	<form action="getBeer.do" method="GET">
				<input type="hidden" name="id" value="${beer.id}" /> 
				<button type="submit" class="btn btn-primary">Return to beer page</button>
			</form>
	
<div class="container-fluid">
<jsp:include page = "../headersFooters/footer.jsp"></jsp:include>
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
</div>
</body>
</html>