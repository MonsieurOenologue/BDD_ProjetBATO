--DROP TABLE IF EXISTS "VEHICULE" CASCADE;
--DROP TABLE IF EXISTS "AGENCE" CASCADE;
--DROP TABLE IF EXISTS "CLIENT" CASCADE;
--DROP TABLE IF EXISTS "UTILITAIRE" CASCADE;
--DROP TABLE IF EXISTS "EMPLOYE" CASCADE;
--DROP TABLE IF EXISTS "LOCATION" CASCADE;
--DROP TABLE IF EXISTS "POSSEDER" CASCADE;

--CREATION DES TABLES ET DES COLONNES DES TABLES

CREATE TYPE type_of_client AS ENUM ('particulier', 'entreprise');
CREATE TABLE "CLIENT"
(
	numero integer PRIMARY KEY,
	nom char(30),
	adresse char(30),
	type_Client type_of_client
);

CREATE TABLE "VEHICULE"
(
	num_Im integer PRIMARY KEY,
	date_Achat date,
	kilometrage integer,
	modele char(30),
	marque char(30),
	caution integer,
	num_Client integer REFERENCES "CLIENT"
);

CREATE TABLE "AGENCE"
(
	id_Agence integer PRIMARY KEY,
	nom char(30),
	adresse char(30)
);

CREATE TABLE "EMPLOYE"
(
	numero integer PRIMARY KEY,
	nom char(30),
	adresse char(30),
	date_Embauche date,
	type_Employe char(15),
	est_Responsable boolean,
	id_Agence integer REFERENCES "AGENCE"
);

CREATE TABLE "LOCATION"
(
	id_Location integer PRIMARY KEY,
	jour_Enregistrement date,
	tarif_jour integer,
	kilometrage_Depart integer,
	agence_Depart integer REFERENCES "AGENCE"(id_Agence),
	agence_Retour integer REFERENCES "AGENCE"(id_Agence),
	nb_Jours integer,
	num_Im integer REFERENCES "VEHICULE"
);

CREATE TABLE "LOUER"
(
	id_Location integer REFERENCES "LOCATION",
	num_Client integer REFERENCES "CLIENT"
);
ALTER TABLE "LOUER" ADD PRIMARY KEY(id_Location, num_Client);

CREATE TABLE "POSSEDER"
(
	num_Agence integer  REFERENCES "AGENCE",
	num_Immatriculation integer REFERENCES "VEHICULE"
);
ALTER TABLE "POSSEDER" ADD PRIMARY KEY (num_Agence, num_Immatriculation);

CREATE TABLE "UTILITAIRE"
(
	num_Im integer PRIMARY KEY REFERENCES "VEHICULE",
	capacité integer,
	charge_Max integer
);
