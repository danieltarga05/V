<?php 

//require 'concerto.php';

class dbManager
{
    private $host;
    private $dbname;
    private $user;
    private $password;
    private $connessione;

    public function __construct($filepath)
    {
        $files = file($filepath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        $this->host = $files[0];
        $this->dbname = $files[1];
        $this->user = $files[2];
        $this->password = $files[3];
    }

    public function __Connessione()
    {
        try
        {
            return new PDO("mysql:dbname={$this->dbname};host={$this->host}", $this->user,$this->password);
        }
        catch(PDOException $e)
        {
            die("connesione fallita : ".$e->getMessage());
        }   
    }

    /*public function __Insert($concerto)
    {
        $codice = $concerto->__Get_Codice();
        $titolo = $concerto->__Get_Titolo();
        $desc = $concerto->__Get_Descrizione();
        $data_conc = $concerto->__Get_Data_Concerto();
        
        $query = 'insert into progetto_concerto.concerti(codice,titolo,descrizione,data_concerto) 
                  values (:codice,:titolo,:descrizione,:data_concerto)';
        $result = $this->connessione->prepare($query);
        $result->bindParam(':codice',$codice,PDO::PARAM_STR);
        $result->bindParam(':titolo',$titolo,PDO::PARAM_STR);
        $result->bindParam(':descrizione',$desc,PDO::PARAM_STR);
        $result->bindParam(':data_concerto',$data_conc,PDO::PARAM_STR);

        $check_execute = $result->execute();
        if($check_execute)
        {
            $ritorno = $this->connessione->lastInsertId();
            $this->connessione = null; //chiusura connessione
            return $ritorno;
        }
        return false;
    }*/

    /*public function __Operazioni($query,$concerto)
    {

    }*/

    /*public function __Query($query,$stm,$connessione,$params)
    {
        $stm=$connessione->prepare($query);
        $stm->bindParam(':codice')
    }*/
}
?>