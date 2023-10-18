<?php
require 'concerto.php';

$record = new Concerto('C01','concerto1','descrizione','2023/10/16');
$record = Concerto::Create($record);
echo "{$record->__Get_Id()}";

if($record->__Delete())
{
    echo "bravo";
}
echo "male";

?>