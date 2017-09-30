<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-POI" class="content scaffold-create" role="main">
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
            <g:uploadForm resource="${this.POI}" method="POST" enctype="multipart/form-data">
                <div class="row">
                <h4>Créer un point d'intêret</h4>
                <div class="col s12 m12 l12">
                    <label>Nom</label>
                    <input type="text" name="name" value="" required="" id="name">
                </div>
                <div class="col s12 m12 l12">
                    <label>Description</label>
                    <input type="text" name="description" value="" id="description">
                </div>
                <div class="col s12 m12 l12">
                    <label>Géolocalisation</label>
                    <div><input type="text" name="latitude" value="0,0" required="" id="latitude"></div>
                    <div><input type="text" name="longitude" value="0,0" required="" id="longitude"></div>
                </div>
                <div class="col s12 m12 l12">
                    <label>Images</label>
                     <div class="file-field input-field">
                      <div class="btn">
                        <span>Image</span>
                        <input id="fileupload" type="file" name="fileupload">
                      </div>
                      <div class="file-path-wrapper">
                        <input class="file-path validate" type="text" name="image">
                      </div>
                    </div>
                </div>
                <div class="col s12 m12 l12">
                    <label>Groupes associés</label>
                        <g:select name="groups"
                          from="${tp_mbds_grails.POIsGroup.all}"
                          value="${tp_mbds_grails.POIsGroup.all.getIndices()}"
                          optionKey="id"
                          multiple="true" />
                </div>
                <a class="waves-effect waves-light btn right"><input type="submit" name="create" class="save" value="Create" id="create"></a>
            </g:uploadForm>
        </div>
    </body>
</html>
