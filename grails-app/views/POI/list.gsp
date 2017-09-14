<%--
  Created by IntelliJ IDEA.
  User: Cecile
  Date: 14/09/2017
  Time: 14:43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'POIsGroup.label', default: 'POIsGroup')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<table>
    <tr><th>Nom</th><th>Latitude</th><th>Longitude</th><th>Groupes associés</th><th>Description</th><th>Images</th></tr>
    <g:each in="${pois}" var="cust">
        <tr><td>${cust.name}</td></tr>
    </g:each>
</table>

</body>
</html>