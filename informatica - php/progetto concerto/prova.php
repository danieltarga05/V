<?php
require 'concerto.php';

$record = new Concerto('C01','concerto1','descrizione','2023/10/16');
$id_creato = Concerto::Create($record);
echo "{$id_creato}";

$trovato = Concerto::Find($record);
echo "{$trovato}";

/*if($record->__Delete())
{
    echo "bravo";
}
else
{
    echo "male";
}*/

?>