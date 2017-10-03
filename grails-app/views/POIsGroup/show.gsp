<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'POIsGroup.label', default: 'POIsGroup')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-POIsGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><a href="${createLink(uri: '/POIsGroup/list')}"><g:message code="Liste des groupes"/></a></li>
            </ul>
        </div>
        <div id="show-POIsGroup" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <div class="row">
                <div class="col s12 m12 l12">
                    <h6>Nom</h6>
                    ${this.POIsGroup.name}
                </div>

                <div class="col s12 m12 l12">
                    <h6>Images</h6>
                    <g:each in="${this.POIsGroup.images}" var="custcust">
                        <ul>
                            <li><img src="${grailsApplication.config.urlImage}/${custcust.path}" width="250" height="200"/></li>
                        </ul>
                    </g:each>
                    <br>
                </div>

                <div id="map"></div>


                <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAoSZ9W5AfxbUyLI1XDC1cWFvVdFD4ytMI&signed_in=true&callback=initMap">
                </script>

                <script>
                    var locations = [

                    ];
                </script>


                <g:each in="${this.POIsGroup.pois}" var="custcust">

                    <script type="text/javascript">
                        locations.push( {
                            'lat':${custcust.latitude},
                            'long':${custcust.longitude},
                            'info': '<g:link class="show" action="show" resource="${custcust}"><strong>${custcust.name}</strong></g:link><g:each in="${custcust.images}" var="custcustcust">'+
                            '<img src="${grailsApplication.config.urlImage}/${custcustcust.path}" width="50" height="50"/>'+
                            '</g:each>'
                        } )
                    </script>
                </g:each>
                <script type="text/javascript">

                    function initMap() {

                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 13,
                            center: new google.maps.LatLng(locations[0]['lat'], locations[0]['long']),
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        });

                        var infowindow = new google.maps.InfoWindow({});

                        var marker, i;
                        for (i = 0; i < locations.length; i++) {
                            marker = new google.maps.Marker({
                                position: new google.maps.LatLng(locations[i]['lat'], locations[i]['long']),
                                map: map
                            });
                            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                return function () {
                                    infowindow.setContent(locations[i]['info']);
                                    infowindow.open(map, marker);
                                }
                            })(marker, i));
                        }
                    }
                    google.maps.event.addDomListener(window, "load", initMap());
                </script>

                <div class="col s12 m12 l12">
                    <h6>Linked POI</h6>
                    <g:each in="${this.POIsGroup.pois}" var="custcust">
                        <ul>
                            <li><g:link class="show" action="show" resource="${custcust}">${custcust.name}</g:link></li>
                        </ul>
                    </g:each>
                </div>

                <g:form resource="${this.POIsGroup}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.POIsGroup}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </body>
</html>
