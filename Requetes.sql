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

--Requete 4 FUCK IT
--Si chaque marque a son utilitaire
--SELECT nom FROM "AGENCE" WHERE id_Agence IN
--(SELECT id_Agence FROM "VEHICULE" WHERE marque NOT IN
--(SELECT marque FROM "VEHICULE") AND num_Im IN
--(SELECT num_Im FROM "UTILITAIRE") AND num_Im IN
--(SELECT num_Im FROM "LOCATION" WHERE jour_Enregistrement + nb_Jours < CURRENT_DATE) OR num_Im NOT IN
--(SELECT num_Im FROM "LOCATION"))

--Si on ne prend que les marques ou se trouvent les utilitaires
--SELECT nom FROM "AGENCE" WHERE id_Agence IN
--(SELECT id_Agence FROM "VEHICULE" WHERE marque NOT IN
--(SELECT marque FROM "VEHICULE" WHERE num_Im IN
--(SELECT num_Im FROM "UTILITAIRE")) AND num_Im IN
--(SELECT num_Im FROM "UTILITAIRE") AND (num_Im IN
--(SELECT num_Im FROM "LOCATION" WHERE jour_Enregistrement + nb_Jours < CURRENT_DATE) OR num_Im NOT IN
--(SELECT num_Im FROM "LOCATION")))

--SELECT id_Agence FROM "VEHICULE" WHERE marque IN
--(SELECT marque FROM "VEHICULE" WHERE id_Agence IN
--(SELECT id_Agence FROM "AGENCE")) AND num_Im IN
--(SELECT num_Im FROM "UTILITAIRE") GROUP BY marque

--SELECT * FROM "VEHICULE" WHERE

--SELECT marque FROM "VEHICULE" WHERE num_Im IN
--(SELECT num_Im FROM "UTILITAIRE") GROUP BY marque


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
--SELECT

--Requete 8
