<?php 
class dbManager
{
    private $host;
    private $dbname;
    private $user;
    private $password;
    private $connessione;
    private $stmt;
    public function __construct($filepath)
    {
        $files = file($filepath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        $this->host = $files[0];
        $this->dbname = $files[1];
        $this->user = $files[2];
        $this->password = $files[3];
    }
    public function __Connessione()
    {
        try
        {
            $this->connessione = new PDO("mysql:dbname={$this->dbname};host={$this->host}", $this->user,$this->password);
        }
        catch(PDOException $e)
        {
            die("connesione fallita : ".$e->getMessage());
        }   
    }
    public function __Insert_Into(array $params = [])
    {
        $this->__Connessione();
        $codice = $params['codice'];
        $titolo = $params['titolo'];
        $desc = $params['descrizione'];
        $str_data = $params['data_concerto']->format("Y-m-d");

        $this->__Prepare('insert into organizzazione_concerti.concerti(codice,titolo,descrizione,data_concerto) values (:codice,:titolo,:descrizione,:data_concerto)');
        $this->stmt->bindParam(':codice', $codice, PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo', $titolo, PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione', $desc, PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto', $str_data, PDO::PARAM_STR);

        return $this->__Execute();
    }
    public function __Last_Insert_Id()
    {
        return $this->connessione->lastInsertId();
    }
    public function __Find(int $id)
    {
        $this->__Connessione();
        $this->__Prepare('select * from organizzazione_concerti.concerti where id = :id');
        $this->stmt->bindParam(":id", $id, PDO::PARAM_INT);
        
        return $this->__Execute();
    }
    public function __Fetch_Next()
    {
        return $this->stmt->fetch();
    }
    public function __Find_All()
    {
        $concerti = [];
        $i = 0;
        $this->__Connessione();
        $this->__Prepare('select * from organizzazione_concerti.concerti');
        while ($obj = $this->__Fetch_Next()) {
            $concerti[$i++] = new Concerto($obj['codice'], $obj['titolo'], $obj['descrizione'], $obj['data_concerto']);
        }
        return $concerti;
    }
    public function __Delete(int $id)
    {
        $this->__Connessione();
        $this->__Prepare("delete from progetto_concerto.concerti where id = :id");
        $this->stmt->bindParam(":id", $id, PDO::PARAM_INT);

        return $this->__Execute();
    }
    public function __Find_Id(array $params = [])
    {
        $this->__Connessione();
        $this->__Prepare('select id from progetto_concerto.concerti where codice = :codice, titolo = :titolo, descrizione = :descrizione, data_concerto = :data_concerto');
        $this->stmt->bindParam(':codice', $params['codice'], PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo', $params['titolo'], PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione', $params['descrizione'], PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto', $params['data_concerto'], PDO::PARAM_STR);

        $result = $this->__Fetch_All();
        if ($result) {
            return $result['id'];
        }
        return false;
    }
    public function __Fetch_All()
    {
        return $this->stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function __Update(array $to_update = [], array $updated = [])
    {
        $query = 'update from organizzazione_concerti.concerti set codice = :codice and titolo = :titolo and descrizione = :descrizione and data_concerto = :data_concerto
        where codice = :codice2 and titolo = :titolo2 and descrizione = :descrizione2 and data_concerto = :data_concerto2';
        $this->__Prepare($query);
        $this->stmt->bindParam(':codice', $updated['codice'], PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo', $updated['titolo'], PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione', $updated['descrizione'], PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto', $updated['data_concerto'], PDO::PARAM_STR);

        $this->stmt->bindParam(':codice2', $to_update['codice'], PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo2', $to_update['titolo'], PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione2', $to_update['descrizione'], PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto2', $to_update['data_concerto'], PDO::PARAM_STR);
        
        return $this->__Execute();
    }
    public function __Prepare(string $query)
    {
        $this->connessione->prepare($query);
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