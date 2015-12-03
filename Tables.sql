--CREATION DES TABLES ET DES COLONNES DES TABLES

CREATE TYPE type_of_client AS ENUM ('particulier', 'entreprise');
CREATE TABLE "CLIENT"
(
	numero serial PRIMARY KEY,
	nom char(30),
	adresse char(30),
	type_Client type_of_client
);

CREATE TABLE "AGENCE"
(
	id_Agence serial PRIMARY KEY,
	nom char(30),
	adresse char(30)
);

CREATE TABLE "VEHICULE"
(
	num_Im int PRIMARY KEY,
	id_Agence integer REFERENCES "AGENCE",
	date_Achat date,
	kilometrage integer,
	modele char(30),
	marque char(30),
	caution integer
);

CREATE TYPE type_of_employe AS ENUM ('responsable', 'technicien', 'commercial');
CREATE TABLE "EMPLOYE"
(
	numero serial PRIMARY KEY,
	nom char(30),
	adresse char(30),
	date_Embauche date,
	type_Employe type_of_employe,
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

CREATE TABLE "CORRESPONDRE"
(
	id_Location integer REFERENCES "LOCATION",
	num_Client integer REFERENCES "CLIENT"
);
ALTER TABLE "CORRESPONDRE" ADD PRIMARY KEY(id_Location, num_Client);

CREATE TABLE "UTILITAIRE"
(
	num_Im int PRIMARY KEY REFERENCES "VEHICULE",
	capacité integer,
	charge_Max integer
);
