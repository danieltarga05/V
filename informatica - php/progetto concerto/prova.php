<?php
require 'concerto.php';

//$record = new Concerto('C01','concerto1','descrizione','2023/10/16');
/*$record = new Concerto('C02', 'concerto2', 'descrizione2');
$array = [
    'codice'=> $record->__Get_Codice(),
    'titolo'=> $record->__Get_Titolo(),
    'descrizione'=> $record->__Get_Descrizione(),
    'data_concerto'=> $record->__Get_Data_Concerto()
];
$id_creato = Concerto::Create($array);
echo "{$id_creato}\n";*/

$concerti = Concerto::FindAll();
foreach ($concerti as $a) {
    echo $a->__Get_Codice() . ' ' . $a->__Get_Titolo() . ' ' . $a->__Get_Data_Concerto()->format('Y m d') . PHP_EOL;
}

/*$concerti = Concerto::FindAll();
foreach($concerto as $concerti)
{
    echo "ID: " . $utente['id'] . "<br>";
    echo "Codice: " . $utente['codice'] . "<br>";
    echo "Titolo: " . $utente['titolo'] . "<br>";
    echo "Descrizione" . $utente['descrizione'] . "<br>";
    echo "Data" . $utente['data_concerto'] . "<br>";
}

/*$trovato = Concerto::Find($record);
echo "{$trovato}\n";

if ($record->__Delete()) {
    echo "bravo";
} else {
    echo "male";
}*/

?>