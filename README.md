# TP_MBDS_grails
Repository du TP MBDS sur le framework Grails

Pour upload/download des images :
Démarrer un serveur apache sur le port 81 et modifier updateFolder et urlImage dans application.yml


Objectifs réalisés

Init

- POI et POIsGroup
Création de 100 POI répartis dans 10 POIsGroup dans une boucle for

- SecUser
Création de 18 SecUser : 5 administrateurs, 3 modérateurs et 10 utilisateurs
Certains SecUser ont 3, 2 ou un seul rôle (voir Bootstrap)


Sessions

- Utilisation de Spring Security
Page d'authentification personnalisée
Déconnexion : destruction de la session

- Gestion des rôles
Tout les SecUser de l'app peuvent modifier leur profil
Les administrateurs accèdent à toute les fonctionnalités de l'app
Les utilisateurs ne peuvent que consulter la liste des POIs et des POIsGroups (pas le menu utilisateur)
Les administrateurs peuvent voir et modifier tous les utilisateurs
Les modérateur peuvent seulement modifier les comptes user
Pas d'élévation de privilèges depuis un compte modérateur


CRUD

- POI Create / Read / Update / Delete
Lecture avec une google map et 1 marker qui ouvre une pop-up au clic avec Nom et Image
Lecture Nom, Description, Latitude, Longitude, Association avec 1 ou plusieurs groupe(s)
Creation, Update Nom, Description, Latitude, Longitude, Association avec 1 ou plusieurs groupe(s)
Suppression d'un POI, de ses références vers ses groupes et des ses images
POI et Groupes associés cliquables

- POIsGroup Create / Read / Update / Delete
Création d'un POIsGroup avec Nom
Creation, Update Nom, Association avec 1 ou plusieurs POI
Suppression d'un POIsGroup, de ses références vers ses POIs et des ses images
Groupes et POI associés cliquables

- SecUser Create / Read / Update
Affichage de la liste des utilisateurs et de leurs rôles
Create / Update UserName et Password chiffré
Delete secUser et son ou ses roles
Create SecUser with SecRole
Update secUser ajout de rôle ou suppression de rôle (l'un ou l'autre)

- Image
Upload d'images sur Apache
Download d'images depuis Apache
Gestion des multiples images sur les POI et Groupe pour l'affichage


UrlMapping
Redirection des pages index vers les vues list (POI/Group/SecUser)
Redirection des racines des controlleurs vers les vues list (POI/Group/SecUser)
Redirection de la racine du projet et de /login vers la page d'authentification ou d'index du projet


Bonus

- Google Map
Visualisation du POI sur une Google Map
Visualisation des POI du groupe sélectionné sur une Google Map
Centrage de la map sur le premier POI du groupe sur une Google Map
Mise à jour du POI en déplaçant le marker de la Google Map


- Perspectives d'amélioration
Permettre d'ajouter/supprimer des rôles en une seule action
Ajouter Ajax sur l'app + drag'n'drop
OK
