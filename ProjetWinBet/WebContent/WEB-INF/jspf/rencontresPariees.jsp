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

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand titre"><spring:message code="accueil.titre" /></a>
    </div>
    <ul class="nav navbar-nav">
       <li class="active"><a href="<c:url value="/client/goToAccueil" />">Accueil</a></li>
       <li class="active"><a href="<c:url value="/client/goToMenuClient" />">Mon Menu</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="accueil.deconnecter" /></a></li>
    </ul>
  </div>
</nav>
<br>

<div align="center">
<img src="<c:url value="/static/images/multisports_bandeau.jpg" />" width="300" />
</div>

<br>
<div text-align="center">
<table class="table table-striped table-bordered">
    <tr>
    <td colspan="10"><h3>Liste de vos paris</h3></td>
    </tr>
        <tr>
    <td colspan="5"><h4>Détail de la rencontre</h4></td>
    <td colspan="4"><h4>Détail du pari</h4></td>
    </tr>
    <tr>
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
     <th><spring:message code="rencontrePariees.choixVainqueur"/>
    </th>
    <th><spring:message code="rencontrePariees.somme"/>
    </th>
    <th><spring:message code="rencontrePariees.resuPari"/>
    </th>
    <th><spring:message code="rencontrePariees.gainPari"/><br>(<spring:message code="rencontrePariees.devise"/>)
    </th>
    </tr>
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
	    <td><c:if test="${pari.rencontre.equipe1.id==pari.vainqueur}"><c:out value = "${pari.rencontre.equipe1.nom}"/><br>
	    </c:if>
	    <c:if test="${pari.rencontre.equipe2.id==pari.vainqueur}"><c:out value = "${pari.rencontre.equipe2.nom}"/><br>
	    </c:if>
	     </td>
	    <td><c:out value = "${pari.somme}"/>
	    </td>
	    <td>
	    <c:if test="${empty pari.rencontre.vainqueur}"><spring:message code="rencontrePariees.vide"/></c:if>
	    <c:if test="${pari.rencontre.vainqueur==pari.vainqueur && not empty pari.rencontre.vainqueur}"><spring:message code="rencontrePariees.gagne"/></c:if>
	    <c:if test="${pari.rencontre.vainqueur!=pari.vainqueur && not empty pari.rencontre.vainqueur}"><spring:message code="rencontrePariees.perdu"/></c:if>
	    </td>
	    <td>
	    <c:if test="${empty pari.rencontre.vainqueur}">
	    <c:set var="gain" value="" />
	    <c:out value = "${gain}"/>
	    </c:if>
	    <c:if test="${pari.rencontre.vainqueur!=pari.vainqueur && not empty pari.rencontre.vainqueur}">
	    <c:set var="gain" value="0" />
	    <c:out value = "${gain}"/>
	    </c:if>
	    <c:if test="${pari.rencontre.vainqueur==pari.vainqueur && pari.rencontre.vainqueur==pari.rencontre.equipe1.id && not empty pari.rencontre.vainqueur}">
	    <c:set var="gain" value="${pari.somme * pari.rencontre.cote1}" />
	    <c:out value = "${gain}"/>
	    </c:if>
	    <c:if test="${pari.rencontre.vainqueur==pari.vainqueur && pari.rencontre.vainqueur==pari.rencontre.equipe2.id && not empty pari.rencontre.vainqueur}">
	    <c:set var="gain" value="${pari.somme * pari.rencontre.cote2}" />
	    <c:out value = "${gain}"/>
	    </c:if>
	    </td>
	    </tr>
	  </c:forEach>
 </table>    
</div>


</div>

</body>
</html>