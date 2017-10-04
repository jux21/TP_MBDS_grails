<%--
  Created by IntelliJ IDEA.
  User: Utilisateur
  Date: 25/09/2017
  Time: 15:52
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'secUser.label', default: 'SecUser')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<a href="#list-secUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="list-secUser" class="content scaffold-list" role="main">
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create" action="create">Créer un utilisateur</g:link></li>
            <li><a href="${createLink(uri: '/SecUser/list')}"><g:message code="Liste des utilisateurs"/></a></li>
        </ul>
    </div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <tr><th>Nom</th><th>Mot de passe</th><th>Roles</th><th>Actions</th></tr>

    <g:each in="${secUsers}" var="cust">

        <sec:ifLoggedIn>
            <sec:ifAllGranted roles="ROLE_MODER">
                <tr>
                    <g:if test="${cust.authorities.size()==1 && cust.authorities.toString().contains('ROLE_USER')}">
                        <td><g:link class="show" action="show" resource="${cust}">${cust.username}</g:link></td>
                        <td>${cust.password}</td>
                        <td>
                            <g:each in="${cust.authorities}" var="custcust">
                                ${custcust.authority}
                            </g:each>
                        </td>
                        <td>
                            <f:display bean="SecUser" />
                            <g:form resource="${cust}" method="DELETE">
                                <fieldset class="buttons">
                                    <g:link class="edit" action="edit" resource="${cust}">modifier</g:link>
                                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </td>
                    </g:if>
                </tr>
            </sec:ifAllGranted>
        </sec:ifLoggedIn>

        <sec:ifLoggedIn>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <tr>
                    <td><g:link class="show" action="show" resource="${cust}">${cust.username}</g:link></td>
                    <td>${cust.password}</td>
                    <td>
                        <g:each in="${cust.authorities}" var="custcust">
                            ${custcust.authority}
                        </g:each>
                    </td>
                    <td>
                        <f:display bean="SecUser" />
                        <g:form resource="${cust}" method="DELETE">
                            <fieldset class="buttons">
                                <g:link class="edit" action="edit" resource="${cust}">modifier</g:link>
                                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                    </td>
                </tr>
            </sec:ifAllGranted>
        </sec:ifLoggedIn>

    </g:each>
    </table>
    <f:table collection="${secUserList}" />
</div>
</body>
</html>