<?php

$host = 'localhost';
$port= '5432';
$dbname = 'postgres';
$user = 'postgres';
$password = 'admin';

$dbconnect = pg_connect("host=$host dbname=$dbname user=$user password=$password");

$result = pg_query($dbconnect,'SELECT * FROM "AGENCE"');
if (!$result) {
  echo "Une erreur s'est produite.\n";
  exit;
}

while ($row = pg_fetch_row($result)) {
  echo "Test: $row[0]  Test: $row[1]";
  echo "<br />\n";
}

pg_close($dbconnect);


?>
