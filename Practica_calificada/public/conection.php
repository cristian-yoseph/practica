<?php

class conection{
    private $dsn = "mysql:host=127.0.0.1:3306;dbname=ventas";
    private $username = "root";
    private $password = "";
    private $option = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES "UTF8"');
    public $conectar;

    public function __construct(){
        $this ->conectar = new PDO($this->dsn, $this->username, $this->password);
    }


    public function Conectar(){
        return new PDO($this->dsn, $this->username, $this->password);
    }

    public function Desconectar(){
        $this ->conectar = null;

    }
}
