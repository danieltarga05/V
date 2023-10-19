<?php
require 'concerto.php';

//$record = new Concerto('C01','concerto1','descrizione','2023/10/16');
$record = new Concerto('C02', 'concerto2', 'descrizione2');
$array = (array) $record;
$id_creato = Concerto::Create($array);
echo "{$id_creato}\n";

$trovato = Concerto::Find($record);
echo "{$trovato}\n";

if ($record->__Delete()) {
    echo "bravo";
} else {
    echo "male";
}

?>