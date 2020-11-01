<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beer Action</title>
</head>
<body>
<div class="container-fluid">
	<c:choose>
		<c:when test="${! empty beer }">
		<p>beer updated -- ${beer.name}</p><br>
			
		</c:when>
		<c:when test="${empty beer }">
			Beer deleted
			<br>
		</c:when>
		
		<c:otherwise>
			Unable to update beer
		</c:otherwise>
	</c:choose><br>
	
			<br>
			<form action="index.do" method="GET">
				<input type="hidden" name="" value="" /> <input type="submit"
					value="Home" />
			</form>
</div>

</body>
</html>