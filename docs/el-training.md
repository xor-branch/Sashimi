# el-formation

## À propos de ce programme

Ce document est un programme destiné aux nouveaux employés pour apprendre les bases de Ruby on Rails et des technologies associées qui sont essentielles dans Manyo.
Assurez-vous de suivre les étapes ci-dessous indépendamment de la capacité des nouveaux employés.
La période de formation n'est pas précisée.
La formation est terminée lorsque toutes les étapes sont terminées.

Les caractères suivants sont supposés dans ce programme.

-Nouvel employé: une personne qui a suivi ce programme.
-Supporters: Fournir une formation, des conseils et des conseils aux nouveaux employés. Il joue également un rôle de concertation avec les nouveaux collaborateurs et de définition des spécifications ensemble.

Le degré d'implication des supporters dans l'orientation est à la discrétion des supporters. La période de formation sera fixée à l'avance par les accompagnateurs, en tenant compte du niveau de compétence des nouveaux collaborateurs et du statut des projets internes.

## Aperçu

### Configuration requise

Dans ce programme, vous développerez un système de gestion des tâches en tant que problème.
Le système de gestion des tâches souhaite effectuer les opérations suivantes:

-Je veux enregistrer facilement ma tâche
-Je veux pouvoir fixer une date limite pour les tâches
-Je veux prioriser les tâches
-Je veux gérer le statut (pas commencé, commencé, terminé)
-Je veux affiner les tâches par statut
-Je veux rechercher une tâche par nom de tâche / description de tâche
-Je veux lister les tâches. Je souhaite trier sur l'écran de liste (en fonction de la priorité, de l'échéance de fin, etc.)
-Je veux étiqueter les tâches et les classer
-Je veux m'inscrire en tant qu'utilisateur et voir uniquement les tâches que j'ai enregistrées

De plus, afin de répondre aux exigences ci-dessus, nous aimerions avoir les fonctions de gestion suivantes.

-Fonction de gestion des utilisateurs

### Navigateur d'assistance

-Le navigateur de support suppose la dernière version de macOS / Chrome

### À propos de la configuration de l'application (serveur)

Nous aimerions que vous construisiez en utilisant les langages et middleware suivants (toutes les dernières versions stables).

-Rubis
-Ruby sur rails
-PostgreSQL

Pour le serveur, veuillez utiliser ce qui suit.

-Héroku

* Les exigences de performance et les exigences de sécurité ne sont pas spécifiées, mais faites avec une qualité générale.
  Si la réponse du site est trop mauvaise, veuillez l'améliorer.

## Objectif final de ce programme

À la fin de ce cursus, il est supposé que vous maîtriserez les éléments suivants:

-Pouvoir implémenter une application web basique à l'aide de Rails
-Une application Rails peut publier l'application en utilisant un environnement général
-Capacité d'ajouter des fonctions et de maintenir les données pour les applications Rails publiées
-Pour apprendre une série de GitHub PR et processus de fusion. Apprenez également les commandes Git nécessaires pour cela
  -Être capable de s'engager avec une granularité appropriée
  -Être capable d'écrire correctement les explications RP
  -Pouvoir répondre aux avis et apporter des révisions
-Pouvoir poser des questions aux membres de l'équipe et aux personnes liées (cette fois, ce sera un supporter) verbalement et discuter au bon moment

## Livres recommandés

Les livres suivants sont recommandés comme livres recommandés pour faire progresser le programme de formation.

