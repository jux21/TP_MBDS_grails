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

<table class="highlight bordered">
    <thead>
    <tr><th>Nom</th><th>Lat.</th><th>Long.</th><th>Groupes associés</th><th>Description</th><th>Images</th><th>Actions</th></tr>
    </thead>
    <tbody>
    <g:each in="${pois}" var="cust">
        <tr>
            <td><g:link class="show" action="show" resource="${cust}">${cust.name}</g:link></td>
            <td>${cust.latitude}</td>
            <td>${cust.longitude}</td>
            <td>
                <ul>
                    <g:each in="${cust.groups}" var="custcust">
                            <li>${custcust.name}</li>
                    </g:each>
                </ul>
            </td>
            <td>${cust.description}</td>
            <td>
                <ul>

    <g:each in="${cust.images}" var="custcust">
        <img src="${grailsApplication.config.urlImage}/${custcust.path}" width="50" height="50"/>
    </g:each>


    </ul>

</td>
<td>
    <f:display bean="POI" />
    <g:form resource="${cust}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${cust}">modifier</g:link>
            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</td>
</tr>
</g:each>
</tbody>
</table>

<div class="nav" role="navigation">
<ul>
<li><g:link class="create" action="create">Créer un point d'intêret</g:link></li>
</ul>
</div>

</body>
</html>