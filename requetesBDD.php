<!DOCTYPE html>
<html>

<head>
  <title>REQUETES BDD 9 et 10</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<style type="text/css">
  h3{
    text-align: center;
    color: blue;
  }

</style>

<body>

<?php

$host = 'localhost';
$port= '5432';
$dbname = 'postgres';
$user = 'postgres';
$password = 'admin';

$dbconnect = pg_connect("host=$host dbname=$dbname user=$user password=$password");

//FORMULAIRE A L'ARRACHE POUR LE MOMENT (REQUETE 9)

echo "<h3>FORMULAIRE D'ENREGISTREMENT D'UNE LOCATION</h3>";
echo "<form action='requetesBDD.php' method='post' class='formulaire'>";
echo '<p>Id de la location : <input type="text" name="id"/></p>';
echo '<p>Jour d\'enregistrement : <input type="date" name="jourenregistrement"/>'.date('Y-m-d').'</p>'; //Il faut mettre des 'date' dans le formulaire sinon erreur.
echo '<p>Tarif du jour : <input type="text" name="tarifjour"/></p>';
echo '<p>Kilometrage de depart : <input type="text" name="kmdepart"/></p>';
echo '<p>Agence de depart : <input type="text" name="agdepart"/></p>';
echo '<p>Agence de retour : <input type="text" name="agretour"/></p>';
echo '<p>Nombre de jours : <input type="text" name="nbjours"/></p>';
echo '<p>Numero d\'immatriculation : <input type="text" name="numim"/></p>';
echo '<p><input type="submit" name="submitLoc" value="OK"/></p>';
echo "</form>";

//DEBUG ZONE
var_dump(isset($_POST['submitLoc']));
var_dump(empty($_POST['jourenregistrement']))
var_dump(empty($_POST['kmdepart']))

//ID_LOCATION, JOUR_ENREGISTREMENT, TARIF_JOUR, KILOMETRAGE_DEPART, AGENCE_DEPART, AGENCE_RETOUR, NUM_IM
if(!empty($_POST['id']) && !empty($_POST['jourenregistrement'])
&& !empty($_POST['tarifjour']) && !empty($_POST['kmdepart']) && !empty($_POST['agdepart']) !empty($_POST['agretour'])
&& !empty($_POST['nbjours']) && !empty($_POST['numim'])){

  $idLocation=$_POST['id'];
  $jourEnregistrement=$_POST['jourenregistrement'];
  $tarifJour=$_POST['tarifjour'];
  $kilometrageDepart=$_POST['kmdepart'];
  $agenceDepart=$_POST['agdepart'];
  $agenceRetour=$_POST['agretour'];
  $nbJours=$_POST['nbjours'];
  $numIm=$_POST['numim'];
  $query = "INSERT INTO \"LOCATION\" VALUES ($idLocation,$jourEnregistrement,$tarifJour,$kilometrageDepart,$agenceDepart,$agenceRetour,$nbJours,$numIm)";
  $result = pg_query($dbconnect,$query);
    if(!$result){
      echo "Erreur";
    }
    else{
      echo 'Votre location a bien été enregistrée, merci de votre visite :)';
    }
}
else{
  echo "Un des champs a été laissé vide, merci de recommencer\n"
}
/*EXCEPTIONS A PRENDRE EN COMPTE :
  -Caractères spéciaux à éviter.
  -Date à remplir pour jour_enregistrement
  -id location pas à remplir, automatique(ils se suivent)
  -kilométrage de départ déjà défini (rapport à kilométrage de VEHICULE)
  -numim doit exister dans VEHICULE
*/


//REQUETE 10 (EN COURS)
$nbJoursPrevu = "SELECT nb_Jours FROM \"LOCATION\"";
$resNbJoursPrevu = pg_query($dbconnect,$nbJoursPrevu);
$caution = "SELECT caution FROM \"VEHICULE\"";
$resCaution = pg_query($dbconnect,$caution);

echo "<h3>ENREGISTREMENT DE LA RESTITUTION D'UN VEHICULE</h3>";
echo "<form action='requetesBDD.php' method='post' class='formulaire'>";
echo '<p>Numero de plaque d\'immatriculation : <input type="text" name="numim"/></p>';
echo '<p>Nombre de jours : <input type="text" name="nbjours"/></p>';
echo '<p>Agence de rendu : <input type="text" name="agencerendu"/></p>';
echo '<p><input type="submit" name="submitRend" value="OK"/></p>';
echo '</form>';

if(isset($_POST['submitRend'])){
  $numIm=$_POST['numim'];
  $nbJours=$_POST['nbjours'];
  $agenceRendu=$_POST['agencerendu'];
  $query = "UPDATE \"VEHICULE\" SET id_Agence=$agenceRendu WHERE num_Im=$numIm";
  $result = pg_query($dbconnect,$query);
  if(!$result){
    echo "Erreur\n";
  }
  else{
    echo "Véhicule rendu !\n";
      if($nbJours==$resNbJoursPrevu){
        $prixAPayer = $nbJours*$resCaution;
      }
      else{
        $prixAPayer = ($nbJours*$resCaution)+1000;
      }
      echo "Vous devez payer : $prixAPayer €";
  }
  }



//DEBUG ZONE
var_dump(isset($_POST['submitRend']));

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

</body>

</html>
