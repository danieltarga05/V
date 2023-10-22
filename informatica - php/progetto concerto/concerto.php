<?php
require 'db_manager.php';
class Concerto
{
    private $id;
    private $codice;
    private $titolo;
    private $descrizione;
    private $data_concerto;
    public function __construct($codice, $titolo, $descrizione, $data_concerto)
    {
        $this->__Set_Codice($codice);
        $this->__Set_Titolo($titolo);
        $this->__Set_Descrizione($descrizione);
        $this->__Set_Data_Concerto($data_concerto);
    }
    private function __Set_Id($var)
    {
        $this->id = $var;
    }
    public function __Get_Id()
    {
        return self::Validate_Id($this);
    }
    public function __Set_Codice($var)
    {
        $this->codice = $var;
    }
    public function __Get_Codice()
    {
        return $this->codice;
    }
    public function __Set_Titolo($var)
    {
        $this->titolo = $var;
    }
    public function __Get_Titolo()
    {
        return $this->titolo;
    }
    public function __Set_Descrizione($var)
    {
        $this->descrizione = $var;
    }
    public function __Get_Descrizione()
    {
        return $this->descrizione;
    }
    public function __Set_Data_Concerto($var)
    {
        $this->data_concerto = new DateTime($var);
    }
    public function __Get_Data_Concerto()
    {
        return $this->data_concerto;
    }
    public static function Create($array) //cambiare utilizzando un array associativo come parametro
    {
        $db = new dbManager('config.txt');
        $connessione = $db->__Connessione();

        $codice = $array['codice'];
        $titolo = $array['titolo'];
        $desc = $array['descrizione'];
        $data_conc = $array['data_concerto'];
        $str_data = $data_conc->format("Y-m-d H:i:s");

        $query = 'insert into organizzazione_concerti.concerti(codice,titolo,descrizione,data_concerto) values (:codice,:titolo,:descrizione,:data_concerto)';
        $statement = $connessione->prepare($query);
        $statement->bindParam(':codice', $codice, PDO::PARAM_STR);
        $statement->bindParam(':titolo', $titolo, PDO::PARAM_STR);
        $statement->bindParam(':descrizione', $desc, PDO::PARAM_STR);
        $statement->bindParam(':data_concerto', $str_data, PDO::PARAM_STR);

        $risultato = $statement->execute();
        if ($risultato) {
            $ritorno = $connessione->lastInsertId();
            $connessione = null; //chiusura connessione
            return $ritorno;
        }
        $connessione = null;
        return false;
    }
    public static function FindAll()
    {
        $db = new dbManager('config.txt');
        $concerti = [];
        $i = 0;
        $connessione = $db->__Connessione();
        $query = "select * from organizzazione_concerti.concerti";
        $statement = $connessione->query($query);
        while ($obj = $statement->fetch()) {
            $concerti[$i++] = new Concerto($obj['codice'], $obj['titolo'], $obj['descrizione'], $obj['data_concerto']);
        }
        $connessione = null;
        return $concerti;
    }
    public static function Find(int $id) //Tramite un id viene ritornato il corrispondente record
    {
        $db = new dbManager("config.txt");
        $connessione = $db->__Connessione();
        $query = "select * from organizzazione_concerti.concerti where id = :id";
        $statement = $connessione->prepare($query);
        $statement->bindParam(":id", $id, PDO::PARAM_INT);
        $risultato = $statement->execute();
        if ($risultato) {
            $fetch = $statement->fetch();
            $concerto = new Concerto($fetch['codice'],$fetch['titolo'],$fetch['descrizione'],$fetch['data_concerto']);
            $connessione=null;
            return $concerto;
        }
        $connessione=null;
        return null;
    }
    public function __Delete()
    {
        $db = new dbManager("config.txt");
        $connessione = $db->__Connessione();
        $concerto = Concerto::Find(Concerto::Validate_Id($this));
        $id = $concerto->__Get_Id();
        $query = "delete from progetto_concerto.concerti where id = :id";
        $risultato = $connessione->query($query);
        $risultato->bindParam(":id", $id, PDO::PARAM_INT);
        if ($risultato) {
            $connessione=null;
            return true;
        }
        $connessione=null;
        return false;
    }

    private static function Validate_Id(Concerto $concerto)
    {
        $db = new dbManager("config.txt");
        $connessione = $db->__Connessione();

        $codice = $concerto->__Get_Codice();
        $titolo = $concerto->__Get_Titolo();
        $desc = $concerto->__Get_Descrizione();
        $data_conc = $concerto->__Get_Data_Concerto();

        $query = 'select id from progetto_concerto.concerti 
                  where codice = :codice, titolo = :titolo, descrizione = :descrizione, data_concerto = :data_concerto';
        $statement = $connessione->prepare($query);
        $statement->bindParam(':codice',$codice,PDO::PARAM_STR);
        $statement->bindParam(':titolo',$titolo,PDO::PARAM_STR);
        $statement->bindParam(':descrizione',$desc,PDO::PARAM_STR);
        $statement->bindParam(':data_concerto',$data_conc,PDO::PARAM_STR);

        $statement->execute();
        $result = $statement->fetch(PDO::FETCH_ASSOC);
        if($result)
        {
            $connessione =null;
            return $result['id'];
        }
        $connessione=null;
        return false;
    }
}
?>