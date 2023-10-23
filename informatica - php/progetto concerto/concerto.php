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
    public function __Set_Data_Concerto($var)
    {
        $dateTimeObj = $var;
        if ($dateTimeObj == null) {
            $dateTimeObj = new DateTime();
        }
        $this->data_concerto = $dateTimeObj;
    }
    public function __Get_Data_Concerto()
    {
        return $this->data_concerto;
    }
    public static function Create(array $params = [])
    {
        $db = new dbManager('config.txt');
        $db->__Connessione();

        if ($db->__Insert_Into($params)) {
            $id = $db->__Last_Insert_Id();
            $db->__Close(); //chiusura connessione
            return $id;
        }
        $db->__Close();
        return false;
    }
    public static function Find(int $id) //Tramite un id viene ritornato il corrispondente record
    {
        $db = new dbManager("config.txt");
        $db->__Connessione();
        if ($db->__Find($id)) {
            $fetch = $db->__Fetch_Next();
            $db->__Close();
            $new = new Concerto(@$fetch['codice'], @$fetch['titolo'], @$fetch['descrizione'], @$fetch['data_concerto']);
            $new->__Set_Id($id);
            return $new;
        }
        $db->__Close();
        return false;
    }
    public static function FindAll()
    {
        $db = new dbManager('config.txt');
        $db->__Connessione();
        if ($concerti = $db->__Find_All()) {
            $db->__Close();
            return $concerti;
        }
        $db->__Close();
        return [];
    }
    public function __Delete()
    {
        $db = new dbManager("config.txt");
        $db->__Connessione();
        $concerto = Concerto::Find($this->__Get_Id());
        $id = $concerto->__Get_Id();
        if ($result = $db->__Delete($id)) {
            $db->__Close();
            return $result;
        }
        $db->__Close();
        return false;
    }
    private function Validate_Id()
    {
        $db = new dbManager("config.txt");
        $db->__Connessione();
        $params = [
            'codice' => $this->__Get_Codice(),
            'titolo' => $this->__Get_Titolo(),
            'descrizione' => $this->__Get_Descrizione(),
            'data_concerto' => $this->__Get_Data_Concerto()
        ];
        if ($id = $db->__Select_Id($params)) {
            echo 'Validate ID : ' . $id . PHP_EOL;
            $db->__Close();
            return $id;
        }
        $db->__Close();
        return false;
    }
    public function __Update(array $params)
    {
        $new = $this->__Set_New($params);
        $db = new dbManager("config.txt");
        $db->__Connessione();

        $to_update = [
            'codice' => $this->__Get_Codice(),
            'titolo' => $this->__Get_Titolo(),
            'descrizione' => $this->__Get_Descrizione(),
            'data_concerto' => $this->__Get_Data_Concerto()
        ];
        
        $updated = [
            'codice' => $new->__Get_Codice(),
            'titolo' => $new->__Get_Titolo(),
            'descrizione' => $new->__Get_Descrizione(),
            'data_concerto' => $new->__Get_Data_Concerto()
        ];

        if ($db->__Update($to_update, $updated)) {
            $this->__Set_Codice($updated['codice']);
            $this->__Set_Titolo($updated['titolo']);
            $this->__Set_Descrizione($updated['descrizione']);
            $this->__Set_Data_Concerto($updated['data_concerto']);
            $db->__Close();
            return true;
        }
        $db->__Close();
        return false;
    }
    private function __Set_New(array $params)
    {
        $updated = Concerto::Find($this->__Get_Id());
        if (!empty($params['codice'])) {
            $updated->__Set_Codice($params['codice']);
        }
        if (!empty($params['titolo'])) {
            $updated->__Set_Titolo($params['titolo']);
        }
        if (!empty($params['descrizione'])) {
            $updated->__Set_Descrizione($params['descrizione']);
        }
        if (!empty($params['data_concerto'])) {
            $updated->__Set_Data_Concerto($params['data_concerto']);
        }
        return $updated;
    }
    public function __Show()
    {
        $show = Concerto::Find($this->__Get_Id());

        return "ID : " . $show->__Get_Id() . " - CODICE : " . $show->__Get_Codice() . "- TITOLO : " . $show->__Get_Descrizione() . " - DESCRIZIONE : " . $show->__Get_Descrizione() . " - DATA CONCERTO : " . $show->__Get_Data_Concerto();
    }
}
function create()
{
    echo "Inserisci codice  : ";
    while (empty($codice)) {
        $codice = readline();
    }
    echo "Inserisci titolo : ";
    while (empty($titolo)) {
        $titolo = readline();
    }
    echo "Inserisci descrizione : ";
    while (empty($descrizione)) {
        $descrizione = readline();
    }
    echo "Inserisci data : ";
    while (empty($data)) {
        $data = readline();
        $dateTimeObj = DateTime::createFromFormat("Y-m-d", $data);
        if ($dateTimeObj == null) {
            $dateTimeObj = new DateTime();
        }
    }
    $params = [
        'codice' => $codice,
        'titolo' => $titolo,
        'descrizione' => $descrizione,
        'data_concerto' => $dateTimeObj
    ];
    if (Concerto::Create($params)) {
        echo "Record creato." . PHP_EOL;
        return;
    }
    echo "Record non creato" . PHP_EOL;
}
function update()
{
    echo "inserisci id del record da modificare : ";
    $id = readline();
    if ($concerto = Concerto::Find($id)) {
        echo "Inserisci nuovo codice  : ";
        $codice = readline();
        if(empty($codice))
        {
            $codice = $concerto->__Get_Codice();
        }
        echo "Inserisci titolo : ";
        $titolo = readline();
        if(empty($titolo))
        {
            $titolo = $concerto->__Get_Titolo();
        }
        echo "Inserisci descrizione : ";
        $descrizione = readline();
        if(empty($descrizione))
        {
            $descrizione = $concerto->__Get_Descrizione();
        }
        echo "Inserisci data : ";
        $data = readline();
        $dateTimeObj = DateTime::createFromFormat("Y-m-d", $data);
        if($dateTimeObj == null)
        {
            $dateTimeObj = $concerto->__Get_Data_Concerto(); 
        }
        $params = [
            'codice' => $codice,
            'titolo' => $titolo,
            'descrizione' => $descrizione,
            'data_concerto' => $dateTimeObj
        ];

        if ($concerto->__Update($params)) {
            echo 'Record modificato' . PHP_EOL;
            return;
        }
        echo 'Record non modificabile' . PHP_EOL;
        return;
    }
    echo 'ID non esistente' . PHP_EOL;
}
function find()
{
    echo "inserisci id : ";
    $id = readline();
    if (Concerto::Find($id)) {
        echo "ID presente in concerti." . PHP_EOL;
        return;
    }
    echo "ID non esistente" . PHP_EOL;
}
function find_all()
{
    $concerti = Concerto::FindAll();
    foreach ($concerti as $a) {
        echo $a->__Get_Codice() . ' ' . $a->__Get_Titolo() . ' ' . $a->__Get_Data_Concerto()->format('Y m d') . PHP_EOL;
    }
}
function delete() //funzione per l'implementazione del metodo d'istanza Delete() della classe Concerto su menu a riga di comando
{
    echo "inserisci id : "; //richiesta in input dell'id del record che si vuole eliminare
    $id = readline();
    if ($concerto= Concerto::Find($id)) { //se il record viene trovato (quindi $concerto = Concerto::Find($id) sara diverso da FALSE, inizia il processo di delete)
        if($concerto->__Delete()) //se il record viene effettivamente eliminato, viene comunicato all'utente
        {
            echo 'Record eliminato.' . PHP_EOL;
            return;
        }
        echo 'Record non eliminato.' . PHP_EOL;
        return; 
    }
    echo "ID non esistente" . PHP_EOL;
}
function show()
{
    echo "inserisci id : ";
    $id = readline();
    if ($concerto = Concerto::Find($id)) {
        echo $concerto->__Show();
        return;
    }
    echo "ID non esistente." . PHP_EOL;
}

while (1) {
    echo "1 - Crea record" . PHP_EOL;
    echo "2 - Modifica record" . PHP_EOL;
    echo "3 - Mostra record" . PHP_EOL;
    echo "4 - Mostra concerti" . PHP_EOL;
    echo "5 - Cancella record" . PHP_EOL;
    echo "6 - Cerca record" . PHP_EOL;
    echo "0 - Chiudi" . PHP_EOL;
    echo "Scegli opzione : ";
    $option = readline();
    switch ($option) {
        case 0:
            exit("Chiusura programma...");
        case 1:
            create(); //funziona
            break;
        case 2:
            update(); //funziona
            break;
        case 3:
            find(); //funziona
            break;
        case 4:
            find_all(); //?
            break;
        case 5:
            delete(); //?
            break;
        case 6:
            show();//
            break;
    }
}
?>