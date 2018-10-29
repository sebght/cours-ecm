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

    <link rel="stylesheet" href="/lib/jquery-ui/themes/smoothness/jquery-ui.min.css" />
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/lib/bootstrap-tokenfield/dist/css/bootstrap-tokenfield.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
<fragments:header/>

    <div class="container">
        <h1>Toutes nos recettes</h1>

        <form class="form-inline">
            <div class="form-group">
                <label for="tag">Tag</label>
                <input type="text" data-role="tags" data-service-url="/tags.json" data-limit="1" class="form-control" id="tag" placeholder="Tag" name="tag" value="${searchForm.getTag()}" style="width: 200px;">
            </div>
            <button type="submit" class="btn btn-default">Rechercher</button>
        </form>

        <ul class="search-results">
            <c:forEach var="item" items="${recipes}">
                <li>
                    <a href="/recette/${item.id}">
                        <div class="row">
                            <div class="col-xs-3">
                                <img src="/image/${item.imageId}" alt="${fn:escapeXml(item.title)}" style="height: 200px">
                            </div>
                            <div class="col-xs-9">
                                <h3>${fn:escapeXml(item.title)}</h3>
                                <p>${fn:escapeXml(item.intro)}</p>
                            </div>
                        </div>
                    </a>
                </li>
            </c:forEach>
        </ul>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="/recettes?pageIndex=${pagination.previousPageIndex}" aria-label="Précédente">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="/recettes?pageIndex=${pagination.pageIndex-2}">${pagination.pageIndex-3}</a></li>
                    <li><a href="/recettes?pageIndex=${pagination.pageIndex-1}">${pagination.pageIndex-2}</a></li>
                    <li class="active"><a href="/recettes?pageIndex=${pagination.pageIndex}"><span>${pagination.pageIndex-1}<span class="sr-only">(current)</span></span></a></li>
                    <li><a href="/recettes?pageIndex=${pagination.pageIndex+1}">${pagination.pageIndex}</a></li>
                    <li><a href="/recettes?pageIndex=${pagination.pageIndex+2}">${pagination.pageIndex+1}</a></li>
                    <li>
                        <a href="/recettes?pageIndex=${pagination.nextPageIndex}" aria-label="Suivant">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
    </div>

    <fragments:footer />

    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/jquery-ui/jquery-ui.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-tokenfield/dist/bootstrap-tokenfield.min.js"></script>
    <script src="/js/script.js"></script>
</body>
</html>