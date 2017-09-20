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
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Groupe de points d'intêret<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/POIsGroup/list">Afficher la liste des groupes</a></li>
                </ul>
            </li>
            </ul>
        </div>
    </div>

<main>
    <g:layoutBody/>
</main>

<footer>
    <div class="footer" role="contentinfo"></div>
    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>
</footer>

<ul id="slide-out" class="side-nav fixed">
    <li><div class="user-view">
        <div class="background">
            <g:img dir="images" file="office.jpg"/>
        </div>
        <a href="#!user"><g:img class="circle" dir="images" file="yuna.jpg"/></a>
        <a href="#!name"><span class="white-text name">John Doe</span></a>
        <a href="#!email"><span class="white-text email">jdandturk@gmail.com</span></a>
    </div></li>
    <li><a href="#!"><i class="material-icons">person</i>Modifier mon profil</a></li>
    <li><div class="divider"></div></li>
    <li><a class="subheader">TP Grails</a></li>
    <li><a class="waves-effect" href="#!">Objectifs réalisés</a></li>
</ul>

    <asset:javascript src="application.js"/>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${createLinkTo(dir:'javascripts',file:'materialize.min.js')}"></script>


</body>
</html>
