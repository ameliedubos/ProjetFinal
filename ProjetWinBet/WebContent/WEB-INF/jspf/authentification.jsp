<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="authentification.title" /></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
</head>
<body>

<div class="container">
<br>
	<h2>
		<spring:message code="authentification.title" />
	</h2>
	<br><br>
	<c:if test="${param.error}">
		<span class="error"><spring:message code="authentification.inconnu" /></span>
	</c:if>
	<div class="form-group">
	<form method="POST" action="<c:url value="/login" />">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<label for="username"><spring:message code="authentification.username"/></label>
		<input type="text" name="username" value="" class="form-control">
		<br>
		<label for="password"><spring:message code="authentification.password"/></label>
		<input type="password" name="password" value="" class="form-control">
		<br>
		<input type="submit" class="btn btn-primary" value="<spring:message code="authentification.submit" />" />
		&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger" href="<c:url value="/welcome/goToAccueil" />"><spring:message code="authentification.retour" /></a>
	</form>
	</div>
	</div>
</body>
</html>