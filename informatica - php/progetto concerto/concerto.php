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
    public static function Create(array $params) //metodo per creare un record all'interno della tabella del database : ritorna l'id del record appena creato
    {
        $db = new dbManager('config.txt'); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO

        if ($db->__Insert_Into($params)) {
            $id = $db->__Last_Insert_Id();
            $ritorno = Concerto::Find($id); //settaggio del ritorno : verrà impostato in modo da ritornare un oggetto concerto completamente configurato (avviene il set dell'id)
            $db->__Close(); //chiusura connessione
            return $ritorno;
        }
        $db->__Close(); //chiusura connessione
        return false;
    }
    public static function Find($id) //metodo per la dircerca di un record tramite il suo id : verrà ritornato il corrispondente record
    {
        $db = new dbManager("config.txt");  //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO
        if ($fetch = $db->__Find($id)) { //metodo per la ricerca dell'oggetto tramite id all'interno della tabella concerti
            $new = new Concerto(strval($fetch->codice), strval($fetch->titolo), strval($fetch->descrizione), strval($fetch->data_concerto));//creazione di un oggetto tramite gli attributi dell'ultimo oggetto "raccolto", fetchato
            $new->__Set_Id($fetch->id);//settaggio dell'id 
            $db->__Close(); //chiusura connessione
            return $new; //ritorno dell'oggetto trovato
        }
        $db->__Close(); //chiusura connessione
        return false;
    }
    public static function FindAll()
    {
        $db = new dbManager('config.txt'); // Creazione di un'istanza di dbManager con il file di configurazione
        $db->__Connessione(); // Connessione al database tramite PDO
        try {
            $concerti = $db->__Find_All(); // Ottenimento di tutti i record dalla tabella dei concerti
            return $concerti ?: []; // Restituzione dell'array dei concerti se presente, altrimenti un array vuoto
        } finally {
            $db->__Close(); // Chiusura della connessione al database, indipendentemente dall'esito precedente
        }
    }
    public function __Delete() //metodo per l'eliminazione di un record dalla tabella concerti
    {
        $db = new dbManager("config.txt"); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO
        $concerto = Concerto::Find($this->__Get_Id()); //metodo per la ricerca dell'oggetto tramite id all'interno della tabella concerti
        $id = $concerto->__Get_Id();
        if ($result = $db->__Delete($id)) {
            $db->__Close();//chiusura connessione
            return $result;
        }
        $db->__Close();
        return false;
    }
    public function __Update(array $params)//metodo utilizzato per modificare un record con una nuova configurazione presente in $params
    {
        $new = $this->__Set_New($params);//settaggio del nuovo record
        $db = new dbManager("config.txt"); //classe utilizzata per gestire il database organizzazione_concerti
        $db->__Connessione(); //metodo per la connessione al database tramite PDO

        $to_update = [ //array chiave-valore utilizzato per la selezione e quindi modifica del record
            'codice' => $this->__Get_Codice(),
            'titolo' => $this->__Get_Titolo(),
            'descrizione' => $this->__Get_Descrizione(),
            'data_concerto' => $this->__Get_Data_Concerto()
        ];
        
        $updated = [//array chiave-valore utilizzato per la selezione e quindi ricerca dell'id
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
            $db->__Close();//chiusura connessione
            return true;
        }
        $db->__Close(); //chiusura connessione
        return false;
    }
    private function __Set_New(array $params) //metodo utilizzato per il settaggio di un nuovo record
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
        return "ID : {$show->__Get_Id()} - CODICE : {$show->__Get_Codice()} - TITOLO : {$show->__Get_Descrizione()} - DESCRIZIONE : {$show->__Get_Descrizione()} - DATA CONCERTO : {$show->__Get_Data_Concerto()} " . PHP_EOL;
    }
}
function create() //metodo utilizzata per l'implementazione del metodo create in un menu a riga di comando
{
    echo "Inserisci codice  : ";
    while (empty($codice)) {//controllo di validià della stringa in input, verrà richiesta finché non è ritenuta valida
        $codice = readline();
    }
    echo "Inserisci titolo : ";
    while (empty($titolo)) {//controllo di validià della stringa in input, verrà richiesta finché non è ritenuta valida
        $titolo = readline();
    }
    echo "Inserisci descrizione : ";
    while (empty($descrizione)) {//controllo di validià della stringa in input, verrà richiesta finché non è ritenuta valida
        $descrizione = readline();
    }
    echo "Inserisci data : ";
    while (empty($data)) {//controllo di validià della stringa in input, verrà richiesta finché non è ritenuta valida
        $data = readline();
        $dateTimeObj = DateTime::createFromFormat("Y-m-d", $data);
        if ($dateTimeObj == null) {
            $dateTimeObj = new DateTime();
        }
    }
    $params = [//creazione di una nuova configurazione da inserire
        'codice' => $codice,
        'titolo' => $titolo,
        'descrizione' => $descrizione,
        'data_concerto' => $dateTimeObj
    ];
    if (Concerto::Create($params)) {//verrà quindi creato un record nella tabella concerti grazie alla configurazione inserita dall'utente
        echo "Record creato.\n";//se il record viene effettivamente inserito, viene comunicato all'utente
        return;
    }
    echo "Record non creato.\n";
}
function show() //metodo utilizzato per l'implementazione del metodo show su menu a riga di comando
{
    echo "inserisci id : ";
    $id = readline(); //richiesta in input dell'id del record che si vuole mostrare
    if ($concerto = Concerto::Find($id)) {
        echo $concerto->__Show(); //se il record rispettivo viene trovato, questo viene mostrato
        return;
    }
    echo "ID non esistente.\n";
}
function update() //metodo utilizzata per l'implementazione del metodo update su menu a riga di comando
{
    echo "inserisci id del record da modificare : ";
    $id = readline(); //richiesta in input dell'id del record che si vuole modificare
    if ($concerto = Concerto::Find($id)) {//se il record rispettivo viene trovato, inizia il processo di update
        echo "Inserisci nuovo codice  : ";
        $codice = readline();
        if(empty($codice))//controllo di validià della stringa in input, se non valida verrà utilizzato l'attributo originale
        {
            $codice = $concerto->__Get_Codice();
        }
        echo "Inserisci titolo : ";
        $titolo = readline();
        if(empty($titolo))//controllo di validià della stringa in input, se non valida verrà utilizzato l'attributo originale
        {
            $titolo = $concerto->__Get_Titolo();
        }
        echo "Inserisci descrizione : ";
        $descrizione = readline();
        if(empty($descrizione))//controllo di validià della stringa in input, se non valida verrà utilizzato l'attributo originale
        {
            $descrizione = $concerto->__Get_Descrizione();
        }
        echo "Inserisci data : ";
        $data = readline();
        $dateTimeObj = DateTime::createFromFormat('Y-m-d', $data);
        if($dateTimeObj == null)//controllo di validià della stringa in input, se non valida verrà utilizzato l'attributo originale
        {
            $dateTimeObj = $concerto->__Get_Data_Concerto(); 
        }
        
        $params = [ //creazione di una nuova configurazione da utilizzare
            'codice' => $codice,
            'titolo' => $titolo,
            'descrizione' => $descrizione,
            'data_concerto' => $dateTimeObj
        ];

        if ($concerto->__Update($params)) {//verrà quindi sovrascritto il record stesso utilizzando la nuova configurazione richiesta su linea di comando
            echo "Record modificato.\n"; //se il record viene effettivamente modificato, viene comunicato all'utente
            return;
        }
        echo "Record non modificabile.\n";
        return;
    }
    echo "ID non esistente.\n";
}
function delete() //metodo per l'implementazione della metodo d'istanza Delete() della classe Concerto su menu a riga di comando
{
    echo 'inserisci id : '; 
    $id = readline(); //richiesta in input dell'id del record che si vuole eliminare
    if ($concerto= Concerto::Find($id)) { //se il record viene trovato, inizia il processo di delete
        if($concerto->__Delete()) //se il record viene effettivamente eliminato, viene comunicato all'utente
        {
            echo "record eliminato.\n";
            return;
        }
        echo "record non eliminabile.\n";
        return; 
    }
    echo "ID non esistente.\n";
}
function find_all() //metodo utilizzata per l'implementazione della metodo Find_All() della classe Concerto su menu a riga di comando
{
    $concerti = Concerto::FindAll();
    foreach ($concerti as $a) {//verranno stampate a video le stringhe preimpostate in modo da visualizzare tutti i dati dei concerti inseriti nel database
        echo $a->__Show() . PHP_EOL;
    }
}

while (1) { //menu a riga di comando
    echo "premere 1 per creare un record\n";
    echo "premere 2 per mostrare un record\n";
    echo "premere 3 per modificare un record\n";
    echo "premere 4 per eliminare un record\n";
    echo "premere 5 per mostrare tutti i records presenti nella tabella\n";
    echo "premere 0 per terminare il programma\n";
    echo "scegli opzione : ";
    $option = readline();
    switch ($option) {
        case 0:
            exit('chiusura programma...');
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