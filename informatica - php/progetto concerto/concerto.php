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
    public static function Create(array $params = [])
    {
        $db = new dbManager('config.txt');
        $db->__Connessione();

        if ($result = $db->__Insert_Into($params)) {
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
        
        if ($risultato = $db->__Find($id)) {
            $fetch = $db->__Fetch_Next();
            $db->__Close();
            return $concerto = new Concerto($fetch['codice'], $fetch['titolo'], $fetch['descrizione'], $fetch['data_concerto']);
        }
        $db->__Close();
        return false;
    }
    public static function FindAll()
    {
        $db = new dbManager('config.txt');
        $db->__Connessione();
        if($concerti = $db->__Find_All()) {
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
        $concerto = Concerto::Find(Concerto::Validate_Id($this));
        $id = $concerto->__Get_Id();
        
        if ($result = $db->__Delete($id)) {
            $db->__Close();
            return $result;
        }
        $db->__Close();
        return false;
    }
    private static function Validate_Id(Concerto $concerto)
    {
        $db = new dbManager("config.txt");
        $db->__Connessione();
        $params = [
            'codice'=> $concerto->__Get_Codice(),
            'titolo'=> $concerto->__Get_Titolo(),
            'descrizione'=> $concerto->__Get_Descrizione(),
            'data_concerto'=> $concerto->__Get_Data_Concerto()
        ];
        if($id = $db->__Find_Id($params))
        {
            $db->__Close();
            return $id;
        }
        $db->__Close();
        return false;
    }
    public function __Update(array $params = [])
    {
        $new = $this->__Set_New();

        $db = new dbManager("config.txt");
        $db->__Connessione();
       
        $to_update = [
            'codice'=> $this->__Get_Codice(),
            'titolo'=> $this->__Get_Titolo(),
            'descrizione'=> $this->__Get_Descrizione(),
            'data_concerto'=> $this->__Get_Data_Concerto()
        ];
        $updated = [
            'codice'=> $new->__Get_Codice(),
            'titolo'=> $new->__Get_Titolo(),
            'descrizione'=> $new->__Get_Descrizione(),
            'data_concerto'=> $new->__Get_Data_Concerto()
        ];
        
        if ($result=$db->__Update($to_update,$updated)) {
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
    private function __Set_New(array $params = [])
    {
        $updated = Concerto::Find($this->__Get_Id());
        if (empty($params['codice'])) {
            $updated->__Set_Codice($params['codice']);
        }
        if (empty($params['titolo'])) {
            $updated->__Set_Titolo($params['titolo']);
        }
        if (empty($params['descrizione'])) {
            $updated->__Set_Descrizione($params['descrizione']);
        }
        if (empty($params['data_concerto'])) {
            $updated->__Set_Data_Concerto($params['data_concerto']);
        }
        return $updated;
    }
    public function __Show()
    {
        $show = Concerto::Find($this->__Get_Id());
        return "ID : {$show->__Get_Id()} - CODICE : {$show->__Get_Codice()} - TITOLO : {$this->__Get_Descrizione()} - DESCRIZIONE : {$this->__Get_Descrizione()} - DATA CONCERTO : {$this->__Get_Data_Concerto()->format("Y m d")}";
    }
}
function create()
{
    echo "Inserisci codice  : ";
    while(empty($codice))
    {
        $codice = readline();
    }
    echo "Inserisci titolo : ";
    while(empty($titolo)){
        $titolo = readline();
    }
    echo "Inserisci descrizione : ";
    while(empty($descrizione))
    {
        $descrizione = readline();
    }
    echo "Inserisci data : ";
    while(empty($data))
    {
        $data = readline();
        $dateTimeObj = DateTime::createFromFormat("Y m d", $data);
        if($dateTimeObj !== null){
            break;
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
        $params = [
            'codice' => readline(),
            'titolo' => readline(),
            'descrizione' => readline(),
            'data_concerto' => strtotime(readline())
        ];

        if ($result = $concerto->__Update($params)) {
            echo 'Record modificato';
            return;
        }
        echo 'Record non modificabile';
        return;
    }
    echo 'ID non esistente';
}
function find()
{
    echo "inserisci id : ";
    $id = readline();
    if ($concerto = Concerto::Find($id)) {
        echo "ID presente in concerti";
        return;
    }
    echo "ID non esistente";
}
function find_all()
{
    $concerti = Concerto::FindAll();
    foreach ($concerti as $a) {
        echo $a->__Get_Codice() . ' ' . $a->__Get_Titolo() . ' ' . $a->__Get_Data_Concerto()->format('Y m d') . PHP_EOL;
    }
}
function delete()
{
    echo "inserisci id : ";
    $id = readline();
    if ($concerto = Concerto::Find($id)) {
        $concerto->__Delete();
        echo 'Record eliminato.';
        return;
    }
    echo "ID non esistente";
}
function show()
{
    echo "inserisci id : ";
    $id = readline();
    if ($concerto = Concerto::Find($id)) {
        echo $concerto->__Show();
        return;
    }
    echo "ID non esistente";
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
            create();
            break;
        case 2:
            update();
            break;
        case 3:
            find();
            break;
        case 4:
            find_all();
            break;
        case 5:
            delete();
            break;
        case 6:
            show();
            break;
    }
}
?>