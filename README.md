# Your Car Your Way : PoC chat

## Introduction 

Cette application est une preuve de concept afin d'assuer la  validité de notre proposition.  
L'application mise en place est une démonstration de la faisabilité de la fonctionnalité d'échange avec le service client via un chat en ligne.

## Installations
Pour le bon fonctionnement du projet, vous aurez besoin de plusieurs éléments.

   ### Apache Maven
   - Télécharger et installer Apache Maven
   - > https://maven.apache.org/download.cgi
   
   ### Java Developpment Kit  
   - Télécharger et installer Java Developpment Kit  
   - > https://www.oracle.com/java/technologies/downloads/  

   ### Node Module  
   - Rendez-vous dans le dossier `/chemin/vers/votre/projet/Front-End/` et utilisez la commande `npm install` dans l'invité de commandes.

## Lancement du projet

- Pour lancer le projet, vous devrez tout d'abord créer les variables d'environnement pour Java et Maven.  
- Pour lancer le serveur Java, dans un terminal placez vous dans le dossier `/back/pocchat` et entrez la commande `mvn spring-boot:run`.    
- Pour lancer le serveur Angular, dans un terminal placez vous dans le dossier `/front` et entrez la commande `npm run start`.  

## Acceder à l'application

- Pour acceder à l'application, rendez-vous sur : `localhost:4200`

## Emplacement du script SQL

`/resources`
Nom du fichier : `script.sql` 