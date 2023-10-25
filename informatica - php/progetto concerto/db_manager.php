<?php
class dbManager //classe utilizzata per gestire il database organizzazione_concerti
{
    private $host;
    private $dbname;
    private $user;
    private $password;
    private $connessione;
    private $stmt;
    public function __construct($filepath) //metodo costruttore della classe dbManager : verrà impostata la connessione al database in base al file di configurazione
    {
        $files = file($filepath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        $this->host = $files[0];
        $this->dbname = $files[1];
        $this->user = $files[2];
        $this->password = $files[3];
    }
    public function __Connessione() //metodo per la connessione al database tramite PDO
    {
        try {
            $this->connessione = new PDO("mysql:dbname={$this->dbname};host={$this->host}", $this->user, $this->password); //connessione al database
        } catch (PDOException $e) {
            die("connesione fallita : " . $e->getMessage()); //se viene catturata un eccezione tramite try catch, quindi trovato un errore durante la connessione al database, questo viene comunicato all'utente
        }
    }
    public function __Prepare($query) //metodo utilizzato per preparare il database alla query da eseguire
    {
        $this->stmt = $this->connessione->prepare($query);
    }
    public function __Execute() //metodo utilizzato per controllare l'esito della query eseguita
    {
        return $this->stmt->execute();
    }
    public function __Close() //metodo utilizzato per chiudere la connessione al database
    {
        $this->connessione = null;
    }
    public function __Insert_Into(array $params) //metodo utilizzato per la query di inserimento di record dentro la tabella concerto
    {
        $this->__Connessione(); //connessione al database
        $str_data = $params['data_concerto']->format("Y-m-d"); //conversione in stringa della data del concerto
        $this->__Prepare('insert into organizzazione_concerti.concerti(codice,titolo,descrizione,data_concerto) 
        values (:codice,:titolo,:descrizione,:data_concerto)'); //metodo per la preparazione della query da eseguire
        $this->stmt->bindParam(':codice', $params['codice'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':titolo', $params['titolo'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':descrizione', $params['descrizione'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':data_concerto', $str_data, PDO::PARAM_STR); //binding del parametro desiderato

        return $this->__Execute(); //viene ritornato l'esito dell'esecuzione della query eseguita
    }
    public function __Last_Insert_Id() //metodo utilizzato per trovare l'id dell'ultimo record inserito all'interno del database
    {
        return $this->connessione->lastInsertId();
    }
    public function __Find($id) //metodo utilizzato per la query select: in questo metodo verra ritornato il primo record positivo alla query da eseguire
    {
        $this->__Connessione(); //connessione al database
        $this->__Prepare('select * from organizzazione_concerti.concerti where id = :id'); //preparazione della query da eseguire
        $this->stmt->bindParam(":id", $id, PDO::PARAM_INT); //binding del parametro desiderato
        if (!$this->__Execute()) { //viene controllato l'esito della query eseguita
            return false;
        }
        return $this->__Fetch_Next(); //ritorno del primo elemento fetchato che rispondeva alla query eseguita
    }
    public function __Fetch_Next() //metodo utilizzato per eseguire fetch dei record da manipolare
    {
        return $this->stmt->fetch(PDO::FETCH_OBJ); //tramite il flag PDO::FETCH_OBJ vengono creati oggetti con proprietà nominate come le colonne della tabella fetchata
    }
    public function __Find_All() //metodo utilizzato per la query di select : in questo metodo verranno trovati tutti i record presenti all'interno della tabella scelta
    {
        $i = 0; //indice
        $concerti = []; //vettore che conterrà (o no) tutti i record inseriti all'intero del database
        $this->__Connessione(); //connessione al database
        $this->__Prepare('select * from organizzazione_concerti.concerti'); //preparazione della query da eseguire
        if (!$this->__Execute()) { //viene controllato l'esito della query eseguita
            return false;
        }

        while ($record = $this->__Fetch_Next()) { //ritorno ciclico del primo elemento fetchato che rispondeva alla query eseguita, fino alla fine della tabella
            $tmp = concerto::Find($record->id); //viene configurato completamente il record fetchato (viene settato l'id)
            $concerti[$i++] = $tmp;
        }
        return $concerti; //ritorno dell'array contenente i record della tabella del database
    }
    public function __Delete(int $id) //metodo utilizzato per la query delete : in questo modo verranno eliminati i record positivi alla query da eseguire
    {
        $this->__Connessione(); //connessione al database
        $this->__Prepare("delete from organizzazione_concerti.concerti where id = :id"); //preparazione della query da eseguire
        $this->stmt->bindParam(":id", $id, PDO::PARAM_INT); //binding del parametro desiderato

        return $this->__Execute(); //ritorno del primo elemento fetchato che rispondeva alla query eseguita
    }
    public function __Update(array $to_update, array $updated) //metodo utilizzato per la query update : in questo modo verranno modificati record positivi alla query da eseguire
    {
        $str_data1 = $to_update['data_concerto'];
        $data2 = $updated['data_concerto'];
        if (is_string($data2)) { //si verifica che il value presente sia una stringa, e quindi non modificata in precedenza
            $str_data2 = $str_data1;
        } else {
            $str_data2 = $data2->format('Y-m-d');
        }
        $this->__Connessione(); //connessione al database
        $this->__Prepare('update organizzazione_concerti.concerti set codice = :codice, titolo = :titolo, descrizione = :descrizione, data_concerto = :data_concerto
        where codice = :codice2 and titolo = :titolo2 and descrizione = :descrizione2 and data_concerto = :data_concerto2'); //preparazione della query da eseguire
        $this->stmt->bindParam(':codice', $updated['codice'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':titolo', $updated['titolo'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':descrizione', $updated['descrizione'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':data_concerto', $str_data2, PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':codice2', $to_update['codice'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':titolo2', $to_update['titolo'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':descrizione2', $to_update['descrizione'], PDO::PARAM_STR); //binding del parametro desiderato
        $this->stmt->bindParam(':data_concerto2', $str_data1, PDO::PARAM_STR); //binding del parametro desiderato

        return $this->__Execute();
    }
}
?>