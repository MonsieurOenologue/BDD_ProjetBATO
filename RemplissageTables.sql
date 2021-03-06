--REMPLISSAGE DES DIFFERENTES COLONNES DE CHAQUE TABLE--

--ID_AGENCE, NOM, ADRESSE
INSERT INTO "AGENCE" VALUES (0,'LepesCorp','2 rue de la barbe'); --Aucun véhicule
INSERT INTO "AGENCE" VALUES (1,'LefebIndustries','4 rue du style'); --Tout les utilitaires dispo
INSERT INTO "AGENCE" VALUES (2,'AgenceDuStyle','8 quai des gentils'); --Tout les utilitaires non dispo
INSERT INTO "AGENCE" VALUES (3,'EntrepriseBDD','5 rue SQL');
INSERT INTO "AGENCE" VALUES (4,'Voiture&Co','7 rue des as');
INSERT INTO "AGENCE" VALUES (5,'Poudcars','Voie 9 3/4');

--NUMERO, NOM, ADRESSE, DATE_EMBAUCHE, TYPE_EMPLOYE, ID_AGENCE
INSERT INTO "EMPLOYE" VALUES (0,'Bastien','2 rue de la barbe','14/04/2015','responsable',0);
INSERT INTO "EMPLOYE" VALUES (1,'Thomas','4 rue du style','14/04/2015','responsable',1);
INSERT INTO "EMPLOYE" VALUES (2,'Michel','8 rue des framboises','14/04/2015','mécanicien',0);
INSERT INTO "EMPLOYE" VALUES (3,'Jean','7 rue des fraises','14/04/2015','commercial',1);
INSERT INTO "EMPLOYE" VALUES (4,'Jacques','12 rue des poires','18/05/2015','mécanicien',1);
INSERT INTO "EMPLOYE" VALUES (5,'Jeanne','13 rue des coquelicots','12/05/2015','commercial',0);
INSERT INTO "EMPLOYE" VALUES (6,'Pierre','4 rue du travail','18/05/2015','responsable',2);
INSERT INTO "EMPLOYE" VALUES (7,'Roger','6 quai des serpents','23/05/2015','mécanicien',2);
INSERT INTO "EMPLOYE" VALUES (8,'Charlotte','3 rue du chocolat','26/05/2015','commercial',2);
INSERT INTO "EMPLOYE" VALUES (9,'Alexandre','10 rue de la coupe','18/05/2014','responsable',3);
INSERT INTO "EMPLOYE" VALUES (10,'Alexis','6 avenue paumée','23/07/2015','mécanicien',3);
INSERT INTO "EMPLOYE" VALUES (11,'Arya','3 rue Kurde','01/02/1987','commercial',3);
INSERT INTO "EMPLOYE" VALUES (12,'Lucas','4 rue du swag','25/11/2015','responsable',4);
INSERT INTO "EMPLOYE" VALUES (13,'Louis','6 quai du jaitoutfini','23/07/2015','mécanicien',4);
INSERT INTO "EMPLOYE" VALUES (14,'Mallaurie','3 rue de la couture','02/04/2015','commercial',4);
INSERT INTO "EMPLOYE" VALUES (15,'Lise','4 avenue du sourire','02/01/2012','responsable',5);
INSERT INTO "EMPLOYE" VALUES (16,'Johan','6 rue jemenfou','04/04/2004','mécanicien',5);
INSERT INTO "EMPLOYE" VALUES (17,'Paul','3 rue','12/11/2010','commercial',5);

--NUMERO, NOM, ADRESSE
INSERT INTO "CLIENT" VALUES (0, 'Jean Jambe', '3 quartier du zoo','particulier');
INSERT INTO "CLIENT" VALUES (1, 'SuperKlavier3000', '6th keyboard square','entreprise');
INSERT INTO "CLIENT" VALUES (2, 'Client Simple', '1th simplicity lane','particulier');
INSERT INTO "CLIENT" VALUES (3, 'Client Complexe', '5th complex square','entreprise');
INSERT INTO "CLIENT" VALUES (4, 'Grand Mechant Loup', 'Maison de mère grand','entreprise');
INSERT INTO "CLIENT" VALUES (5, 'Filipe Gama', 'Achères Ville','particulier');
INSERT INTO "CLIENT" VALUES (6, 'Vincent Monot', 'Courdimanche','particulier');

