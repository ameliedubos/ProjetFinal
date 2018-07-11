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
<jsp:useBean id="now" class="java.util.Date"/>
<div class="container">
<br><br>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand titre"><spring:message code="accueil.titre" /></a>
    </div>
    <ul class="nav navbar-nav">
       <li class="active"><a href="<c:url value="/admin/goToAccueil" />">Accueil</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="accueil.deconnecter" /></a></li>
    </ul>
  </div>
</nav>


<h2>
Bienvenue  <sec:authentication property="principal.admin.prenom"/>&nbsp;<sec:authentication property="principal.admin.nom"/>
</h2>

<div align="center">
<img src="<c:url value="/static/images/multisports_bandeau.jpg" />" width="200" />
</div>
<br><br>
<div class="error">
<c:if test="${message eq '0'}"><spring:message code="menuAdmin.supprime"/></c:if>
</div>
<div class="error">
<c:if test="${message eq '1'}"><spring:message code="menuAdmin.nonSupprime"/></c:if>
</div>
<br>
<div text-align="center">
<table class="table table-striped"><!-- Tableau 7 colonnes et n lignes -->
    <tr>
    <td colspan="7"><h3>Liste des rencontres</h3></td>
    </tr>
    <th><spring:message code="menuAdmin.sport"/>
    </th>
    <th><spring:message code="menuAdmin.equipeDomicile"/><br>
    <spring:message code="menuAdmin.coteDomicile"/>
    </th>
    <th><spring:message code="menuAdmin.equipeExterieure"/><br>
    <spring:message code="menuAdmin.coteExterieure"/>
    </th>
    <th><spring:message code="menuAdmin.dates"/>
    </th>
    <th><spring:message code="menuAdmin.vainqueur"/><br>
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
	    <td>
	    <fmt:formatDate type = "date" value = "${rencontre.dateDebut}" /><br>
	    <fmt:formatDate type = "date" value = "${rencontre.dateFin}" />
	    </td>
	    <td>
	    <c:if test="${rencontre.dateDebut > now}"><spring:message code="menuAdmin.nondebute"/></c:if>
	    <c:if test="${rencontre.dateDebut < now && rencontre.dateFin > now}"><spring:message code="menuAdmin.encours"/></c:if>
	    <c:if test="${rencontre.dateFin < now && empty rencontre.score}"><spring:message code="menuAdmin.enattente"/></c:if>
	    <c:if test="${rencontre.equipe1.id==rencontre.vainqueur}"><c:out value = "${rencontre.equipe1.nom}"/><br>
	    <c:out value = "${rencontre.score}"/></c:if>
	    <c:if test="${rencontre.equipe2.id==rencontre.vainqueur}"><c:out value = "${rencontre.equipe2.nom}"/><br>
	    <c:out value = "${rencontre.score}"/></c:if>
	    </td>
	    <td>
	    <c:if test="${rencontre.dateDebut > now}">
	    <a href="<c:url value="/admin/goToModifierRencontre/${rencontre.id}" />">Modifier la rencontre</a></td>
	    </c:if>
	    <c:if test="${rencontre.dateFin < now && empty rencontre.score}">
	    <a href="<c:url value="/admin/goToSaisirResultat/${rencontre.id}" />">Saisir le résultat</a></td>
	    </c:if>
	    <td>
	    <c:if test="${rencontre.dateDebut > now && empty rencontre.score}">
	    <a href="<c:url value="/admin/supprimerRencontre/${rencontre.id}" />">Supprimer la rencontre</a>
	    </c:if>
	    </td>
	    </tr>
	  </c:forEach>
 </table>    
</div>
<h3>
<a href="<c:url value="/admin/goToCreerRencontre" />">Créer une rencontre</a>
</h3>



</div>
</body>
</html>