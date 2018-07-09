<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>Formulaire des rencontres</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
</head>
<body>
	<div align="center">
		<h1>
			<spring:message code="creerRencontre.titre" />
			<br>
			<br>
		</h1>
	</div>
	<br>
		<form method="POST" action="goToValidSport" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<div align="center">
		<form:label path="rencontre.equipe1.sport.id"><spring:message code="creerRencontre.choixSport" /></form:label>
		<form:select path="rencontre.equipe1.sport.id">
			<form:option value="" label="" />
			<form:options items="${listeSports}" itemValue="id" itemLabel="nom" />
		</form:select>
		<input type="submit" class="btn btn-success" value="Valider" align="center" />
		</div>
		</form>
			
	<form method="POST" action="creer" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div align="center">
			<TABLE BORDER=0><!-- Tableau 4 colonnes et 6 lignes -->
				<tr>					
					<td nowrap>
					<form:label path="rencontre.equipe1.id"><spring:message code="creerRencontre.equipe1" /></form:label>
					<form:select path="rencontre.equipe1.id"  required="true">
						<form:option value="" label="" />
						<form:options items="${listeEquipes}" itemValue="id" itemLabel="nom" />
					</form:select>
					</td>
					<td></td>
					<td nowrap>
					<form:label path="rencontre.equipe2.id"><spring:message code="creerRencontre.equipe2" /></form:label>
					<form:select path="rencontre.equipe2.id" required="true" >
						<form:option value="" label="" />
						<form:options items="${listeEquipes}" itemValue="id" itemLabel="nom" />
					</form:select></td>
					<td></td>
				</tr>
				<tr>					
					<td nowrap><form:label path="rencontre.cote1">
							<spring:message code="creerRencontre.cote" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="rencontre.cote2">
							<spring:message code="creerRencontre.cote" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><form:input path="rencontre.cote1" class="form-control" /></td>
					<td><form:errors path="rencontre.cote1" cssClass="errors" /></td>
					<td><form:input path="rencontre.cote2" class="form-control" /></td>
					<td><form:errors path="rencontre.cote2" cssClass="errors" /></td>
				</tr>
				<tr>					
					<td nowrap><form:label path="rencontre.dateDebut">
							<spring:message code="creerRencontre.dateDebut" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="rencontre.dateFin">
							<spring:message code="creerRencontre.dateFin" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><form:input type="date" path="rencontre.dateDebut" class="form-control" /></td>
					<td><form:errors path="erreurDateDebut" cssClass="errors" /></td>
					<td><form:input type="date" path="rencontre.dateFin" class="form-control" /></td>
					<td><form:errors path="erreurDateFin" cssClass="errors" /></td>
				</tr>
			</TABLE>
		</div>
		<br>
		<div align="center">
			<input type="submit" class="btn btn-success" value="Valider" align="center" />
			<br>
			<br>
			<a href="goToMenuAdmin">Retour</a>
		</div>
	</form>
</body>
</html>