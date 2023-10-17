<?php
require 'concerto.php';

$record = new Concerto('C01','concerto1','descrizione','2023/10/16');
$risultato = Concerto::Create($record);
echo "{$risultato}";

?>