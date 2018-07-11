<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="accueil.home" /></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
      <li class="active"><a href="" data-toggle="modal" data-target="#myModal"><spring:message code="accueil.regle" /></a></li>
      <sec:authorize access="hasRole('ROLE_CLIENT')">
      <li class="active"><a href="<c:url value="/client/goToMenuClient" />" ><spring:message code="accueil.menu" /></a></li>
      </sec:authorize>
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="active"><a href="<c:url value="/admin/goToMenuAdmin" />" ><spring:message code="accueil.menu" /></a></li>
      </sec:authorize>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/client/goToCreer" />"><span class="glyphicon glyphicon-user"></span> <spring:message code="accueil.inscrire" /></a></li>
      <li><a href="<c:url value="/securitycontroller/login" />"><span class="glyphicon glyphicon-log-in"></span> <spring:message code="accueil.identifier" /></a></li>
      <li><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="accueil.deconnecter" /></a></li>
    </ul>
  </div>
</nav>


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><spring:message code="accueil.reglesite" /></h4>
      </div>
      <div class="modal-body">
        <p>Bienvenue chez WINBET!<br><br>Voici quelques informations concernant notre site.<br><br>
        Une fois inscrit, vous pourrez accéder à toutes les focntionnalités afin de parier sur vos sports préférés!<br>
        Lors de votre inscription, un montant maximal vous sera demandé, vous pourrez ensuite parier sur n'importe quelle rencontre non débutée tant que le montant parié ne dépasse pas votre montant maximal.<br>
        Une fois la rencontre terminée, vous pourrez accéder aux résultats et à visualiser vos gains si vous êtes chanceux!!!
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div align="center">
<c:if test="${param.logout}">
	<span class="error"><spring:message code="authentification.logout" /></span>
	</c:if>
</div>

<div class="slogan" align="center">
Ici vous pouvez pariez sur tous vos sports préférés!!
</div>
<br>
<br>

<div align="center">
<img src="<c:url value="/static/images/multisports_bandeau.jpg" />" width="900" />
</div>

<br>
<br>

<div class="listesport" align="center">
   
      <c:forEach items="${listeSports}" var="sport">
 	  <c:out value="${sport.nom}" />&nbsp;,
 	  </c:forEach>
</div>
<br><br>

<div class="une">A la une aujourd'hui!!!!<br></div>
<div class="unedetail">
France-Angleterre<br>
Le 15 Juillet à 17h<br>
Faites vos paris!
</div>


</div>
</body>
</html>