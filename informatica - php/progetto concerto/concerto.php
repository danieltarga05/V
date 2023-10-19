<?php
require 'db_management.php';
class Concerto
{
    private $id;
    private $codice;
    private $titolo;
    private $descrizione;
    private $data_concerto;
    public function __construct(int $codice, string $titolo, string $desc)
    {
        $this->__Set_Codice($codice);
        $this->__Set_Titolo($titolo);
        $this->__Set_Descrizione($desc);
        $this->__Set_Data_Concerto();
    }
    public function __Get_Id()
    {
        return $this->id;
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
    public function __Set_Data_Concerto()
    {
        $this->data_concerto = new DateTime("now");
    }
    public function __Get_Data_Concerto()
    {
        return $this->data_concerto;
    }
    public static function Create($array) //cambiare utilizzando un array associativo come parametro
    {
        $db = new dbManager("config.txt");
        $connessione = $db->__Connessione();

        $codice = $array['codice'];
        $titolo = $array['titolo'];
        $desc = $array['descrizione'];
        $data_conc = $array['data_concerto'];

        $query = 'insert into progetto_concerto.concerti(codice,titolo,descrizione,data_concerto) 
                  values (:codice,:titolo,:descrizione,:data_concerto)';
        $statement = $connessione->prepare($query);
        $statement->bindParam(':codice', $codice, PDO::PARAM_STR);
        $statement->bindParam(':titolo', $titolo, PDO::PARAM_STR);
        $statement->bindParam(':descrizione', $desc, PDO::PARAM_STR);
        $statement->bindParam(':data_concerto', $data_conc, PDO::PARAM_STR);

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
        $connessione = $db->__Connessione();
        $query = "select * from organizzazione_concerti.concerti";
        $statement = $connessione->prepare($query);
        $result = $statement->execute();
        if ($result) {
            $concerti = $statement->fetchAll();
            $array_concerti = array();
            for ($i = 0; $i < count($concerti); $i++) {
                $array_concerti[$i] = new Concerto($concerti['codice'], $concerti['titolo'], $concerti['descrizione']);
            }
            return $array_concerti;
        }
        return array();
    }
    public function __Delete()
    {
        $db = new dbManager("config.txt");
        $connessione = $db->__Connessione();
        $id = Concerto::Find($this);
        $query = "delete from progetto_concerto.concerti where id = :id";
        $statement = $connessione->prepare($query);
        $statement->bindParam(":id", $id, PDO::PARAM_INT);
        $risultato = $statement->execute();
        if ($risultato) {
            return true;
        }
        return false;
    }
}
?>