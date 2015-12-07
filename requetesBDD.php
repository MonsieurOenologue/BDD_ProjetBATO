<!DOCTYPE html>
<html>

<head>
  <title>REQUETES BDD 9 et 10</title>
  <!-- L'encodage UTF-8 nous sert ici à prendre en compte les caractères spéciaux tels que les accents -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<style type="text/css">
  /*Petit bout de CSS, pas indispensable du tout.*/
  h3{
    text-align: center;
    color: blue;
  }
</style>

<body>

<?php

//On stocke les informations de connexion à la base de données dans des variables.
$host = 'localhost';
$port= '5432';
$dbname = 'postgres';
$user = 'postgres';
$password = 'admin';

//On se connecte à la base de donnée locale grace à la fonction pg_connect
$dbconnect = pg_connect("host=$host dbname=$dbname user=$user password=$password");

//REQUETE 9 : ENREGISTREMENT D'UNE LOCATION

//PARTIE AFFICHAGE DU FORMULAIRE D'ENREGISTREMENT D'UNE LOCATION
echo "<h3>FORMULAIRE D'ENREGISTREMENT D'UNE LOCATION</h3>";
echo "<form action='requetesBDD.php' method='post' class='formulaire'>";
echo '<p>Id de la location : <input type="text" name="id"/></p>';
echo '<p>Jour d\'enregistrement : <input type="date" name="jourenregistrement" value="\''.date('d/m/Y').'\'"/></p>'; //Il faut mettre des 'date' dans le formulaire sinon erreur.
echo '<p>Tarif du jour : <input type="text" name="tarifjour"/></p>';
echo '<p>Kilometrage de depart : <input type="text" name="kmdepart"/></p>';
echo '<p>Agence de depart : <input type="text" name="agdepart"/></p>';
echo '<p>Agence de retour : <input type="text" name="agretour"/></p>';
echo '<p>Nombre de jours : <input type="text" name="nbjours"/></p>';
echo '<p>Numero d\'immatriculation : <input type="text" name="numim"/></p>';
echo '<p><input type="submit" name="submitLoc" value="OK"/></p>';
echo "</form>";


//PARTIE TRAITEMENT DE L'ENREGISTREMENT D'UNE LOCATION
if(isset($_POST['submitLoc']) && !empty($_POST['id']) && !empty($_POST['jourenregistrement']) && !empty($_POST['tarifjour'])
&& !empty($_POST['kmdepart']) && !empty($_POST['agdepart']) && !empty($_POST['agretour'])
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
else if(isset($_POST['submitLoc'])){
  echo "Un des champs a été laissé vide, merci de recommencer\n";
}
else{
  echo "Merci de remplir les champs";
}


//REQUETE 10 : ENREGISTREMENT DE LA RESTITUTION D'UN VEHICULE

//PARTIE AFFICHAGE DU FORMULAIRE D'ENREGISTREMENT D'UNE RESTITUTION DE VEHICULE
echo "<h3>ENREGISTREMENT DE LA RESTITUTION D'UN VEHICULE</h3>";
echo "<form action='requetesBDD.php' method='post' class='formulaire'>";
echo '<p>Numero de plaque d\'immatriculation : <input type="text" name="numim"/></p>';
echo '<p>Nombre de jours : <input type="text" name="nbjours"/></p>';
echo '<p>Agence de rendu : <input type="text" name="agencerendu"/></p>';
echo '<p><input type="submit" name="submitRend" value="OK"/></p>';
echo '</form>';

//PARTIE TRAITEMENT DE LA RESTITUTION D'UN VEHICULE
if(isset($_POST['submitRend']) && !empty($_POST['numim']) && !empty($_POST['nbjours'])){


  $numIm=$_POST['numim'];
  $nbJours=$_POST['nbjours'];
  $agenceRendu=$_POST['agencerendu'];

  $nbJoursPrevu = "SELECT nb_Jours FROM \"LOCATION\" WHERE num_Im=".$numIm."";
  $resNbJoursPrevu = pg_query($dbconnect,$nbJoursPrevu);
  $tarifTotal = "SELECT tarif_Jour FROM \"LOCATION\" WHERE num_Im=$numIm";
  $resTarifTotal = pg_query($dbconnect,$tarifTotal);

  $query = "UPDATE \"VEHICULE\" SET id_Agence=$agenceRendu WHERE num_Im=$numIm";
  $result = pg_query($dbconnect,$query);
  if(!$result){
    echo "Erreur\n";
  }
  else{
    echo "Véhicule rendu !\n";
      if($nbJours==$resNbJoursPrevu){
        $prixAPayer = ($nbJours*$resTarifTotal);
      }
      else{
        $prixAPayer = ($nbJours*$resTarifTotal)+1000;
      }
      echo "Vous devez payer : $prixAPayer €";
  }
  }
else if(isset($_POST['submitRend'])){
  echo "Un des champs a été laissé vide, merci de recommencer\n";
}
else{
  echo "Merci de remplir les champs";
}

//On ferme la connexion à la base de données, nos opérations ont été effectuées.
pg_close($dbconnect);
?>

</body>

</html>