--NUM_IM, AGENCE, DATE_ACHAT, KILOMETRAGE, MODELE, MARQUE, CAUTION
INSERT INTO "VEHICULE" VALUES (132289,1,'16/01/2015',3500,'3XS','Citroen',200); --Utilitaire
INSERT INTO "VEHICULE" VALUES (982342,1,'13/04/2015',87400,'Tremplin','Citroen',200);
INSERT INTO "VEHICULE" VALUES (345432,1,'10/05/2015',3200,'Super','Peugeot',200); --Utilitaire
INSERT INTO "VEHICULE" VALUES (787878,1,'16/01/2015',4200,'32S','Mercedes',100); --Utilitaire
INSERT INTO "VEHICULE" VALUES (989898,2,'05/01/2015',20520,'3XS','Citroen',150); --Utilitaire
INSERT INTO "VEHICULE" VALUES (543289,2,'23/02/2015',6500,'Prius','Toyota',500);
INSERT INTO "VEHICULE" VALUES (252525,2,'12/05/2015',654120,'32S','Peugeot',300); --Utilitaire
INSERT INTO "VEHICULE" VALUES (101010,1,'16/01/2015',4200,'32S','Mercedes',100); --Utilitaire
INSERT INTO "VEHICULE" VALUES (679423,3,'12/03/2015',8900,'Super','Peugeot',200); --Utilitaire
INSERT INTO "VEHICULE" VALUES (432332,5,'16/01/2015',98600,'32S','Mercedes',800); --Utilitaire
INSERT INTO "VEHICULE" VALUES (142992,5,'16/01/2015',6800,'206','Peugeot',250);


--ID_LOCATION, JOUR_ENREGISTREMENT, TARIF_JOUR, KILOMETRAGE_DEPART, AGENCE_DEPART, AGENCE_RETOUR, NB_JOURS, NUM_IM
INSERT INTO "LOCATION" VALUES (0,'19/07/14',60,120,0,0,3,142992);
INSERT INTO "LOCATION" VALUES (1,'12/07/15',70,250,1,5,14,142992);
INSERT INTO "LOCATION" VALUES (2, '12/02/14',60,270,2,4,25,432332);
INSERT INTO "LOCATION" VALUES (3, '14/07/15',80,400,4,4,1,543289);
INSERT INTO "LOCATION" VALUES (4, '16/02/15',90,500,5,1,20,982342);
INSERT INTO "LOCATION" VALUES (5, '23/02/15',65,800,4,0,2,345432);
INSERT INTO "LOCATION" VALUES (6, '23/11/15',2,1500,2,2,150,101010);
INSERT INTO "LOCATION" VALUES (7, '10/11/11',85,400,1,2,36,132289);

--ID_LOCATION, NUM_CLIENT
INSERT INTO "CORRESPONDRE" VALUES(0,1);
INSERT INTO "CORRESPONDRE" VALUES(1,3);
INSERT INTO "CORRESPONDRE" VALUES(2,6);
INSERT INTO "CORRESPONDRE" VALUES(3,1);
INSERT INTO "CORRESPONDRE" VALUES(4,4);
INSERT INTO "CORRESPONDRE" VALUES(5,5);
INSERT INTO "CORRESPONDRE" VALUES(6,4);
INSERT INTO "CORRESPONDRE" VALUES(7,4);

--NUM_IM, CAPACITE, CHARGE_MAX
INSERT INTO "UTILITAIRE" VALUES (132289,700,1500);
INSERT INTO "UTILITAIRE" VALUES (679423,1000,1650);
INSERT INTO "UTILITAIRE" VALUES (252525,2000,2500);
INSERT INTO "UTILITAIRE" VALUES (345432,5000,4000);
INSERT INTO "UTILITAIRE" VALUES (432332,4350,4700);
INSERT INTO "UTILITAIRE" VALUES (787878,6200,2000);
INSERT INTO "UTILITAIRE" VALUES (101010,7400,3200);
INSERT INTO "UTILITAIRE" VALUES (989898,1200,9800);
