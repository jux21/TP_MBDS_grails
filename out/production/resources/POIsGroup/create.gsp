<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POIsGroup.label', default: 'POIsGroup')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-POIsGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-POIsGroup" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.POIsGroup}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.POIsGroup}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>


            <g:uploadForm resource="${this.POIsGroup}" method="POST">

                <div class="row">
                    <h4>Créer un groupe de points d'intêrets</h4>
                    <div class="col s12 m12 l12">
                        <label>Nom</label>
                        <input value="${this.POIsGroup.name}" type="text" name="name" value="" required="" id="name" >
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Ajouter des points d'intêret dans le groupe :</label>
                        <g:select name="pois"
                                  from="${tp_mbds_grails.POI.all}"
                                  value="${tp_mbds_grails.POI.all.getIndices()}"
                                  optionKey="id"
                                  multiple="true" />
                    </div>
                    <div class="col s12 m12 l12">
                        <label>Images</label>
                        <g:each in="${this.POIsGroup.images}" var="custcust">
                            <ul>
                                <li><li><img src="${grailsApplication.config.urlImage}/${custcust.path}" width="250" height="200"/></li>
                            </ul>
                        </g:each>
                        <div class="file-field input-field">
                            <div class="btn">
                                <span>Ajouter une image</span>
                                <input id="fileupload" type="file" name="fileupload" value="">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" name="image" value="">
                            </div>
                        </div>
                    </div>
                    <a class="waves-effect waves-light btn right">
                        <input class="save" type="submit" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </a>


            </g:uploadForm>
        </div>
    </body>
</html>
