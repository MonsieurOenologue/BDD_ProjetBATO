--DROP TABLE IF EXISTS "VEHICULE" CASCADE;
--DROP TABLE IF EXISTS "AGENCE" CASCADE;
--DROP TABLE IF EXISTS "CLIENT" CASCADE;
--DROP TABLE IF EXISTS "UTILITAIRE" CASCADE;
--DROP TABLE IF EXISTS "EMPLOYE" CASCADE;
--DROP TABLE IF EXISTS "LOCATION" CASCADE;
--DROP TABLE IF EXISTS "LIAISON" CASCADE;
--DROP TABLE IF EXISTS "EMPRUNTER" CASCADE;
--DROP TABLE IF EXISTS "MODELE" CASCADE;
--DROP TABLE IF EXISTS "LOUER" CASCADE;
--DROP TABLE IF EXISTS "POSSEDER" CASCADE;

CREATE TABLE "VEHICULE"
(
	num_Im integer PRIMARY KEY,
	date_Achat date,
	kilometrage integer,
	modèle char(30),
	marque char(30),
	caution int
);

CREATE TABLE "AGENCE"
(
	id_Agence integer PRIMARY KEY,
	nom char(30),
	adresse char(30)
);

CREATE TABLE "CLIENT"
(
	numero integer PRIMARY KEY,
	nom char(30),
	adresse char(30)
);

CREATE TABLE "LIAISON"
(
	id_Agence integer REFERENCES "AGENCE",
	num_Client integer REFERENCES "CLIENT"
);
ALTER TABLE "LIAISON" ADD PRIMARY KEY (id_Agence, num_Client);

CREATE TABLE "EMPLOYE"
(
	numero integer PRIMARY KEY,
	nom char(30),
	adresse char(30),
	date_Embauche date,
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
	num_Im integer REFERENCES "VEHICULE"

);

CREATE TABLE "LOUER"
(
	id_Location integer REFERENCES "LOCATION",
	num_Client integer REFERENCES "CLIENT"
);
ALTER TABLE "LOUER" ADD PRIMARY KEY (id_Location, num_Client);

CREATE TABLE "EMPRUNTER"
(
	num_Immatriculation integer REFERENCES "VEHICULE",
	num_Client integer REFERENCES "CLIENT"
);
ALTER TABLE "EMPRUNTER" ADD PRIMARY KEY (num_Immatriculation, num_Client);

CREATE TABLE "POSSEDER"
(
	num_Agence integer  REFERENCES "AGENCE",
	num_Immatriculation integer REFERENCES "VEHICULE"
);
ALTER TABLE "POSSEDER" ADD PRIMARY KEY (num_Agence, num_Immatriculation);

CREATE TABLE "MODELE"
(
	id_Modele integer PRIMARY KEY,
	num_Immatriculation integer REFERENCES "VEHICULE"
);

CREATE TABLE "UTILITAIRE"
(
	id_Utilitaire integer PRIMARY KEY,
	id_Mod integer REFERENCES "MODELE",
	capacité integer,
	charge_Max integer
);
