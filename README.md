# Devoir SQL : Base de Données Tifosi

## Description du Projet

Ce repository contient l'ensemble des scripts SQL créés pour la mission demandée dans le cadre de la formation "Concevoir une Base de Données avec MySQL".

Le projet consiste à créer et à peupler une base de données pour le restaurant de Street-Food italien "Tifosi".

---

## Fichiers inclus

* **`bdd_tifosi.sql`** : Ce script permet de créer la structure complète de la base de données. Il inclut la définition des tables, des clés primaires, des clés étrangères et la création de l'utilisateur `tifosi`.

* **`insert_tifosi.sql`** : Ce script contient toutes les commandes d'insertion de données de test. Il doit être exécuté après `bdd_tifosi.sql`. L'ordre des insertions respecte les dépendances des clés étrangères pour un peuplement correct.

* **`backup_tifosi.sql`** : Ce script est un fichier de sauvegarde complet de la base de données. Il regroupe la structure et les données dans un seul fichier, permettant une importation en une seule étape.

---

## Instructions d'utilisation

Pour importer la base de données, vous avez deux options :

### Option 1 : Importer les deux scripts séparément

1.  Importez le fichier **`bdd_tifosi.sql`** pour créer la structure de la base de données et l'utilisateur `tifosi`.
2.  Importez ensuite le fichier **`insert_tifosi.sql`** pour insérer les données de test.

### Option 2 : Importer le script de sauvegarde

1.  Importez le fichier **`backup_tifosi.sql`** qui contient la structure et les données, tout en respectant l'ordre des dépendances. Cette méthode est la plus simple et la plus fiable.

---

## Remarque sur l'ordre des imports

Veuillez noter que le peuplement des données (dans `insert_tifosi.sql`) a été réalisé en respectant l'ordre d'insertion des tables parentes (`marque`, `ingredient`) avant les tables enfants qui en dépendent. Cela permet d'éviter les erreurs de violation de contrainte de clé étrangère.
