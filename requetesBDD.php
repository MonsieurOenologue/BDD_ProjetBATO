<?php

$host = 'localhost';
$port= '5432';
$dbname = 'postgres';
$user = 'postgres';
$password = 'admin';

$dbconnect = pg_connect("host=$host dbname=$dbname user=$user password=$password");

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
if(isset($_POST['submit'])){
  $idLocation=$_POST['id'];
  $jourEnregistrement=$_POST['jourenregistrement'];
  $tarifJour=$_POST['tarifjour'];
  $kilometrageDepart=$_POST['kmdepart'];
  $agenceDepart=$_POST['agdepart'];
  $agenceRetour=$_POST['agretour'];
  $numIm=$_POST['numim'];
  $query = "INSERT INTO \"LOCATION\" VALUES ($idLocation,$jourEnregistrement,$tarifJour,$kilometrageDepart,$agenceDepart,$agenceRetour,$numIm)";
  pg_query($dbconnect,$query);
  echo 'Votre location a bien été enregistrée, merci de votre visite :)';
}



//REQUETE 10 (EN COURS)
$nbJoursPrevu = "SELECT nb_Jours FROM \"LOCATION\"";

echo "<h1>ENREGISTREMENT DE LA RESTITUTION D'UN VEHICULE</h1>";
echo "<form action='requetesBDD.php' method='post'>";
echo '<p>Votre numero de client : <input type="text" name="numclient"/></p>';
echo '<p>Nombre de jours : <input type="text" name="nbjours"/></p>';
echo '<p>Agence de rendu : <input type="text" name="agencerendu"</p>';
echo '<p><input type="submit" value="OK"/></p>';
echo '</form>';

if(isset($_POST['submit'])){
  $numClient=$_POST['numclient'];
  $nbJours=$_POST['nbjours'];
  $agenceRendu=$_POST['agencerendu'];
  $query = "UPDATE \"VEHICULE\" SET id_Agence=$agenceRendu WHERE num_Client=$numClient";
  $result = pg_query($dbconnect,$query);

  if($nbJours==$nbJoursPrevu){
    $prixAPayer = $nbJours*$caution;
  }
  else{
    $prixAPayer = ($nbJours*$caution)+1000;
  }
  echo "Vous devez payer : $prixAPayer €";
}


//AFFICHAGE D'UNE TABLE (POUR TESTS)
/*
$query = "SELECT * FROM \"VEHICULE\"";
$result = pg_query($query) or die("Echec de la requête :".pg_last_error());
echo "<table/>\n";
while ($line=pg_fetch_array($result,null,PGSQL_ASSOC)){
  echo "\t<tr>\n";
  foreach ($line as $col_value) {
    echo "\t\t<td>$col_value</td>\n";
  }
  echo "\t</tr>\n";
}
echo "</table>\n";
pg_free_result($result);
*/

pg_close($dbconnect);
?>
