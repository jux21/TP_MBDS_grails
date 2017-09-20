<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="show-POI" class="content scaffold-show" role="main">
            <div class="row">
            <h4><g:message code="default.show.label" args="[entityName]" /></h4>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="col s12 m12 l12">
                <h6>Nom</h6>
                ${this.POI.name}
            </div>
            <div class="col s12 m12 l12">
                <h6>Description</h6>
                <p>${this.POI.description}</p>
            </div>
            <div class="col s12 m12 l12">
                <h6>Géolocalisation</h6>
                <div>latitude : ${this.POI.latitude}</div>
                <div>longitude : ${this.POI.longitude}</div>
            </div>
            <div class="col s12 m12 l12">
                <h6>Images</h6>
                <g:each in="${this.POI.images}" var="custcust">
                    <ul>
                        <li><g:img dir="images" file="${custcust.path}" width="40" height="40"/></li>
                    </ul>
                </g:each>
            </div>
            <div class="col s12 m12 l12">
                <h6>Groupes associés</h6>
                <g:each in="${this.POI.groups}" var="custcust">
                    <ul>
                        <li>${custcust.name}</li>
                    </ul>
                </g:each>
            </div>
            <div class="col s12 m12 l12">
                <h6>Actions</h6>
                <g:form resource="${this.POI}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.POI}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </body>
</html>
