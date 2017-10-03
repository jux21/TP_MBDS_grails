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

<a href="#edit-POIsGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>

<table>
    <tr><th>Nom</th><th>Points d'intêret associés</th><th>Images</th><th>Actions</th></tr>
    <g:each in="${poisgroups}" var="cust">
        <tr>
            <td><g:link class="show" action="show" resource="${cust}">${cust.name}</g:link></td>
            <td>
                <g:each in="${cust.pois}" var="custcust">
                    <p>${custcust.name}</p>
                </g:each></td>
            <td>
                <g:each in="${cust.images}" var="custcust">
                    <img src="${grailsApplication.config.urlImage}/${custcust.path}" width="40" height="50"/>
                </g:each>
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
</table>

</body>
</html>