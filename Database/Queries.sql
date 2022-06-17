//nombre de clients 
SELECT count(*) FROM client;

//Toutes les r�servations sur un voyage 
SELECT * FROM reserver INNER JOIN voyage ON id_ville_arrivee = 2;

//tous les voyages du jour/du mois/de l'ann�e/de la semaine 
Du jour : SELECT nom,matricule,nom_ville,heure_dep FROM chauffeurs,v�hicule INNER JOIN conduire ON conduire.id_chauffeur = conduire.id_vehicule INNER JOIN voyage ON date_voyage = current_date INNER JOIN ville ON ville.id_ville = voyage.id_ville_arrivee;

Du mois : SELECT nom,matricule,nom_ville,heure_dep FROM chauffeurs,v�hicule INNER JOIN conduire ON conduire.id_chauffeur = conduire.id_vehicule INNER JOIN voyage ON (date_part('month',date_voyage) = date_part('month', current_date)) INNER JOIN ville ON ville.id_ville = voyage.id_ville_arrivee;

De l'ann�e : SELECT nom,matricule,nom_ville,heure_dep FROM chauffeurs,v�hicule INNER JOIN conduire ON conduire.id_chauffeur = conduire.id_vehicule INNER JOIN voyage ON (date_part('year',date_voyage) = date_part('year', current_date)) INNER JOIN ville ON ville.id_ville = voyage.id_ville_arrivee;

Du mois : SELECT nom,matricule,nom_ville,heure_dep FROM chauffeurs,v�hicule INNER JOIN conduire ON conduire.id_chauffeur = conduire.id_vehicule INNER JOIN voyage ON (date_trunc('week',date_voyage) = date_trunc('week', current_date)) INNER JOIN ville ON ville.id_ville = voyage.id_ville_arrivee;