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
<br>

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

<div align="center">
<img src="<c:url value="/static/images/multisports_bandeau.jpg" />" width="300" />
</div>
<br>

<table class="table table-striped">
    <tr>
    <td colspan="5"><h3>Liste des rencontres à venir</h3></td>
    </tr>
        <tr>
    <th><spring:message code="rencontrePariees.sport"/>
    </th>
    <th><spring:message code="rencontrePariees.equipeDomicile"/><br>
    <spring:message code="rencontrePariees.coteDomicile"/>
    </th>
    <th><spring:message code="rencontrePariees.equipeExterieure"/><br>
    <spring:message code="rencontrePariees.coteExterieure"/>
    </th>
    <th><spring:message code="rencontrePariees.dates"/>
    </th>
    <th></th>
    </tr>
	<c:forEach items="${listeRencontres}" var="rencontre">
	    <tr>
	    <td>
	    <c:out value = "${rencontre.equipe1.sport.nom}"/>
	    </td>
	    <td><c:out value = "${rencontre.equipe1.nom}"/><br>
	        <c:out value = "${rencontre.cote1}"/>
	    </td>
	    <td><c:out value = "${rencontre.equipe2.nom}"/><br>
	    <c:out value = "${rencontre.cote2}"/>
	    </td>
	    <td><fmt:formatDate type = "date" value = "${rencontre.dateDebut}" />
	    <br>
	    <fmt:formatDate type = "date" value = "${rencontre.dateFin}" />
	    </td>
	    <td><a href="<c:url value="/client/goToPari/${rencontre.id}" />">Parier</a></td>
	    </tr>
      </c:forEach>
     
 </table>    


</div>
</body>
</html>