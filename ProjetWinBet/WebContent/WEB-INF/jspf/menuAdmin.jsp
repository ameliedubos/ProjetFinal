<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Menu Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">

</head>
<body>

<div class="container">
<br><br>
<h2>
Bienvenue  <sec:authentication property="principal.admin.nom"/>
</h2>
<br><br>
<div text-align="center">
<table class="table table-striped"><!-- Tableau 7 colonnes et n lignes -->
    <tr>
    <td colspan="7"><h3>Liste des rencontres</h3></td>
    </tr>
    <th><spring:message code="menuAdmin.sport"/>
    </th>
    <th><spring:message code="menuAdmin.equipeDomicile"/>
    <spring:message code="menuAdmin.coteDomicile"/>
    </th>
    <th><spring:message code="menuAdmin.equipeExterieure"/>
    <spring:message code="menuAdmin.coteExterieure"/>
    </th>
    <th><spring:message code="menuAdmin.dates"/>
    </th>
    <th><spring:message code="menuAdmin.vainqueur"/>
    <spring:message code="menuAdmin.score"/>
    </th>
	<c:forEach items="${listeRencontres}" var="rencontre">
	    <tr>
	    <td><c:out value = "${rencontre.equipe1.sport.nom}"/></td>
	    <td><c:out value = "${rencontre.equipe1.nom}"/><br>
	        <c:out value = "${rencontre.cote1}"/>
	    </td>
	    <td><c:out value = "${rencontre.equipe2.nom}"/><br>
	    <c:out value = "${rencontre.cote2}"/>
	    <td><c:out value = "${rencontre.dateDebut}"/><br>
	    <c:out value = "${rencontre.dateFin}"/>
	    </td>
	    <td>
	    <c:if test="${empty rencontre.vainqueur}"><spring:message code="menuAdmin.encours"/></c:if>
	     <c:if test="${not empty rencontre.vainqueur}"><c:out value = "${rencontre.vainqueur}"/><br>
	    <c:out value = "${rencontre.score}"/></c:if>
	    </td>
	    <td><a href="<c:url value="/admin/goToModifierRencontre/${rencontre.id}" />">Modifier la rencontre</a></td>
	    <td><a href="<c:url value="/admin/supprimerRencontre/${rencontre.id}" />">Supprimer la rencontre</a></td>
	    </tr>
      </c:forEach>
     
 </table>    
</div>

<a href="<c:url value="/admin/goToCreerRencontre" />">Créer une rencontre</a>


<br>

<a href="<c:url value="/admin/goToAccueil" />">Retour à l'accueil</a>

</div>
</body>
</html>