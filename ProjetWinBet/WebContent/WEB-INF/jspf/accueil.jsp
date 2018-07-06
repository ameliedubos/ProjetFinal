<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<%-- <title><spring:message code="accueil.titre" /></title> --%>
<title>Home</title>
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
      <a class="navbar-brand titre">!!!WINBET!!!</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="<c:url value="/client/goToAccueil" />">Home</a></li>
      <li class="active"><a href="" data-toggle="modal" data-target="#myModal">R�glement</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/client/goToCreer" />"><span class="glyphicon glyphicon-user"></span> S'inscrire</a></li>
      <li><a href="<c:url value="/login" />"><span class="glyphicon glyphicon-log-in"></span> S'identifier</a></li>
      <li><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out"></span> Se d�connecter</a></li>
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
        <h4 class="modal-title">R�glement du site</h4>
      </div>
      <div class="modal-body">
        <p>Bienvenue chez WINBET!<br><br>Voici quelques informations concernant notre site.<br><br>
        Une fois inscrit, vous pourrez acc�der � toutes les focntionnalit�s afin de parier sur vos sports pr�f�r�s!<br>
        Lors de votre inscription, un montant maximal vous sera demand�, vous pourrez ensuite parier sur n'importe quelle rencontre non d�but�e tant que le montant pari� ne d�passe pas votre montant maximal.<br>
        Une fois la rencontre termin�e, vous pourrez acc�der aux r�sultats et � visualiser vos gains si vous �tes chanceux!!!
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div align="center">
<table>
<tr>
<td><img src="<c:url value="/static/images/image1.jpeg" />" width="300" /></td>
<td><img src="<c:url value="/static/images/image2.jpeg" />" width="500" /></td>
</tr>
</table>
</div>

<br>
<br>

-------------------Slogan----------------------------------------------------------
<br>
<br>

<div align="center">
<table>
<tr>
<td>Liste des sports:<br>

	<c:forEach var = "i" begin = "1" end = "3">
	    Sport <c:out value = "${i}"/><br>	
      </c:forEach>
      </td>
<td>
<div class="une">A la une aujourd'hui!!!!<br></div>
<div class="unedetail">
France-Uruguay<br>
Le 06 Juillet � 16h<br>
Faites vos paris!
</div>

</td>
</tr>
</table>
</div>


    

</div>
</body>
</html>