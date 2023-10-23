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
        $obj = $this->__Fetch_All();
        foreach ($obj as $record) {
            $concerti[$i++] = new Concerto($record['codice'], $record['titolo'], $record['descrizione'], $record['data_concerto']);
        }
        return $concerti;
    }
    public function __Delete(int $id)
    {
        $this->__Connessione();
        $this->__Prepare("delete from organizzazione_concerti.concerti where id = :id");
        echo $id . PHP_EOL;
        $this->stmt->bindParam(":id", $id, PDO::PARAM_INT);

        return $this->__Execute();
    }
    public function __Select_Id(array $params)
    {
        $this->__Connessione();
        if (!is_string($params['data_concerto'])) {
            $str_data = $params['data_concerto']->format('Y-m-d H:i:s');
        } else {
            $str_data = $params['data_concerto'];
        }
        $this->__Prepare('select id from organizzazione_concerti.concerti where codice = :codice and titolo = :titolo and descrizione = :descrizione and data_concerto = :data_concerto');
        $this->stmt->bindParam(':codice', $params['codice'], PDO::PARAM_STR);
        $this->stmt->bindParam(':titolo', $params['titolo'], PDO::PARAM_STR);
        $this->stmt->bindParam(':descrizione', $params['descrizione'], PDO::PARAM_STR);
        $this->stmt->bindParam(':data_concerto', $str_data, PDO::PARAM_STR);

        if ($result = $this->__Fetch_Next()) {
            echo 'id trovato in select ' . $result['id'];
            return $result['id'];
        }
        return false;
    }
    public function __Fetch_Assoc()
    {
        return $this->stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function __Fetch_All()
    {
        return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function __Update(array $to_update, array $updated)
    {
        $str_data1 = $to_update['data_concerto'];

        $data2 = $updated['data_concerto'];
        if (is_string($data2)) //si verifica che il value presente sia una stringa, e quindi non modificata in precedenza
        {
            $str_data2 = $str_data1;
        } else {
            $str_data2 = $data2->format('Y-m-d H:i:s');
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