--DROP TABLE IF EXISTS "VEHICULE" CASCADE;
--DROP TABLE IF EXISTS "AGENCE" CASCADE;
--DROP TABLE IF EXISTS "CLIENT" CASCADE;
--DROP TABLE IF EXISTS "UTILITAIRE" CASCADE;
--DROP TABLE IF EXISTS "EMPLOYE" CASCADE;
--DROP TABLE IF EXISTS "LOCATION" CASCADE;
--DROP TABLE IF EXISTS "MODELE" CASCADE;
--DROP TABLE IF EXISTS "POSSEDER" CASCADE;

CREATE TABLE "CLIENT"
(
	numero integer PRIMARY KEY,
	nom char(30),
	adresse char(30),
	type_Client integer
);

CREATE TABLE "VEHICULE"
(
	num_Im integer PRIMARY KEY,
	date_Achat date,
	kilometrage integer,
	modèle char(30),
	marque char(30),
	caution int,
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
	kilometrage_location integer,
	nb_Jours integer,
	num_Im integer REFERENCES "VEHICULE",
	num_Client integer REFERENCES "CLIENT"

);

CREATE TABLE "POSSEDER"
(
	num_Agence integer  REFERENCES "AGENCE",
	num_Immatriculation integer REFERENCES "VEHICULE"
);
ALTER TABLE "POSSEDER" ADD PRIMARY KEY (num_Agence, num_Immatriculation);

CREATE TABLE "UTILITAIRE"
(
	id_Utilitaire integer PRIMARY KEY,
	capacité integer,
	charge_Max integer,
	num_Client integer REFERENCES "CLIENT"
);
