<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POI.label', default: 'POI')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><a href="${createLink(uri: '/POI/list')}"><g:message code="Liste des POI"/></a></li>
        </ul>
    </div>
        <div id="show-POI" class="content scaffold-show" role="main">


            <div id="map"></div>
            <script async defer
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap"></script>


            <script type="text/javascript">
                function initMap() {

                    var broadway = {
                        info: '<strong>${this.POI.name}</strong><br>\
					<g:each in="${this.POI.images}" var="custcust">\n' +
                        '                    <img src="${grailsApplication.config.urlImage}/${custcust.path}" width="250" height="200"/></li>\n' +
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
            </script>

            <div class="row">
            <h4>Point d'intêret ${this.POI.name}</h4>
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
                        <li><img src="${grailsApplication.config.urlImage}/${custcust.path}" width="250" height="200"/></li>
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
