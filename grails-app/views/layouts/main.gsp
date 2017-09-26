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
                <span class="icon-bar">Hellow</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" data-activates="slide-out" class="button-collapse hide-on-large-only"><i class="material-icons">menu</i></a>
            <a class="navbar-brand" href="/#">
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
        <a class="grey-text text-lighten-4 right" href="#!">Cécile Melay</a>
        <a class="grey-text text-lighten-4 right" href="#!">Julien Hubert</a>
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
                Role(s) :
                <sec:ifAnyGranted roles="ROLE_ADMIN"> Administrateur</sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_MODER"> Modérateur</sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_USER"> Utilisateur</sec:ifAnyGranted>
            </span>
        </a>
    </div></li>
    <li><a href="/secUser/edit/ ${sec.loggedInUserInfo(field: 'id')}"><i class="material-icons">person</i>Modifier mon profil</a></li>
   <li><a >Déconnexion</a></li>
    <li><div class="divider"></div></li>
    <li><a class="subheader">TP Grails</a></li>
    <li>
        <!-- Modal Trigger -->
        <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Objectifs réalisés</a>

    </li>



</ul>

<!-- Modal Structure -->
<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
        <h5>Objectifs réalisés</h5>
        <div class="row">
            <div class="col s12 m12 l12">
                <div class="section">
                    <h5>Init</h5>
                    <div class="divider"></div>
                    <div class="section">
                        <h6>POI et POIsGroup</h6>
                        <p>Création de 10 POI et 10 POIsGroup dans une boucle for</p>
                    </div>

                    <div class="divider"></div>
                    <h6>Utilisation de Spring Security</h6>
                    <h5>Session</h5>
                    <div class="divider"></div>
                    <h6>Utilisation de Spring Security</h6>
                    <p>Page d'authentification OK</p>
                </div>
                <div class="divider"></div>
            </div>
            <div class="col s12 m12 l12">
                <h5>CRUD</h5>
                <div class="divider"></div>
                <h6>Create</h6>
                <div class="divider"></div>
                <h6>POI Create / Read / Update / Delete </h6>
                <p>Read OK</p>
                <p>Creation, Update Nom, Description, Association avec 1 ou plusieurs groupe(s) OK</p>
                <p>Suppression d'un POI et de ses références vers les groupes OK</p>
                <div class="divider"></div>
                <h6>POIsGroup Create</h6>
                <p>Création d'un POIsGroup avec Nom OK</p>
                <p>Association avec 1 ou plusieurs POI OK</p>
                <div class="divider"></div>
                <h6>SecUser Create / Read / Update</h6>
                <p>Affichage de la liste des utilisateurs de leurs rôles OK</p>
                <p>Create / Update UserName et Password OK</p>
                <h6>Ajout d'image</h6>
                <p>Téléchargement d'image sur Apache OK</p>
                <div class="divider"></div>
                <h5>Bonus</h5>
                <div class="divider">...</div>
                <h6>...</h6>
                <p>...</p>
            </div>
            <div class="divider"></div>
        </div>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Ok</a>
    </div>
</div>

    <asset:javascript src="application.js"/>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'materialize.min.js')}"></script>


</body>
</html>
