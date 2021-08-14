<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<title>Dojo Details</title>	
</head>

<body>
	<div class = "container-sm mx-auto mt-5">
		<div class="card text-white bg-secondary mb-3" style="max-width: 50rem;">
			<div class="card-header">${dojo.name} | ${dojo.id }</div>
				<div class="card-body">
					<table class="table table-light">
						<thead>
		  					<tr>
								<th scope="col">First Name</th>
								<th scope="col">Last Name</th>
								<th scope="col">Age</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items='${ dojo.ninjas }' var='ninja'>
							<tr>
								<td scope="row">${ninja.firstName}</td>
								<td scope="row">${ninja.lastName}</td>
								<td scope="row">${ninja.age}</td>	
							</tr>
							</c:forEach>  
						</tbody>
	  				</table>
	  			</div><!-- close card body -->
		</div><!-- close card -->
			<div class="card text-white bg-secondary mb-3" style="max-width: 18rem;">
  			<div class="card-header">Add Information</div>
  				<div class="card-body bg-light">
    				<h5 class="card-title text-dark">Want to Add a New Student?</h5>
    				<a href="/ninjas/new" class="card-text">Enter the info...</a>
    				<h5 class="card-title text-dark">Want to Add a New Dojo?</h5>
    				<a href="/dojos/new" class="card-text">Enter the info...</a>
  				</div><!-- close card body -->
		</div><!-- close card -->
 	</div><!-- close container -->
</body>
</html>