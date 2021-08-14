<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<title>Enter Ninja</title>	
</head>

<body>
	<div class = "container-sm mx-auto mt-5">
  		<div class="card text-white bg-secondary mb-3" style="max-width: 50rem;">
			<div class="card-header">Create Ninja</div>
				<div class="card-body">
				
					<form:form action="/ninja/create" method="post" modelAttribute = "ninja">
						
						<div class="form-group my-3">
							<h5 class="card-title">
							<form:label path="dojo">Choose Dojo Location: </form:label>
							</h5>
							<form:errors path="dojo" class = "text-danger"/>
							<form:select path="dojo" class="form-select">
								<c:forEach items="${ allDojos }" var="dojo">
								<option value="${dojo.id}">"${dojo.name}"</option>
								</c:forEach>
							</form:select>
							
						</div>
						
        				<div class="form-group my-3">
        					<h5 class="card-title">
							<form:label path="firstName">First Name: </form:label>
							</h5>
							<form:errors path="firstName" class ="text-danger"/>
							<form:input path="firstName" class="form-control"/>
						</div>
						
						<div class="form-group my-3">
							<h5 class="card-title">
							<form:label path="lastName">Last Name: </form:label>
							</h5>
							<form:errors path="lastName" class ="text-danger"/>
							<form:input type= "text" path="lastName" class="form-control"/>
						</div>
						
						<div class="form-group my-3">
							<h5 class="card-title">
							<form:label path="age">Age: </form:label>
							</h5>
							<form:errors path="age" class ="text-danger"/>
							<form:input type= "text" path="age" class="form-control"/>
						</div>
						
						<div class="form-group my-3">
							<input type="submit" value="Submit" class="my-5 btn btn-warning">
						</div>
					</form:form>
				</div><!-- close card body -->
		</div><!-- close card -->	
 	</div><!-- close container -->
</body>
</html>