- [Guide pratique d'apprentissage rapide Ruby on Rails 5 utilisable sur le terrain] (https://book.mynavi.jp/ec/products/detail/id=93905)

Dans le domaine du Guide pratique rapide Ruby on Rails 5 qui peut être utilisé sur le terrain, le système de gestion des tâches est le même que le programme de formation.
Par conséquent, je pense qu'il y a de nombreux points qui peuvent être utiles pour faire progresser cette formation.

Il explique également ce que la formation n'a pas couvert et comment procéder au développement de l'équipe. Veuillez l'utiliser comme référence.

## Collection de sujets utiles pour le développement

Nous l'avons résumé dans topics.md que nous ne pouvions pas inclure dans une étape de numéro spécifique, mais nous aimerions en profiter. Veuillez vous y référer et l'utiliser si nécessaire dans la mise en œuvre du programme.

## Étape d'affectation

### Étape 1: Créer un environnement de développement Rails

#### 1-1: Installez Ruby

-Veuillez installer la dernière version de Ruby en utilisant [rbenv] (https://github.com/rbenv/rbenv)
-Assurez-vous que la version Ruby est affichée avec la commande `ruby -v`

#### 1-2: Installation des rails

-Installer des rails avec la commande Gem
-Installez la dernière version de Rails
-Assurez-vous que la version Rails est affichée avec la commande `rails -v`

#### 1-3: Installer la base de données (PostgreSQL)

-Installez PostgreSQL avec votre système d'exploitation
  -Pour macOS, installez avec `brew` etc.

### Étape 2: Créez un référentiel sur GitHub

-Installez Git à portée de main
  -Pour macOS, installez avec `brew` etc.
  -Enregistrons le nom d'utilisateur et l'adresse e-mail avec `gitconfig`
-Pensez au nom de l'application (= nom du référentiel)
-Créons un référentiel
  -Obtenir un compte si vous n'en avez pas
  -Créer un référentiel vide dessus

### Étape 3: créer un projet Rails

-Créez les répertoires et fichiers minimum requis pour votre application avec la commande `rails new`
-Créez un répertoire appelé `docs` juste en dessous du répertoire du projet (répertoire du nom de l'application) créé par` rails new`, et validez ce fichier de document.
  -Pour garder les spécifications de cette application sous contrôle afin qu'elle puisse être consultée à tout moment
-Pousser l'application créée dans le référentiel créé sur GitHub
-Indiquer la version de Ruby à utiliser dans le `Gemfile` pour spécifier la version (assurez-vous que Rails a déjà la version)

### Étape 4: Pensez à l'image de l'application que vous souhaitez créer

-Avant de concevoir, pensez à une image complète (avec les supporters) de ce à quoi ressemblera l'application. La conception d'écran par prototypage papier est recommandée
  -Aussi, réfléchissons (avec les supporters) à la manière dont cette application sera utilisée (si elle sera publiée sur Internet, à usage interne, etc.)
-Lisez la configuration système requise et considérez les structures de données dont vous avez besoin
  -De quel modèle (table) vous avez besoin
  -Quelles informations avez-vous besoin dans le tableau
-Après avoir réfléchi à la structure des données, écrivons-la à la main sur le diagramme du modèle
  -Lançons le tournage lorsqu'il est terminé et mettons-le dans le référentiel
  -Liste du schéma de table dans `README.md` (nom du modèle, nom de la colonne, type de données)

* Il n'est pas nécessaire de créer un diagramme de modèle correct pour le moment. Faisons-le comme une hypothèse pour le moment (je pense qu'il sera réparé si je pense que c'est une erreur dans la prochaine étape)

### Étape 5: définir les paramètres de connexion à la base de données (paramètres des périphériques)

-Tout d'abord, ouvrez une nouvelle branche de sujet avec Git
  -Après cela, nous travaillerons sur la branche thématique et nous nous engagerons
-Installer Bundler
-Installer `pg` (pilote de base de données PostgreSQL) avec` Gemfile`
-let ensemble `database.yml`
-Créer une base de données avec la commande `rails db: create`
-Vérifions la connexion à la base de données avec la commande `rails db`
-Créer un PR sur GitHub pour examen
  -Ensuite, publions PR par WIP (Work In Progress). Pour plus de détails, reportez-vous à la collection de sujets
  -Si vous avez des commentaires, veuillez le faire. Si vous avez 2 LGTM (me semble bien), fusionnez-les dans votre branche principale

### Étape 6: Créer un modèle de tâche

Créez CRUD pour gérer les tâches.
Tout d'abord, créons une structure simple où vous ne pouvez enregistrer que le nom et les détails.

-Utilisez la commande `rails generate` pour créer la classe de modèle requise pour la tâche CRUD
-Créer une migration et l'utiliser pour créer une table
  -Il est important de s'assurer que la migration peut être retournée à l'état précédent! Prenons l'habitude de jouer à "redo" et de confirmer
  -Assurez-vous de définir la contrainte DB
-Assurez-vous que vous pouvez vous connecter à la base de données via le modèle avec la commande `rails c`
  -A ce moment, essayons de créer un enregistrement avec ActiveRecord
-Set validation
  -Pensez à quelle validation ajouter à quelle colonne
-Créer un PR sur GitHub pour examen

### Étape 7: Voyons, enregistrons, mettons à jour et supprimons les tâches

Créons un écran de liste de tâches, un écran de détail, un écran de création, un écran d'édition et une fonction de suppression.

La création de ces fonctionnalités en même temps peut conduire à d'énormes RP.
Par conséquent, à l'étape 7, nous allons procéder en divisant le PR en plusieurs parties.

Si le PR est susceptible d'augmenter également dans les étapes futures, examinons s'il est possible de diviser le PR en deux ou plus.

### Étape 7-1: Créer un écran de liste de tâches et un écran de détail

- Permettons d'afficher la tâche créée à l'étape 6 sur l'écran liste et l'écran de détail
-Créons un contrôleur et une vue avec la commande `rails generate`
  -Discutez avec vos supporters du moteur de template à utiliser
-Ajoutons l'implémentation requise au contrôleur et visualisons
-Edit `routes.rb` pour que` http: // localhost: 3000 / `affiche l'écran de la liste des tâches
-Expliquons aux supporters ce qui se passe entre le navigateur web et le serveur
-Créer un PR sur GitHub pour examen

### Étape 7-2: Créons un écran de création de tâche et un écran d'édition

- Créons et éditons des tâches à partir de l'écran
-Afficher le message flash sur l'écran après la création et la mise à jour
  -Si une erreur de validation se produit, affichons un message d'erreur à l'écran
-Créer un PR sur GitHub pour examen

### Étape 7-3: Suppression de la tâche

-Pouvons supprimer la tâche créée
-Afficher un message flash à l'écran après la suppression
-Créer un PR sur GitHub pour examen

### Étape 7-4: Revenons au code ajouté

-Expliquons aux supporters le code ajouté aux étapes 7-1 à 7-3
  -À propos des classes, méthodes et variables
  -À propos du flux de traitement

### Étape 8: Appuyez sur SQL

-Faisons fonctionner la base de données
  -Connectez-vous à la base de données avec la commande `rails db`
  -Afficher, créer, mettre à jour et supprimer des tâches avec SQL
-Accédez à l'écran de la liste des tâches et confirmez que le journal SQL circule
  -Expliquons aux supporters ce que SQL est exécuté
-Vérifions quel SQL est exécuté par la méthode d'ActiveRecord
  -Essayez `find`,` where` etc. avec `rails c`

### Étape 9: rédigez un test

-être prêt à écrire une spécification
  -Préparer `spec / spec_helper.rb` et` spec / rails_helper.rb`
-Écrivons une spécification de modèle pour validation
  -En fait, je n'écris pas beaucoup de tests de validation, mais faisons-le pour mieux comprendre les spécifications du modèle
-Écrivons une spécification système pour la fonction de tâche
-Introduire des outils CI tels que Circle CI pour notifier Slack
  -En considérant le niveau de difficulté, il peut être mis en œuvre par un supporter.
-Livre de référence: https://leanpub.com/everydayrailsrspec-jp

### Étape 10: Rendre la partie japonaise de l'application commune

-Utilisez le mécanisme Rails i18n pour afficher le message d'erreur de validation en japonais.

### Étape 11: Définir le fuseau horaire des rails

-Définir le fuseau horaire de Rails pour le Japon (Tokyo)

### Étape 12: Triez la liste des tâches par date et heure de création

-Actuellement, il est organisé par ordre d'ID, mais trions cela par ordre décroissant de date et d'heure de création
-Ecrivons dans la spécification système que le tri fonctionne

### Étape 13: Déployer

-Maintenant que nous avons un système de gestion des tâches simple sur notre branche principale, déployons-le.
-Allons déployer à Heroku
  -Créez un compte si vous n'en avez pas
-Touchez l'application déployée sur Heroku
  -Dès maintenant, enregistrons les tâches dans cette application et procédons au développement
  - * Cependant, les applications Heroku peuvent être référencées n'importe où sur Internet, donc ne publiez pas d'informations dont la publication est mauvaise
    -Il peut être correct d'ajouter l'authentification de base à ce stade
  -Dans le futur, continuez à déployer votre application sur Heroku après chaque étape
-Décrivons comment déployer dans `README.md`
  -À ce moment-là, il est préférable d'inclure les informations de version du framework utilisé dans cette application

### Étape 14: Ajouter une date limite

-Fournissons la possibilité d'inscrire la date limite de fin de la tâche
-Pouvons trier par date de fin sur l'écran de liste
-Agrandir vos spécifications
-PR et revue, libérons

### Étape 15: Ajouter le statut et le rendre consultable

-Ajoutons le statut (non démarré, en cours, terminé)
  - [Option] Si vous n'êtes pas un débutant, vous pouvez introduire un Gem qui gère l'état.
-Faisons une recherche par titre et statut sur l'écran de liste
  - [Option] Si vous n'êtes pas un débutant, vous pouvez introduire une gemme qui facilite la mise en œuvre d'une recherche telle que le ransack.
-Lors de la réduction, vérifions le changement dans le SQL émis en regardant le journal
  -Ajouter une habitude de vérification si nécessaire même dans les étapes suivantes
-Coller l'index de recherche
  -Préparez des données de test et vérifiez l'opération en regardant log / development.log, et confirmez que l'ajout de l'index améliore la vitesse.
  - [Option] Utilisons PostgreSQL Expliquer etc. pour vérifier l'utilisation de l'index côté base de données.
-Ajoutons une spécification de modèle à la recherche (développons la spécification du système)

### Étape 16: Définissez les priorités (* Les personnes ayant une expérience de mise en œuvre similaire peuvent l'omettre)

-Enregistrons la priorité (haute, moyenne, basse) de la tâche
-Trier par priorité
-Élargir les spécifications de votre système
-Après PR et examen, libérons (veuillez continuer à partir d'ici)

### Étape 17: Ajouter une pagination

-Ajoutons la pagination à l'écran de liste en utilisant Gem appelé Kaminari

### Étape 18: Appliquer le design

-Introduisez Bootstrap et appliquez le design aux applications que vous avez créées jusqu'à présent
  - [Option] Concevez et rédigez vous-même le CSS

### Étape 19: Rendez-le disponible à plusieurs personnes (présentation de l'utilisateur)

-Créons un modèle utilisateur
-Créons le premier utilisateur avec des semences
- Connectons les utilisateurs et les tâches
  -Associations liées aux index
  - * Lors du déploiement sur Heroku, veuillez vous assurer que la tâche enregistrée et l'utilisateur sont liés (maintenance des données)

### Étape 20: Implémentation de la fonction de connexion / déconnexion

-Mettons-le en œuvre vous-même sans utiliser de gemme supplémentaire
  -En n'utilisant pas Gem comme Devise, le but est d'approfondir la compréhension des mécanismes tels que les cookies HTTP et Session in Rails
  -Il vise également à approfondir la compréhension de l'authentification générale (gestion des mots de passe, etc.)
-Mettre en place un écran de connexion
-Elle vous empêche d'accéder à la page de gestion des tâches si vous n'êtes pas connecté
-Afficher uniquement les tâches que vous avez créées
-Mettons en œuvre la fonction de déconnexion

### Étape 21: Implémenter l'écran de gestion des utilisateurs

-Ajouter un menu d'administration à l'écran
-Assurez-vous d'ajouter l'URL `/ admin` en haut de l'écran d'administration
  -Avant d'ajouter à `routes.rb`, concevons à l'avance l'URL et le nom de routage (nom qui devient` * _path`)
-Mettons en œuvre la liste des utilisateurs / créer / mettre à jour / supprimer
-Après avoir supprimé l'utilisateur, supprimons la tâche que l'utilisateur a
-Essayez d'afficher le nombre de tâches de l'utilisateur sur l'écran de la liste des utilisateurs
  -Introduisons un mécanisme pour éviter le problème N + 1
-Voyons la liste des tâches créées par l'utilisateur

### Étape 22: Ajouter des rôles aux utilisateurs

-Essayez de distinguer les utilisateurs entre les utilisateurs administrateurs et les utilisateurs généraux
-Laissez uniquement les utilisateurs administrateurs accéder à l'écran de gestion des utilisateurs
  -Si un utilisateur général accède à l'écran de gestion, levons une exception spéciale
  -Attrapons l'exception et affichons correctement la page d'erreur (cela peut être fait à l'étape 24)
-Sélectionnons le rôle dans l'écran de gestion des utilisateurs
-Contrôlons la suppression afin qu'il n'y ait pas d'administrateur
  -Utilisons le modèle de rappel
- * Gem peut être utilisé ou non

### Étape 23: Soyez capable d'étiqueter vos tâches

-Pouvons attacher plusieurs étiquettes à une tâche
-Faisons une recherche avec l'étiquette attachée

### Étape 24: Définissez correctement la page d'erreur

-Faisons de la page d'erreur par défaut fournie par Rails l'écran que vous avez créé
-Actionnons la page d'erreur de manière appropriée en fonction de la situation
  -Deux types de réglage de la page de code d'état 404 et de la page 500 sont requis au moins

## Postscript

Je vous remercie pour votre travail acharné.
Vous avez terminé le programme éducatif!

Je ne pourrais pas aborder ce programme, mais je pense que les sujets suivants seront nécessaires à l'avenir, donc je pense que c'est une bonne idée de poursuivre l'apprentissage (je pense qu'il y a beaucoup à apprendre à travers des projets).

-Acquérir une compréhension de base des applications Web
  -Comprendre HTTP et HTTPS
-Apprendre des utilisations plus avancées des rails
  -STI
  -Enregistrement
  -Transaction explicite
  -Traitement asynchrone
  - Pipeline d'actifs (sujets relatifs à la publication)
-Compréhension plus avancée des interfaces telles que JavaScript et CSS
-Approfondir votre compréhension de la base de données
  -SQL
  -Créer des requêtes en mettant davantage l'accent sur les performances
  -Améliorez votre compréhension des index
-Plus de compréhension de l'environnement du serveur
  -Linux OS
  -Paramètres du serveur Web (Nginx)
  -Paramètres du serveur d'application (Licorne)
  -Comprendre les paramètres PostgreSQL
-Comprendre les outils de publication
  -Capistrano
  -Ansible
