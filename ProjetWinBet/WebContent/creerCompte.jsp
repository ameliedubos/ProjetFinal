<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>Création de compte</title>
<link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
	<div align="center">
		<h2>
			Création de compte
		</h2>
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
					<td nowrap><form:label path="client.rue">
							<spring:message code="client.rue" />
						</form:label></td>
					<td><form:input path="client.rue" class="form-control" /></td>
					<td><form:errors path="client.rue" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.codepostal">
							<spring:message code="client.codepostal" />
						</form:label></td>
					<td><form:input path="client.codepostal" class="form-control" /></td>
					<td><form:errors path="client.codepostal" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.ville">
							<spring:message code="client.ville" />
						</form:label></td>
					<td><form:input path="client.ville" class="form-control" /></td>
					<td><form:errors path="client.ville" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.pays">
							<spring:message code="client.pays" />
						</form:label></td>
					<td><form:input path="client.pays" class="form-control" /></td>
					<td><form:errors path="client.pays" cssClass="errors" /></td>
				</tr>
				<tr>
					<td nowrap><form:label path="client.montantmaxi">
							<spring:message code="client.montantmaxi" />
						</form:label></td>
					<td><form:input path="client.montantmaxi" class="form-control" /></td>
					<td><form:errors path="client.montantmaxi" cssClass="errors" /></td>
				</tr>
			</TABLE>
		</div>
		<br>
		<div align="center">
			<input type="submit" class="btn btn-success" value="Valider"
				align="center" /> <br> <br> <a href="home">Retour</a>
		</div>
	</form>
</body>
</html>