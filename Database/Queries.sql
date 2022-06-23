-- nombre de clients
SELECT COUNT(*) FROM CLIENT;

-- Quand est ce que tel ou tel client a réservé
select nom from client inner join reserver on client.id_client = reserver.id_client;

-- nombre de mineur qui participe à un voyage
select count(*) from client inner join  reserver on client.id_client = reserver.id_client where client.cin is not null; 

-- liste des voyages et leurs destinations
select id_voyage, nom_ville from voyage left join ville on voyage.id_ville_arrivee = ville.id_ville;

-- les reservations des clients
select * from reserver;

--  aficher toutes les depenses de chaque véhicule
select * from vehicule inner join recevoir on vehicule.id_vehicule = recevoir.id_vehicule inner join depense on recevoir.id_depense = depense.id_depense;

-- -- Liste des vehicules qui ont encore des places libre dans telle ville vers telle ville
-- select vehicule.id_vehicule, vehicule.matricule from vehicule 
--     left join voyage on voyage.id_vehicule = vehicule.id_vehicule 
--     left join ville as v1 on v1.id_ville = voyage.id_ville_depart
--     left join ville as v2 on v2.id_ville = voyage.id_ville_arrivee
--     where v1.nom_ville = 'any' AND v2.nom_ville = 'another'
--     AND vehicule.nb_place - (select count(*) from reserver) > 0;
    
--Toutes les réservations sur un voyage 
SELECT * FROM reserver INNER JOIN voyage ON id_ville_arrivee = 2;

--tous les voyages du jour/du mois/de l'année/de la semaine 
--Du jour: 
SELECT * 
	FROM voyage 
	WHERE voyage.date_voyage = current_date;

--Du mois: 
SELECT * 
	FROM voyage 
	WHERE date_part('month',date_voyage) = date_part('month', current_date);

--De l'année: 
SELECT * 
	FROM voyage
	WHERE date_part('year',date_voyage) = date_part('year', current_date);

--Du semaine: 
SELECT *
	FROM voyage
	date_trunc('week',date_voyage) = date_trunc('week', current_date);

--tous les vehicules qui ont participé à une voyage à une date précise
select matricule from vehicule inner join voyage on voyage.date_voyage='2022-06-17' and vehicule.id_vehicule=voyage.id_vehicule;

-- la destination la plus prise
SELECT id_ville_arrive from voyage order by DESC limit 1;

-- vehicule conduit par tel ou tel chauffeur
select vehicule.id_vehicule, 
        matricule 
from vehicule 
    inner join conduire on
        conduire.id_vehicule = vehicule.id_vehicule
    inner join chauffeur on
        chauffeur.id_chauffeur = conduire.id_chauffeur
where chauffeur = 'any';
