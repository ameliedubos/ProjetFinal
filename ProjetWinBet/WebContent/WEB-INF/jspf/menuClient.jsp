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
<br>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand titre"><spring:message code="accueil.titre" /></a>
    </div>
    <ul class="nav navbar-nav">
       <li class="active"><a href="<c:url value="/client/goToAccueil" />">Accueil</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="accueil.deconnecter" /></a></li>
    </ul>
  </div>
</nav>

<h2>
Bienvenue <sec:authentication property="principal.client.prenom"/>&nbsp;<sec:authentication property="principal.client.nom"/>
</h2>

<br><br>
<div align="center">
<img src="<c:url value="/static/images/multisports_bandeau.jpg" />" width="1000" />
</div>
<br><br>
<h3><a href="<c:url value="/client/goToCompte" />">Consulter/Modifier son compte</a>
<br><br>
<a href="<c:url value="/client/goToRencontresPariees" />">Afficher mes rencontres pariées</a>
<br><br>
<a href="<c:url value="/client/goToRencontresAvenir" />">Parier sur les prochaines rencontres</a>
</h3>


</div>
</body>
</html>