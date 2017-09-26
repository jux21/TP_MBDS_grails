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
                    <div id="map"></div>
                    <script async defer
                            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>


                    <script type="text/javascript">
                        function initMap() {

                            var broadway = {
                                info: '<strong>${this.POI.name}</strong><br>\
					<g:each in="${this.POI.images}" var="custcust">\n' +
                                '                    <g:img dir="images" file="${custcust.path}" width="40" height="40"/></li>\n' +
                                '                </g:each>',
                                lat: ${this.POI.latitude},
                                long: ${this.POI.longitude}
                            };

                            var locations = [
                                [broadway.info, broadway.lat, broadway.long, 0],
                            ];

                            var map = new google.maps.Map(document.getElementById('map'), {
                                zoom: 13,
                                center: new google.maps.LatLng(${this.POI.latitude}, ${this.POI.longitude}),
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            });

                            var infowindow = new google.maps.InfoWindow({});

                            var marker, i;

                            for (i = 0; i < locations.length; i++) {
                                marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                    map: map,
                                    draggable:true
                                });

                                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                    return function () {
                                        infowindow.setContent(locations[i][0]);
                                        infowindow.open(map, marker);
                                    }
                                })(marker, i));
                            }
                            google.maps.event.addListener(marker, 'dragend', function (event) {
                                document.getElementById("lat").value = event.latLng.lat();
                                document.getElementById("long").value = event.latLng.lng();
                            });
                        }
                        google.maps.event.addDomListener(window, "load", initialize());

                        function bugfix() {
                            document.getElementById("lat").value = document.getElementById("lat").value.replace(".", ",");
                            document.getElementById("long").value = document.getElementById("lat").value.replace(".", ",");
                        }
                    </script>
                    <div><input id="lat" value="${this.POI.latitude}" type="text" name="latitude"></div>
                    <div><input id="long" value="${this.POI.longitude}" type="text" name="longitude"></div>
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
                    <input onClick="bugfix()" class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </a>
            </g:form>
        </div>
    </body>
</html>
