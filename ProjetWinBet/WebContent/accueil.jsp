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
      <a class="navbar-brand" href="#">!!!WINBET!!!</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/client/accueil">Home</a></li>
      <li class="active"><a href="#">Règlement</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/utilisateur/goToCreer" />"><span class="glyphicon glyphicon-user"></span> S'inscrire</a></li>
      <li><a href="<c:url value="/utilisateur/login" />"><span class="glyphicon glyphicon-log-in"></span> S'identifier</a></li>
      <li><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out"></span> Se déconnecter</a></li>
    </ul>
  </div>
</nav>

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
Liste des sports:<br>

	<c:forEach var = "i" begin = "1" end = "3">
	    Sport <c:out value = "${i}"/><p>	
      </c:forEach>
    

</div>
</body>
</html>