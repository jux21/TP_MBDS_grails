<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-POI" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="edit-POI" class="content scaffold-edit" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.POI}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.POI}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.POI}" method="POST">
                <div class="row">
                <h4>Modifier le POI ${this.POI.name}</h4>
                <div class="col s12 m12 l12">
                    <label>Nom</label>
                    <input value="${this.POI.name}" type="text" name="name" value="" required="" id="name" >
                </div>
                <div class="col s12 m12 l12">
                    <label>Description</label>
                    <input  value="${this.POI.description}" type="text" name="description" value="" id="description">
                </div>
                <div class="col s12 m12 l12">
                    <label>Géolocalisation</label>
                    <div><input value="${this.POI.latitude}" type="text" name="latitude" id="latitude"></div>
                    <div><input value="${this.POI.longitude}" type="text" name="longitude" id="longitude"></div>
                </div>
                <div class="col s12 m12 l12">
                    <label>Images</label>
                    <g:each in="${this.POI.images}" var="custcust">
                        <ul>
                            <li><g:img dir="images" file="${custcust.path}" width="40" height="40"/></li>
                        </ul>
                    </g:each>
                     <div class="file-field input-field">
                      <div class="btn">
                        <span>Ajouter une image</span>
                        <input id="fileupload" type="file" name="fileupload" value="">
                      </div>
                      <div class="file-path-wrapper">
                        <input class="file-path validate" type="text" value="">
                      </div>
                    </div>
                </div>
                <div class="col s12 m12 l12">
                    <label>Groupes associés</label>
                    <g:each in="${this.POI.groups}" var="custcust">
                        <ul>
                            <li>${custcust.name}</li>
                        </ul>
                    </g:each>
                    <label>Associer le point d'intêret à d'autres groupes :</label>
                       <%-- <select name="groups" id="groups" multiple="">
                            <g:each in="${groups}" var="custcust" status="i">
                                    <option value="${i}">${custcust}</option>
                            </g:each>
                        </select> --%>

                    <g:select name="groups"
                              from="${groups}"
                              value="${this.POI.groups*.id}"
                              optionKey="id"
                              multiple="true" />
                </div>
                <a class="waves-effect waves-light btn right">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </a>
            </g:form>
        </div>
    </body>
</html>
