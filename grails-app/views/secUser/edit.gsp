<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'secUser.label', default: 'SecUser')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-secUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-secUser" class="content scaffold-edit" role="main">

            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.secUser}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.secUser}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.secUser}" method="PUT">
                <g:hiddenField name="version" value="${this.secUser?.version}" />
                <div class="row">
                    <h4>Modifer l'utilisateur ${this.secUser.username}</h4>
                    <p>Pour changer de mot de passe, supprimez le contenu crypté de l'ancien mot de passe ci-dessous puis écrivez le nouveau.</p>
                    <div class="col s12 m12 l12">
                        <label>Nom d'utilisateur</label>
                        <input value="${this.secUser.username}" type="text" name="username" value="" required="" id="username" >
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Mot de pase</label>
                        <input value="${this.secUser.password}" type="text" name="password" value="" required="" id="password" >
                    </div>
                    <label>Rôle :</label>
                    <g:select name="secroles"
                              from="${secroles}"
                              value="${this.secUser.authorities*.id}"
                              optionKey="id" />
                </div>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
