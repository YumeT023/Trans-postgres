-- BEWARE: for now those queries are not tested yet, but will be later on

-- nombre de clients
SELECT COUNT(*) FROM CLIENT;

-- Quand est ce que tel ou tel client a réservé
select nom from client inner join reserver on client.id_client = reserver.id_client;

-- nombre de mineur qui participe à un voyage
select count(*) from client inner join  reserver on client.id_client = reserver.id_client where client.cin is not null; 

-- liste des voyages et leurs destinations
select id_voyage, nom_ville from voyage left join ville on voyage.id_ville_arrivee = ville.id_ville;

-- les reservations des clients
select * from reservation

--  aficher toutes les depenses de chaque véhicule
select * from vehicule inner join recevoir on vehicule.id_vehicule = recevoir.id_vehicule inner join depense on recevoir.id_depense = depense.id_depense;

-- Liste des vehicules qui ont encore des places libre dans telle ville vers telle ville
select vehicule.id_vehicule, vehicule.matricule from vehicule 
    left join voyage on voyage.id_vehicule = vehicule.id_vehicule 
    left join ville as v1 on v1.id_ville = voyage.id_ville_depart
    left join ville as v2 on v2.id_ville = voyage.id_ville_arrivee
    where v1.nom_ville = 'any' AND v2.nom_ville = 'another'
    AND vehicule.nb_place - (select count(*) from reserver) > 0;
