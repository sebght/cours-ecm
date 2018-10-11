<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fragments" tagdir="/WEB-INF/tags/fragments" %>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>Cooking miam miam : le site de cuisine à manger</title>

    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">Cooking Miam Miam</a>
            </div>

            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/recettes">Toutes les recettes</a></li>
                    <li><a href="/recette-du-moment">Recette du moment</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1>Des recettes, des idées pour déguster</h1>

        <c:forEach var="column" items="${columns}">
            <ul class="recipe-column">
                <c:forEach var="item" items="${column}">
                    <li>
                        <a href="/recette/${item.id}">
                            <div class="thumbnail">
                                <img src="/image/${item.imageId}" alt="${fn:escapeXml(item.title)}">
                                <div class="caption">
                                    <h3>${fn:escapeXml(item.title)}</h3>
                                    <p>${fn:escapeXml(item.intro)}</p>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:forEach>
    </div>

    <fragments:footer />

    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>