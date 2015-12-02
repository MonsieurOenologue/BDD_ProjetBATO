--Requete 1
SELECT nom,adresse FROM "CLIENT" WHERE numero IN
(SELECT num_Client FROM "LOUER" WHERE num_Client IN
(SELECT num_Client FROM "LOUER" WHERE id_Location IN
(SELECT id_Location FROM "LOCATION" WHERE num_Im IN (SELECT num_Im FROM "UTILITAIRE"))) AND num_Client IN
(SELECT num_Client FROM "LOUER" WHERE id_Location IN
(SELECT id_Location FROM "LOCATION" WHERE num_Im NOT IN (SELECT num_Im FROM "UTILITAIRE"))) GROUP BY num_Client)

--Reflexion pour la requete 1
--SELECT nom,adresse FROM "CLIENT" WHERE numero IN
--(SELECT num_Client FROM "LOCATION" WHERE num_Im IN
--(SELECT num_Im FROM "VEHICULE" WHERE num_Im NOT IN
--(SELECT num_Im FROM "UTILITAIRE")) AND num_Im IN
--(SELECT num_Im FROM "UTILITAIRE"))

--SELECT nom,adresse FROM "CLIENT" WHERE numero IN
--(SELECT num_Client FROM "LOUER" WHERE id_Location IN
--(SELECT id_Location FROM "LOCATION" WHERE num_Im IN
--(SELECT num_Im FROM "UTILITAIRE") GROUP BY id_Location HAVING COUNT(num_Im) > 0) GROUP BY num_Client)

--(SELECT id_Location FROM "LOCATION" WHERE num_Im IN (SELECT num_Im FROM "UTILITAIRE"))
--(SELECT id_Location FROM "LOCATION" WHERE num_Im NOT IN (SELECT num_Im FROM "UTILITAIRE"))
--SELECT nom,adresse FROM "CLIENT" WHERE numero IN (SELECT num_Client FROM "LOUER")
--(SELECT num_Client FROM "LOUER" GROUP BY num_Client)
--SELECT id_Location FROM "LOUER"

--Requete 2
SELECT modele,marque FROM "VEHICULE" WHERE modele NOT IN
(SELECT modele FROM "VEHICULE" WHERE num_Im IN
(SELECT num_Im FROM "LOCATION" WHERE id_Location IN
(SELECT id_Location FROM "LOUER" WHERE num_Client IN
(SELECT numero FROM "CLIENT" WHERE type_Client = 'entreprise'))) GROUP BY modele) GROUP BY modele,marque

--Requete 3
SELECT numero,nom FROM "CLIENT" WHERE numero IN
(SELECT num_Client FROM "LOUER" WHERE id_Location IN
(SELECT id_Location FROM "LOCATION" WHERE agence_Depart != agence_Retour) GROUP BY num_Client)

--Requete 4
SELECT nom FROM "AGENCE" WHERE id_Agence IN
(SELECT nbByMarque.id_Agence FROM

--Nombre de marques d'utilitaire par marque
(SELECT marques.id_Agence, COUNT(marques.nbMarque) AS countMarque FROM
(SELECT id_Agence, COUNT(marque) as nbMarque FROM "VEHICULE" WHERE num_Im IN
(SELECT num_Im FROM "UTILITAIRE" WHERE num_Im NOT IN
(SELECT num_Im FROM "LOCATION" WHERE jour_Enregistrement + nb_Jours > current_date)) GROUP BY marque,id_Agence)
AS marques GROUP BY id_Agence) AS nbByMarque,

--Nombre de marques d'utilitaires en tout
(SELECT COUNT(marques.nbMarque) AS countTotal FROM
(SELECT COUNT(marque) as nbMarque FROM "VEHICULE" WHERE num_Im IN
(SELECT num_Im FROM "UTILITAIRE") GROUP BY marque) AS marques) AS nbTotal

WHERE nbByMarque.countMarque = nbTotal.countTotal)


--Requete 5
SELECT nom FROM "EMPLOYE" WHERE type_Employe = 'responsable' AND id_Agence IN
(SELECT id_Agence FROM "AGENCE" WHERE id_Agence NOT IN
(SELECT id_Agence FROM "VEHICULE" WHERE num_Im NOT IN
(SELECT num_Im FROM "UTILITAIRE")))

--Requete 6
SELECT nom,adresse FROM "CLIENT" WHERE numero IN
(SELECT sums.id FROM
(SELECT num_Client AS id, COUNT(id_Location) AS sums FROM "LOUER" GROUP BY num_Client) AS sums,
(SELECT MAX(sums.sums) AS max FROM
(SELECT COUNT(id_Location) AS sums FROM "LOUER" GROUP BY num_Client) AS sums) AS max
WHERE sums.sums = max.max)

--Requete 7
SELECT "AGENCE".nom AS "Nom de l'agence",responsable.nom AS "Nom du responsable", responsable.nombre AS "Nombre de location" FROM "AGENCE" INNER JOIN

--Responsable
(SELECT id_Agence,nom,locations.nombre AS nombre FROM "EMPLOYE" INNER JOIN

--Nombre de locations
(SELECT agence_Depart, COUNT(num_Im) AS nombre FROM "LOCATION" WHERE jour_Enregistrement > '01-01-2015'::date
AND nb_Jours > 3 GROUP BY agence_Depart) AS locations ON (id_Agence = agence_Depart)
WHERE type_Employe = 'responsable') AS responsable ON ("AGENCE".id_Agence = responsable.id_Agence)



--Requete 8
