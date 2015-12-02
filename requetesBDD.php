<?php

$host = 'localhost';
$port= '5432';
$dbname = 'postgres';
$user = 'postgres';
$password = 'admin';

$dbconnect = pg_connect("host=$host dbname=$dbname user=$user password=$password");

//$result = pg_query($dbconnect,'SELECT * FROM "AGENCE"');
//if (!$result) {
//  echo "Une erreur s'est produite.\n";
//  exit;
//}

//FORMULAIRE A L'ARRACHE POUR LE MOMENT (REQUETE 9)

echo "<h1>FORMULAIRE D'ENREGISTREMENT D'UNE LOCATION</h1>";
echo "<form action='requetesBDD.php' method='post'>";
echo '<p>Id de la location : <input type="text" name="id"/></p>';
echo '<p>Jour d\'enregistrement : <input type="text" name="jourenregistrement"/></p>'; //Il faut mettre des 'date' dans le formulaire sinon erreur.
echo '<p>Tarif du jour : <input type="text" name="tarifjour"/></p>';
echo '<p>Kilometrage de depart : <input type="text" name="kmdepart"/></p>';
echo '<p>Agence de depart : <input type="text" name="agdepart"/></p>';
echo '<p>Agence de retour : <input type="text" name="agretour"/></p>';
echo '<p>Numero d\'immatriculation : <input type="text" name="numim"/></p>';
echo '<p><input type="submit" value="OK"/></p>';
echo "</form>";

//ID_LOCATION, JOUR_ENREGISTREMENT, TARIF_JOUR, KILOMETRAGE_DEPART, AGENCE_DEPART, AGENCE_RETOUR, NUM_IM
$idLocation=$_POST['id'];
$jourEnregistrement=$_POST['jourenregistrement'];
$tarifJour=$_POST['tarifjour'];
$kilometrageDepart=$_POST['kmdepart'];
$agenceDepart=$_POST['agdepart'];
$agenceRetour=$_POST['agretour'];
$numIm=$_POST['numim'];

$query = "INSERT INTO \"LOCATION\" VALUES ($idLocation,$jourEnregistrement,$tarifJour,$kilometrageDepart,$agenceDepart,$agenceRetour,$numIm)";

//$query = "INSERT INTO \"LOCATION\" VALUES (6, '23/02/15',65,800,4,0,2,345432)";
pg_query($dbconnect,$query);


//while ($row = pg_fetch_row($result)) {
//  echo "Test: $row[0]  Test: $row[1]";
//  echo "<br />\n";
//}

pg_close($dbconnect);


?>
