<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Rencontres pariées</title>
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
<h2>
Bienvenue  <sec:authentication property="principal.client.nom"/>
</h2>
<br><br>
<div text-align="center">
<table class="table table-striped"><!-- Tableau 7 colonnes et n lignes -->
    <tr>
    <td colspan="9"><h3>Liste de vos paris</h3></td>
    </tr>
    <th><spring:message code="rencontrePariees.sport"/>
    </th>
    <th><spring:message code="rencontrePariees.equipeDomicile"/>
    <spring:message code="rencontrePariees.coteDomicile"/>
    </th>
    <th><spring:message code="rencontrePariees.equipeExterieure"/>
    <spring:message code="rencontrePariees.coteExterieure"/>
    </th>
    <th><spring:message code="rencontrePariees.dates"/>
    </th>
    
    <th><spring:message code="rencontrePariees.vainqueur"/>
    <spring:message code="rencontrePariees.score"/>
    </th>
    <th></th>
     <th><spring:message code="rencontrePariees.choixVainqueur"/>
    </th>
    <th><spring:message code="rencontrePariees.somme"/>
    </th>
    <th><spring:message code="rencontrePariees.resuPari"/>
    </th>
    <th><spring:message code="rencontrePariees.gainPari"/>
    </th>
	<c:forEach items="${listePariByClient}" var="pari">
	    <tr>
	    <td><c:out value = "${pari.rencontre.equipe1.sport.nom}"/></td>
	    <td><c:out value = "${pari.rencontre.equipe1.nom}"/><br>
	        <c:out value = "${pari.rencontre.cote1}"/>
	    </td>
	    <td><c:out value = "${pari.rencontre.equipe2.nom}"/><br>
	    <c:out value = "${pari.rencontre.cote2}"/>
	    <td><fmt:formatDate type = "date" value = "${pari.rencontre.dateDebut}" />
	    <br>
	    <fmt:formatDate type = "date" value = "${pari.rencontre.dateFin}" />
	    </td>
	    
	    <td><c:if test="${pari.rencontre.equipe1.id==pari.rencontre.vainqueur}"><c:out value = "${pari.rencontre.equipe1.nom}"/><br>
	    <c:out value = "${pari.rencontre.score}"/></c:if>
	    <c:if test="${pari.rencontre.equipe2.id==pari.rencontre.vainqueur}"><c:out value = "${pari.rencontre.equipe2.nom}"/><br>
	    <c:out value = "${pari.rencontre.score}"/></c:if>
	    </td>
	    <td>colonne vide</td>
	    <td><c:if test="${pari.rencontre.equipe1.id==pari.vainqueur}"><c:out value = "${pari.rencontre.equipe1.nom}"/><br>
	    </c:if>
	    <c:if test="${pari.rencontre.equipe2.id==pari.vainqueur}"><c:out value = "${pari.rencontre.equipe2.nom}"/><br>
	    </c:if>
	     </td>
	    <td><c:out value = "${pari.somme}"/>
	    </td>
	    <td>
	    <c:if test="${pari.rencontre.vainqueur==pari.vainqueur}"><spring:message code="rencontrePariees.gagne"/></c:if>
	    <c:if test="${pari.rencontre.vainqueur!=pari.vainqueur}"><spring:message code="rencontrePariees.perdu"/></c:if>
	    </td>
	    <td>
	    <c:if test="${pari.rencontre.vainqueur!=pari.vainqueur}">
	    <c:set var="gain" value="0" />
	    <c:out value = "${gain}"/>
	    </c:if>
	    <c:if test="${pari.rencontre.vainqueur==pari.vainqueur && pari.rencontre.vainqueur==pari.rencontre.equipe1.id}">
	    <c:set var="gain" value="${pari.somme * pari.rencontre.cote1}" />
	    <c:out value = "${gain}"/>
	    </c:if>
	    <c:if test="${pari.rencontre.vainqueur==pari.vainqueur && pari.rencontre.vainqueur==pari.rencontre.equipe2.id}">
	    <c:set var="gain" value="${pari.somme * pari.rencontre.cote2}" />
	    <c:out value = "${gain}"/><spring:message code="rencontrePariees.devise"/>
	    </c:if>
	    </td>
	    </tr>
	  </c:forEach>
 </table>    
</div>




<br>
<a href="<c:url value="/client/goToMenuClient" />">Retour au menu</a><br>
<a href="<c:url value="/client/goToAccueil" />">Retour à l'accueil</a>

</div>

</body>
</html>