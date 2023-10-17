<?php

$user = "root";
$pass = "";
$dbname = "test_connessione";
$host = "localhost";


try
{

    $dbh = new PDO("mysql:dbname={$dbname};host={$host}", $user,$pass);
}
catch(PDOException $e)
{
    die("connesione fallita : ".$e->getMessage());
}

echo "cazzo duro";

?>