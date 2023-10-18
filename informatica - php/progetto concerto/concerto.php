<?php
require 'connessione.php';
class Concerto
{
    private $id;
    private $codice;
    private $titolo;
    private $descrizione;
    private $data_concerto;

    public function __construct($codice,$titolo,$desc,$data_concerto)
    {
        $this->__Set_Codice($codice);
        $this->__Set_Titolo($titolo);
        $this->__Set_Descrizione($desc);
        $this->__Set_Data_Concerto($data_concerto);
    }
    private function __Set_Id($var){$this->id=$var;}
    public function __Get_Id(){return $this->id;}
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
        $connessione = $db->__Connessione();

        $codice = $concerto->__Get_Codice();
        $titolo = $concerto->__Get_Titolo();
        $desc = $concerto->__Get_Descrizione();
        $data_conc = $concerto->__Get_Data_Concerto();
        
        $query = 'insert into progetto_concerto.concerti(codice,titolo,descrizione,data_concerto) 
                  values (:codice,:titolo,:descrizione,:data_concerto)';
        $statement = $connessione->prepare($query);
        $statement->bindParam(':codice',$codice,PDO::PARAM_STR);
        $statement->bindParam(':titolo',$titolo,PDO::PARAM_STR);
        $statement->bindParam(':descrizione',$desc,PDO::PARAM_STR);
        $statement->bindParam(':data_concerto',$data_conc,PDO::PARAM_STR);
        
        $risultato = $statement->execute();
        if($risultato)
        {
            $concerto->__Set_Id($connessione->lastInsertId());
            $connessione = null; //chiusura connessione
            return $concerto;
        }
        $connessione=null;
        return false;
    }

    public function __Delete()
    {
        if(!$this->__Validate_Id())
        {
            return false;
        }

        $db = new dbConnect("config.txt");
        $connessione = $db->__Connessione();

        $id = $this->__Get_Id();

        $query = "delete from progetto_concerto.concerti
                  where id = :id";
        $statement = $connessione->prepare($query);
        $statement->bindParam(":id",$id,PDO::PARAM_INT);

        $risultato = $statement->execute();
        if($risultato)
        {
            return true;
        }
        return false;
    }

    private function __Validate_Id()
    {
        if($this->__Get_Id()==null)
        {
            return false;
        }
        return true;
    }
}
?>