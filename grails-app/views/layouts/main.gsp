<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>

    <asset:stylesheet src="application.css"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <g:layoutHead/>
</head>
<body>
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" data-activates="slide-out" class="button-collapse hide-on-large-only user_menu right"><i class="material-icons">person</i></a>
            <a class="navbar-brand" href="/#" >
                <i class="fa grails-icon">
                    <asset:image src="grails-cupsonly-logo-white.svg"/>
                </i> Grails
            </a>
        </div>
        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/">Accueil</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Points d'intêret<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/POI/list">Afficher la liste des points d'intêret</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Groupes de points d'intêret<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/POIsGroup/list">Afficher la liste des groupes</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Utilisateurs<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/secUser/list">Afficher la liste des utilisateurs</a></li>
                    </ul>
                </li>


            </ul>


        </div>

    </div>

<main>
    <g:layoutBody/>
</main>

<footer class="page-footer">
    <div class="row">
        <div class="col l6 s12">
            <h5 class="white-text">TP : Création d’une plateforme de gestion de points d’intérêts</h5>
            <p class="grey-text text-lighten-4">M2 MBDS 2017-2018</p>
        </div>
        <div class="col l4 offset-l2 s12">
            <h5 class="white-text">Liens</h5>
            <ul>
                <li><a class="grey-text text-lighten-3" href="http://www.mbds-fr.org/">Site MBDS</a></li>
                <li><a class="grey-text text-lighten-3" href="https://grails.org/">Site Grails</a></li>
                <li><a href= "http://materializecss.com/" class="grey-text text-lighten-3">Site Materialazecss</a></li>
                <li><a class="grey-text text-lighten-3" href="http://getbootstrap.com/">Site Bootstarp</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="footer-copyright">
    <div class="container">
        M2 MBDS 2017-2018
        <a class="grey-text text-lighten-4 right" href="#!">- Cécile Melay</a>
        <a class="grey-text text-lighten-4 right" href="#!">Julien Hubert -</a>
    </div>
</footer>

<ul id="slide-out" class="side-nav fixed">
    <li><div class="user-view">
        <div class="background">
            <g:img dir="images" file="office.jpg"/>
        </div>
        <a href="#!user"><g:img class="circle" dir="images" file="yuna.jpg"/></a>
        <a href="/secUser/show/ ${sec.loggedInUserInfo(field: 'id')}"><span class="white-text name">${sec.loggedInUserInfo(field: 'username')} </span></a>
        <a href="#!email">
            <span class="white-text email">
                Role :
                <sec:ifAnyGranted roles="ROLE_ADMIN"> Administrateur</sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_MODER"> Modérateur</sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_USER"> Utilisateur</sec:ifAnyGranted>
            </span>
        </a>
    </div></li>
    <li><a class="subheader">TP Grails</a></li>
    <li>
        <!-- Modal Trigger -->
        <a class="waves-effect waves btn modal-trigger" href="#modal1">Objectifs réalisés</a>

    </li>
    <li><a class="subheader">Gérer son profil</a></li>
    <li><a href="/secUser/edit/ ${sec.loggedInUserInfo(field: 'id')}"><i class="material-icons">person</i>Modifier mon profil</a></li>
    <li><div class="divider"></div></li>
    <li>
        <g:link controller="SecUser" action="logOut">Déconnexion</g:link>
    </li>




</ul>

<!-- Modal Structure -->
<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
        <h4>Objectifs réalisés</h4>
        <div class="row">
            <ul class="achievements">
                <div class="col s12 m12 l12">
                    <h5>Init</h5>
                    <div class="divider"></div>
                    <h6>POI et POIsGroup</h6>
                    <li>Création de 10 POI et 10 POIsGroup dans une boucle for</li>
                    <h6>SecUser</h6>
                    <li>Création de 3 SecUser : 1 administrateur, 1 modérateur, 1 utilisateur</li>
                </div>
                <div class="col s12 m12 l12">
                    <h5>Sessions</h5>
                    <div class="divider"></div>
                    <h6>Utilisation de Spring Security</h6>
                    <li>Page d'authentification personnilisée</li>
                    <h6>Gestion des rôles</h6>
                    <li>Tout les SecUser de l'app peuvent modifier leur profil</li>
                    <li>Les administrateurs accèdent à toute les fonctionnalités de l'app</li>
                    <li>//TODO Les modérateurs ne peuvent pas voir les autres utilisateurs</li>
                    <li>//TODO Les utilisateurs ne peuvent que consulter la liste des POIs et des POIsGroups</li>
                </div>
                <div class="col s12 m12 l12">
                    <h5>CRUD</h5>
                    <div class="divider"></div>
                    <h6>POI Create / Read / Update / Delete </h6>
                    <li>Lecture avec une google map et 1 marker qui ouvre une pop-up au clic avec Nom et Image
                    <li>Lecture Nom, Description, Latitude, Longitude, Association avec 1 ou plusieurs groupe(s)</li>
                    <li>Creation, Update Nom, Description, Latitude, Longitude, Association avec 1 ou plusieurs groupe(s) </li>
                    <li>Suppression d'un POI, de ses références vers ses groupes et des ses images </li>
                    <h6>POIsGroup Create / Read / Update / Delete </h6>
                    <li>Création d'un POIsGroup avec Nom </li>
                    <li>Creation, Update Nom, Association avec 1 ou plusieurs POI </li>
                    <li>Suppression d'un POIsGroup, de ses références vers ses POIs et des ses images </li>
                    <h6>SecUser Create / Read / Update</h6>
                    <li>Affichage de la liste des utilisateurs de leurs rôles </li>
                    <li>Create / Update UserName et Password </li>
                    <li>//TODO Delete secUser</li>
                    <li>//TODO Update and Create SecUser with SecRole</li>
                    <h6>Ajout d'image</h6>
                    <li>Upload d'images sur Apache </li>
                    <li>Download d'images sur Apache </li>
                </div>
                <div class="col s12 m12 l12">
                    <h5>UrlMapping</h5>
                    <div class="divider"></div>
                    <h6>Clean URL</h6>
                    <li>//TODO Redirections et clean URLs (à spécifier)</li>
                </div>
                <div class="col s12 m12 l12">
                    <h5>Bonus</h5>
                    <div class="divider"></div>
                    <h6>Google Map</h6>
                    <li>Visualisation du POI sur une Google Map</li>
                    <li>Mise à jour du POI en déplaçant le marker de la Google Map</li>
                    <h6>Ajax</h6>
                    <li>//TODO ajouter Ajax sur l'app + drag'n'drop</li>
                </div>
            </ul>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves btn">OK</a>
    </div>
</div>

    <asset:javascript src="application.js"/>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'materialize.min.js')}"></script>


</body>
</html>
