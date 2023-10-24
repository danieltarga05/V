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
        $this->password = "";
    }
    public function __Connessione() //metodo per la connessione al database tramite PDO
    {
        try {
            $this->connessione = new PDO("mysql:dbname={$this->dbname};host={$this->host}", $this->user, $this->password);
        } catch (PDOException $e) {
            die("connesione fallita : " . $e->getMessage());
        }
    }
    public function __Insert_Into(array $params)
    {
        $this->__Connessione();
        $str_data = $params['data_concerto']->format("Y-m-d");
        $this->__Prepare('insert into organizzazione_concerti.concerti(codice,titolo,descrizione,data_concerto) values (:codice,:titolo,:descrizione,:data_concerto)');
        $this->stmt->bindParam(':codice', $params['codice'], PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo', $params['titolo'], PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione', $params['descrizione'], PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto', $str_data, PDO::PARAM_STR);

        return $this->stmt->execute();
    }
    public function __Last_Insert_Id()
    {
        return $this->connessione->lastInsertId();
    }
    public function __Find($id)
    {
        $this->__Connessione();
        $this->__Prepare('select * from organizzazione_concerti.concerti where id = :id');
        $this->stmt->bindParam(":id", $id, PDO::PARAM_INT);

        if(!$this->__Execute())
        {
            return false;
        }
        return $this->__Fetch_Next();
    }
    public function __Fetch_Next()
    {
        return $this->stmt->fetch(PDO::FETCH_OBJ);
    }
    public function __Find_All()
    {
        $concerti = [];
        $i = 0;
        $this->__Connessione();
        $this->__Prepare('select * from organizzazione_concerti.concerti');
        if(!$this->__Execute())
        {
            return false;
        }

        while($row = $this->__Fetch_Next())
        {
            $tmp = concerto::Find($row->id);
            $concerti[$i++] = $tmp;
        }
        return $concerti;
    }
    public function __Delete(int $id)
    {
        $this->__Connessione();
        $this->__Prepare("delete from organizzazione_concerti.concerti where id = :id");
        $this->stmt->bindParam(":id", $id, PDO::PARAM_INT);

        return $this->__Execute();
    }
    public function __Update(array $to_update, array $updated)
    {
        $str_data1 = $to_update['data_concerto'];

        $data2 = $updated['data_concerto'];
        if (is_string($data2)) //si verifica che il value presente sia una stringa, e quindi non modificata in precedenza
        {
            $str_data2 = $str_data1;
        } else {
            $str_data2 = $data2->format('Y-m-d');
        }

        $query = 'update organizzazione_concerti.concerti set codice = :codice, titolo = :titolo, descrizione = :descrizione, data_concerto = :data_concerto
        where codice = :codice2 and titolo = :titolo2 and descrizione = :descrizione2 and data_concerto = :data_concerto2';
        $this->__Prepare($query);
        $this->stmt->bindParam(':codice', $updated['codice'], PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo', $updated['titolo'], PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione', $updated['descrizione'], PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto', $str_data2, PDO::PARAM_STR);

        $this->stmt->bindParam(':codice2', $to_update['codice'], PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo2', $to_update['titolo'], PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione2', $to_update['descrizione'], PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto2', $str_data1, PDO::PARAM_STR);

        return $this->__Execute();
    }
    public function __Prepare($query)
    {
        $this->stmt = $this->connessione->prepare($query);
    }
    public function __Execute()
    {
        return $this->stmt->execute();
    }
    public function __Close()
    {
        $this->connessione = null;
    }
}
?>
