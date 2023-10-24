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
    private function __Set_Id($var) //metodo per il setting dell'id del concerto
    {
        $this->id = $var;
    }
    public function __Get_Id() //metodo per il getting dell'id del concerto
    {
        return $this->id;
    }
    public function __Set_Codice($var) //metodo per il setting del codice identificativo del concerto
    {
        $this->codice = $var;
    }
    public function __Get_Codice() //metodo per il getting del codice identificativo del concerto
    {
        return $this->codice;
    }
    public function __Set_Titolo($var) //metodo per il setting del titolo del concerto
    {
        $this->titolo = $var;
    }
    public function __Get_Titolo() //metodo per il getting del titolo del concerto
    {
        return $this->titolo;
    }
    public function __Set_Descrizione($var) //metodo per il setting della descrizione del concerto
    {
        $this->descrizione = $var;
    }
    public function __Get_Descrizione() //metodo per il getting della descrizione del concerto
    {
        return $this->descrizione;
    }
    public function __Set_Data_Concerto($var) //metodo per il setting della data del concerto
    {
        $dateTimeObj = $var;
        if ($dateTimeObj == null) {
            $dateTimeObj = new DateTime();
        }
        $this->data_concerto = $dateTimeObj;
    }
    public function __Get_Data_Concerto() //metodo per il getting della data del concerto
    {
        return $this->data_concerto;
    }
    public static function Create(array $params) //metodo per creare un record all'interno della tabella del database : ritorna il record appena creato
    {
        $db = new dbManager('config.txt'); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO

        if ($db->__Insert_Into($params)) {
            $id = $db->__Last_Insert_Id(); //settaggio del ritorno : verrà impostato in base all'ultimo id creato nella tabella
            $ritorno = Concerto::Find($id); //viene raccolto dal database l'ultimo record inserito in modo da settare anche l'id
            $db->__Close(); //chiusura connessione
            return $ritorno; //ritorno dell'oggetto creato
        }
        $db->__Close(); //chiusura connessione
        return false;
    }
    public static function Find(int $id) //metodo per la dircerca di un record tramite il suo id : verrà ritornato il corrispondente record
    {
        $db = new dbManager("config.txt"); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO
        if ($db->__Find($id)) { //metodo per la ricerca dell'oggetto tramite id all'interno della tabella concerti
            $fetch = $db->__Fetch_Next(); //metodo per il 'fetch' del primo record trovato in seguito ad una determinata query
            $db->__Close(); //chiusura connessione
            $new = new Concerto(@$fetch['codice'], @$fetch['titolo'], @$fetch['descrizione'], @$fetch['data_concerto']);
            $new->__Set_Id($id); //settaggio dell'id 
            return $new;
        }
        $db->__Close(); //chiusura connessione
        return false;
    }
    public static function FindAll() //metodo per mostrare all'utente tutti i record all'interno della tabella concerti : verrà ritornarto un array di concerti
    {
        $db = new dbManager('config.txt'); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO
        if ($concerti = $db->__Find_All()) { //metodo del dbManager per ritornare tutti i record all'interno della tabella concerti
            $db->__Close(); //chiusura connessione
            return $concerti;
        }
        $db->__Close(); //chiusura connessione
        return [];
    }
    public function __Delete() //metodo per l'eliminazione di un record dalla tabella concerti
    {
        $db = new dbManager("config.txt"); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO
        $concerto = Concerto::Find($this->__Get_Id()); //metodo per la ricerca dell'oggetto tramite id all'interno della tabella concerti
        $id = $concerto->__Get_Id();
        if ($result = $db->__Delete($id)) {
            $db->__Close(); //chiusura connessione
            return $result;
        }
        $db->__Close();
        return false;
    }
    public function __Update(array $params) //metodo utilizzato per modificare un record con una nuova configurazione presente in $params
    {
        $new = $this->__Set_New($params); //settaggio del nuovo record
        $db = new dbManager("config.txt"); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO

        $to_update = [
            //array chiave-valore utilizzato per la selezione e quindi modifica del record
            'codice' => $this->__Get_Codice(),
            'titolo' => $this->__Get_Titolo(),
            'descrizione' => $this->__Get_Descrizione(),
            'data_concerto' => $this->__Get_Data_Concerto()
        ];

        $updated = [ //array chiave-valore utilizzato per la selezione e quindi ricerca dell'id
            'codice' => $new->__Get_Codice(),
            'titolo' => $new->__Get_Titolo(),
            'descrizione' => $new->__Get_Descrizione(),
            'data_concerto' => $new->__Get_Data_Concerto()
        ];

        if ($db->__Update($to_update, $updated)) { //metodo che all'interno del database sovrascriverà il nuovo record
            $this->__Set_Codice($updated['codice']);
            $this->__Set_Titolo($updated['titolo']);
            $this->__Set_Descrizione($updated['descrizione']);
            $this->__Set_Data_Concerto($updated['data_concerto']);
            $db->__Close(); //chiusura connessione
            return true;
        }
        $db->__Close(); //chiusura connessione
        return false;
    }
    private function __Set_New(array $params) //metodo utilizzato per il settaggio del nuovo record
    {
        $updated = Concerto::Find($this->__Get_Id()); //metodo per la ricerca dell'oggetto tramite id all'interno della tabella concerti
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
    public function __Show() //metodo per mostrare all'utente un record della tabella concerti : verrà tornata una stringa impostata in base agli attributi
    {
        $show = Concerto::Find($this->__Get_Id()); //metodo per la ricerca dell'oggetto tramite id all'interno della tabella concerti

        return "ID : " . $show->__Get_Id() . " - CODICE : " . $show->__Get_Codice() . "- TITOLO : " . $show->__Get_Descrizione() . " - DESCRIZIONE : " . $show->__Get_Descrizione() . " - DATA CONCERTO : " . $show->__Get_Data_Concerto();
    }
}
function create() //funzione utilizzata per l'implementazione del metodo create in un menu a riga di comando
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
function update() //funzione utilizzata per l'implementazione del metodo update su menu a riga di comando
{
    echo "inserisci id del record da modificare : ";
    $id = readline();
    if ($concerto = Concerto::Find($id)) {
        echo "Inserisci nuovo codice  : ";
        $codice = readline();
        if (empty($codice)) {
            $codice = $concerto->__Get_Codice();
        }
        echo "Inserisci titolo : ";
        $titolo = readline();
        if (empty($titolo)) {
            $titolo = $concerto->__Get_Titolo();
        }
        echo "Inserisci descrizione : ";
        $descrizione = readline();
        if (empty($descrizione)) {
            $descrizione = $concerto->__Get_Descrizione();
        }
        echo "Inserisci data : ";
        $data = readline();
        $dateTimeObj = DateTime::createFromFormat("Y-m-d", $data);
        if ($dateTimeObj == null) {
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
function find() //funzione utilizzata per l'implementazione del metodo find su menu a riga di comando
{
    echo "inserisci id : ";
    $id = readline();
    if (Concerto::Find($id)) { //metodo per la ricerca dell'oggetto tramite id all'interno della tabella concerti
        echo "ID presente in concerti." . PHP_EOL;
        return;
    }
    echo "ID non esistente" . PHP_EOL;
}
function find_all() //funzione utilizzata per l'implementazione del metodo find_all su menu a riga di comando
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
    if ($concerto = Concerto::Find($id)) { //se il record viene trovato (quindi $concerto = Concerto::Find($id) sara diverso da FALSE, inizia il processo di delete)
        if ($concerto->__Delete()) //se il record viene effettivamente eliminato, viene comunicato all'utente
        {
            echo 'Record eliminato.' . PHP_EOL;
            return;
        }
        echo 'Record non eliminato.' . PHP_EOL;
        return;
    }
    echo "ID non esistente" . PHP_EOL;
}
function show() //funzione utilizzata per l'implementazione del metodo show su menu a riga di comando
{
    echo "inserisci id : ";
    $id = readline();
    if ($concerto = Concerto::Find($id)) {
        echo $concerto->__Show();
        return;
    }
    echo "ID non esistente." . PHP_EOL;
}

while (1) { //menu a riga di comando
    echo "premere 1 per creare un record" . PHP_EOL;
    echo "premere 2 per mostrare un record" . PHP_EOL;
    echo "premere 3 per modificare un record" . PHP_EOL;
    echo "premere 4 per eliminare un record" . PHP_EOL;
    echo "premere 5 per mostrare tutti i records presenti nella tabella" . PHP_EOL;
    echo "premere 0 per terminare il programma" . PHP_EOL;
    echo "Scegli opzione : ";
    $option = readline();
    switch ($option) {
        case 0:
            exit("Chiusura programma...");
        case 1:
            create();
            break;
        case 2:
            show();
            break;
        case 3:
            update();
            break;
        case 4:
            delete();
            break;
        case 5:
            find_all();
            break;
    }
}
?>