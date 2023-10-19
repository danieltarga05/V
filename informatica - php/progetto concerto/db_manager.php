<?php 
class dbManager
{
    private $host;
    private $dbname;
    private $user;
    private $password;
    private $connessione;

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
            return new PDO("mysql:dbname={$this->dbname};host={$this->host}", $this->user,$this->password);
        }
        catch(PDOException $e)
        {
            die("connesione fallita : ".$e->getMessage());
        }   
    }
}
?>