<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Menu Client</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">

</head>
<body>

<div class="container">
<h2>
Bienvenue <sec:authentication property="principal.client.nom"/>
</h2>
<br>
<a href="<c:url value="/client/goToCompte" />">Consulter son compte</a>
<br>
<a href="<c:url value="/client/goToListeRencontrePariees" />">Afficher la liste de mes rencontres pariées</a>
<br>
<a href="<c:url value="/client/goToListerencontreAVenir" />">afficher la liste des rencontres à venir</a>
<br>
<br>
<br>
<a href="<c:url value="/client/goToAccueil" />">Retour à l'accueil</a>

</div>
</body>
</html>