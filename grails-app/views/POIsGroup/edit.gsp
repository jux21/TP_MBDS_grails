<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POIsGroup.label', default: 'POIsGroup')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-POIsGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a href="${createLink(uri: '/POIsGroup/list')}"><g:message code="Liste des groupes"/></a></li>
            </ul>
        </div>
        <div id="edit-POIsGroup" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
                <h4>Modifier le POIsGroup ${this.POIsGroup.name}</h4>
                <div class="col s12 m12 l12">
                    <label>Nom</label>
                    <input value="${this.POIsGroup.name}" type="text" name="name" value="" required="" id="name" >
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
                <div class="col s12 m12 l12">
                    <label>POIs associés</label>
                    <div id="map"></div>


                        <script async defer
                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>

                    <script>
                        var locations = [

                        ];
                    </script>
                    <g:each in="${this.POIsGroup.pois}" var="custcust">
                        <script type="text/javascript">

                            var broadway = {
                                info: '<strong>${custcust.name}</strong><br>\
					<g:each in="${custcust.images}" var="custcustcust">\n' +
                                '                    <img src="${grailsApplication.config.urlImage}/${custcustcust.path}" width="250" height="200"/></li>\n' +
                                '                </g:each>',
                                lat: ${custcust.latitude},
                                long: ${custcust.longitude}
                            };

                            locations.push(broadway);

                        </script>
                    </g:each>
                        <script type="text/javascript">

                            function initMap() {


                                var map = new google.maps.Map(document.getElementById('map'), {
                                    zoom: 13,
                                    center: new google.maps.LatLng(43.6, 7),
                                    mapTypeId: google.maps.MapTypeId.ROADMAP
                                });

                                var infowindow = new google.maps.InfoWindow({});

                                var marker, i;

                                for (i = 0; i < locations.length; i++) {
                                    marker = new google.maps.Marker({
                                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                        map: map
                                    });
                                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                        return function () {
                                            infowindow.setContent(locations[i][0]);
                                            infowindow.open(map, marker);
                                        }
                                    })(marker, i));
                                }
                            }
                            google.maps.event.addDomListener(window, "load", initialize());
                        </script>
                    <g:each in="${this.POIsGroup.pois}" var="custcust">
                        <ul>
                            <li>${custcust.name}</li>
                        </ul>
                    </g:each>
                    <label>Ajouter des points d'intêret dans le groupe :</label>
                    <g:select name="pois"
                              from="${pois}"
                              value="${this.POIsGroup.pois*.id}"
                              optionKey="id"
                              multiple="true" />
                </div>
                <a class="waves-effect waves-light btn right">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </a>
                <%--<g:hiddenField name="version" value="${this.POIsGroup?.version}" />
                <fieldset class="form">
                    <f:all bean="POIsGroup"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>--%>
            </g:uploadForm>
        </div>
    </body>
</html>

<%--

<html>
   <head>
       <meta name="layout" content="main" />
       <g:set var="entityName" value="${message(code: 'POIsGroup.label', default: 'POIsGroup')}" />
       <title><g:message code="default.edit.label" args="[entityName]" /></title>
   </head>
   <body>
       <a href="#edit-POIsGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
       <div class="nav" role="navigation">
           <ul>
               <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
               <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
               <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
           </ul>
       </div>
       <div id="edit-POIsGroup" class="content scaffold-edit" role="main">
           <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
           <g:form resource="${this.POIsGroup}" method="POST">
               <div class="row">
               <h4>Modifier le POIsGroup ${this.POIsGroup.name}</h4>
               <div class="col s12 m12 l12">
                   <label>Nom</label>
                   <input value="${this.POIsGroup.name}" type="text" name="name" value="" required="" id="name" >
               </div>
               <div class="col s12 m12 l12">
                   <label>Images</label>
                   <g:each in="${this.POIsGroup.images}" var="custcust">
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
                   <label>POIs associés</label>
                   <g:each in="${this.POIsGroup.pois}" var="custcust">
                       <ul>
                           <li>${custcust.name}</li>
                       </ul>
                   </g:each>
                   <label>Ajouter des points d'intêret dans le groupe :</label>
                    <select name="groups" id="groups" multiple="">
                        <g:each in="${groups}" var="custcust" status="i">
                                <option value="${i}">${custcust}</option>
                        </g:each>
                    </select>

                   <g:select name="pois"
                             from="${pois}"
                             value="${this.POIsGroup.pois*.id}"
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

--%>