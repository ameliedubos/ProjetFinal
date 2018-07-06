<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>Création de compte</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
</head>
<body>
<div class="background">
	<div align="center">
		<h1>
			<spring:message code="inscription.creation" />
		<br><br>
		</h1>
	</div>
	<br>
	<form method="POST" action="creer" modelAttribute="client">
<%-- 		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> --%>
		<div align="center">
			<TABLE BORDER=0>
				<tr>
					<td nowrap><form:label path="client.nom">
							<spring:message code="client.nom" />
						</form:label></td>
					<td><form:input path="client.nom" class="form-control" /></td>
					<td><form:errors path="client.nom" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.prenom">
							<spring:message code="client.prenom" />
						</form:label></td>
					<td><form:input path="client.prenom" class="form-control" /></td>
					<td><form:errors path="client.prenom" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.age">
							<spring:message code="client.age" />
						</form:label></td>
					<td><form:input path="client.age" class="form-control" /></td>
					<td><form:errors path="client.age" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.telephone">
							<spring:message code="client.telephone" />
						</form:label></td>
					<td><form:input path="client.telephone" class="form-control" /></td>
					<td><form:errors path="client.telephone" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.adresse.rue">
							<spring:message code="client.adresse.rue" />
						</form:label></td>
					<td><form:input path="client.adresse.rue" class="form-control" /></td>
					<td><form:errors path="client.adresse.rue" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.adresse.code">
							<spring:message code="client.adresse.code" />
						</form:label></td>
					<td><form:input path="client.adresse.code" class="form-control" /></td>
					<td><form:errors path="client.adresse.code" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.adresse.ville">
							<spring:message code="client.adresse.ville" />
						</form:label></td>
					<td><form:input path="client.adresse.ville" class="form-control" /></td>
					<td><form:errors path="client.adresse.ville" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.adresse.pays">
							<spring:message code="client.adresse.pays" />
						</form:label></td>
					<td><form:input path="client.adresse.pays" class="form-control" /></td>
					<td><form:errors path="client.adresse.pays" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.authentification.email">
							<spring:message code="authentification.username" />
						</form:label></td>
					<td><form:input path="client.authentification.email" class="form-control" /></td>
					<td><form:errors path="client.authentification.email" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><spring:message code="authentification.password" /></td>
					<td><form:password path="client.authentification.motDePasse" class="form-control"/></td>
					<td><form:errors path="client.authentification.motDePasse" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.montantMax">
							<spring:message code="client.montantMax" />
						</form:label></td>
					<td><form:input path="client.montantMax" class="form-control" /></td>
					<td><form:errors path="client.montantMax" cssClass="errors" /></td>
				</tr>
			</TABLE>
		</div>
		<br>
		<div align="center">
			<input type="submit" class="btn btn-success" value="Valider"
				align="center" /> <br> <br> <a href="goToAccueil">Retour</a>
		</div>
	</form>
	</div>
</body>
</html>