<?php
require 'connessione.php';
class Concerto
{
    private static $id = 0;
    private $codice;
    private $titolo;
    private $descrizione;
    private $data_concerto;

    public function __construct($codice,$titolo,$desc,$data_concerto)
    {
        self::$id++;
        $this->__Set_Codice($codice);
        $this->__Set_Titolo($titolo);
        $this->__Set_Descrizione($desc);
        $this->__Set_Data_Concerto($data_concerto);
    }
    public function __Get_Id(){return self::$id;}
    public function __Set_Codice($var){$this->codice=$var;}
    public function __Get_Codice(){return $this->codice;}
    public function __Set_Titolo($var){$this->titolo = $var;}
    public function __Get_Titolo(){return $this->titolo;}
    public function __Set_Descrizione($var){$this->descrizione=$var;}
    public function __Get_Descrizione(){return $this->descrizione;}
    public function __Set_Data_Concerto($var){$this->data_concerto=$var;}
    public function __Get_Data_Concerto(){return $this->data_concerto;}

    public static function Create($concerto)
    {
        $db = new dbConnect("config.txt");
        $db->__Connessione();

        $codice = $concerto->__Get_Codice();
        $titolo = $concerto->__Get_Titolo();
        $desc = $concerto->__Get_Descrizione();
        $data_conc = $concerto->__Get_Data_Concerto();
        
        $query = 'insert into progetto_concerto.concerti(codice,titolo,descrizione,data_concerto) 
                  values (:codice,:titolo,:descrizione,:data_concerto)';
        $statement = $db->__Prepare($query);
        $statement->bindParam(':codice',$codice,PDO::PARAM_STR);
        $statement->bindParam(':titolo',$titolo,PDO::PARAM_STR);
        $statement->bindParam(':descrizione',$desc,PDO::PARAM_STR);
        $statement->bindParam(':data_concerto',$data_conc,PDO::PARAM_STR);
        $risultato = $statement->execute();
        if($risultato)
        {  
            $db->__Chiusura();
            return true;
        }
        $db->__Chiusura();
        return false;
    }
}
?>