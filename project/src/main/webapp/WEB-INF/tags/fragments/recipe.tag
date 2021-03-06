<%@ tag body-content="empty" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="t" uri="/WEB-INF/tld/text.tld" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ attribute name="recipe" required="true" rtexprvalue="true" type="fr.cmm.domain.Recipe"%>


<div class="row">
    <div class="col-xs-12 col-sm-4">
        <div class="thumbnail">
            <img src="/image/${recipe.imageId}" alt="${fn:escapeXml(recipe.title)}">
        </div>
    </div>
    <div class="col-xs-12 col-sm-8">
        <h1>${fn:escapeXml(recipe.title)}</h1>
        <p>${fn:escapeXml(recipe.intro)}</p>
        <c:forEach items="${recipe.tags}" var="recipe_tag">
            <span class="label label-primary"><c:out value="${recipe_tag}" /></span>
        </c:forEach>
        <p><fmt:formatDate value="${recipe.date}" pattern="dd MMM yyyy" /></p>
        <c:if test="${not empty recipe.ingredients}">
            <ul>
                <c:forEach var="ingredient" items="${recipe.ingredients}">
                    <li>${fn:escapeXml(ingredient.name)} : ${fn:escapeXml(ingredient.quantity)} ${fn:escapeXml(ingredient.unit)}</li>
                </c:forEach>
            </ul>
        </c:if>
        <p>${t:text(recipe.text)}</p>
    </div>
    <sec:authorize access="hasRole('ADMIN')">
    <div class="col-xs-12 col-sm-2">
        <li><a href="/admin/recettes/edit?id=${recipe.id}">Editer</a></li>
    </div>
    </sec:authorize>
</div>