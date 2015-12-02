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
SELECT modèle,marque FROM "VEHICULE" WHERE num_Im NOT IN
(SELECT num_Im FROM "LOCATION" WHERE id_Location IN
(SELECT id_Location FROM "LOUER" WHERE num_Client IN
(SELECT num_Client FROM "LIAISON")))

--Requete 3
--SELECT numero,nom FROM CLIENT WHERE

--Requete 4 CEST MARQUE PAS MODELE
--SELECT nom FROM AGENCE WHERE id_Agence IN
--(SELECT num_Agence FROM POSSEDER WHERE num_Immatriculation IN
--(SELECT num_Immatriculation FROM MODELE WHERE num_Immatriculation IN
--(SELECT
--) GROUP BY id_Modele))

--Requete 5
--SELECT nom FROM EMPLOYE WHERE

--Requete 6
SELECT nom,adresse FROM "CLIENT" WHERE numero IN
(SELECT num_Client FROM "LOUER" WHERE COUNT(num_Client) IN
(SELECT MAX((SELECT COUNT(id_Location) WHERE num_Client IN
(SELECT num_Client FROM "LOUER"))) FROM "LOUER"))

--Requete 7
--SELECT

--Requete 8
