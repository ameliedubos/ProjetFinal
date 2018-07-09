<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<h2>Bienvenue sur votre page administrateur "Nom admin"</h2>
<br><br>
<table class="table table-striped">
    <tr>
    <td colspan="4"><h3>Liste des rencontres</h3></td>
    </tr>
	<c:forEach items="${listeRencontres}" var="rencontre">
	    <tr>
	    <td>Rencontre <c:out value = "${rencontre.id}"/><br>
	    <c:out value = "${rencontre.equipe1.sport.nom}"/>
	    </td>
	    <td><c:out value = "${rencontre.equipe1.nom}"/><br>
	        <c:out value = "${rencontre.cote1}"/>
	    </td>
	    <td><c:out value = "${rencontre.equipe2.nom}"/><br>
	    <c:out value = "${rencontre.cote2}"/>
	    </td>
	    <td><a href="<c:url value="/admin/goToModifierRencontre/${rencontre.id}" />">Modifier la rencontre</a></td>
	    <td><a href="<c:url value="/admin/supprimerRencontre/${rencontre.id}" />">Supprimer la rencontre</a></td>
	    </tr>
      </c:forEach>
     
 </table>    


<a href="<c:url value="/admin/goToCreerRencontre" />">Cr�er une rencontre</a>
<br><br><br>
<a href="<c:url value="/admin/goToAccueil" />">Retour � l'accueil</a>

</div>
</body>
</html>