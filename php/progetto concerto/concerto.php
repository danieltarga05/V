<?php
require 'connessione.php';
class Concerto
{

    private $id = 0;
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

        $result = $db->__Insert($concerto);
        return $result;
    }
}
?>