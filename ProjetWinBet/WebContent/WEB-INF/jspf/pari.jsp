<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<title>Pari</title>
<%-- <spring:message code="pari.titre.onglet" /> --%>
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
			<spring:message code="pari.titre" />
			<br>
			<br>
		</h1>
	</div>
	<br>


		
	<form method="POST" action="${pageContext.request.contextPath}/client/pari" modelAttribute="pari">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div align="center">
			<spring:message code="modifierRencontre.sport" />
			<c:out value="${pari.rencontre.equipe1.sport}" />
		</div>
		<div align="center">
			<TABLE BORDER=0>
			<form:input type="hidden" path="pari.rencontre.id" class="form-control" />
			<form:input type="hidden" path="pari.client.id" class="form-control" />
				<tr>					
					<td nowrap>
					<form:label path="pari.rencontre.equipe1.id">
							<spring:message code="creerRencontre.equipe1" />
					</form:label>
						</td>
					<td></td>
					<td nowrap><form:label path="pari.rencontre.equipe2.id">
							<spring:message code="creerRencontre.equipe2" />
							</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><c:out value="${pari.rencontre.equipe1}" /><form:input type="hidden" path="pari.rencontre.equipe1" class="form-control" /></td><td></td>
					<td><c:out value="${pari.rencontre.equipe2}" /><form:input type="hidden" path="pari.rencontre.equipe2" class="form-control" /></td>
				</tr>
<!-- 				<tr> -->
<%--  					<td><c:out value="${equipe1}" /><form:input type="hidden" path="pari.rencontre.equipe1.id" class="form-control" /></td>						 --%>
<%--  					<td><form:errors path="rencontre.equipe1.id" cssClass="errors" /></td> --%>
<%-- 					<td><c:out value="${equipe2}" /><form:input type="hidden" path="pari.rencontre.equipe2.id" class="form-control" /></td> --%>
<%-- 					<td><form:errors path="rencontre.equipe2.id" cssClass="errors" /></td> --%>
<!-- 				</tr> -->
				<tr>					
					<td nowrap><form:label path="pari.rencontre.cote1">
							<spring:message code="creerRencontre.cote" />
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="pari.rencontre.cote2">
							<spring:message code="creerRencontre.cote" />
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><c:out value="${pari.rencontre.cote1}" /><form:input type="hidden" path="pari.rencontre.cote1" class="form-control" /></td><td></td>
					<td><c:out value="${pari.rencontre.cote2}" /><form:input type="hidden" path="pari.rencontre.cote2" class="form-control" /></td>
	
				</tr>
				<tr>					
					<td nowrap><form:label path="pari.rencontre.dateDebut">
							<spring:message code="creerRencontre.dateDebut" />
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="pari.rencontre.dateFin">
							<spring:message code="creerRencontre.dateFin" />
						</form:label></td>
					<td></td>
				</tr>
	
				<tr>
					<td><c:out value="${pari.rencontre.dateDebut}" /><form:input type="hidden" path="pari.rencontre.dateDebut" class="form-control" /></td><td></td>
					<td><c:out value="${pari.rencontre.dateFin}" /><form:input type="hidden" path="pari.rencontre.dateFin" class="form-control" /></td>
	
				</tr>
				
				<tr>					
					<td nowrap><form:label path="pari.somme">
							<spring:message code="pari.somme" /> <span class="required">*</span>
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="pari.vainqueur">
							<spring:message code="pari.vainqueur" />
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><form:input path="pari.somme" class="form-control" /></td>
					<td><form:errors path="error.pari.somme" cssClass="errors" /></td>
					<td>
					<form:select path="pari.vainqueur"  required="true">
						<form:option value="${equipe1id}"  label="${equipe1}" />
						<form:option value="${equipe2id}"  label="${equipe2}" />
					</form:select></td>
					<td><form:errors path="error.pari.vainqueur" cssClass="errors" /></td>
				</tr>
			</TABLE>
		</div>
		<br>
		<div align="center">
			<input type="submit" class="btn btn-success" value="Valider" align="center" />
			<br>
			<br>
			<a href="../goToMenuClient">Retour</a>
		</div>
	</form>
</body>
</html>