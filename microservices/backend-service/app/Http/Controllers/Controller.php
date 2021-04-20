<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Medoo\Medoo;
use PDO;

class Controller extends BaseController
{
    public $database;
    public $connectest;
        
    public function __construct()
    {
    }

    public function connect($database_name)
    {
        $database_type = env('DB_CONNECTION');
        //$database_name = env('DB_DATABASE');
        $user = env('DB_USERNAME');
        $password = env('DB_PASSWORD');
        $port = env('DB_PORT');
        $server = env('DB_HOST');
                   
        // realiza autenticacion con parametros
        $default = array(
                  // required
                  'database_type' => "$database_type",
                  'database_name' => "$database_name",
                  'server' => "$server",
                  'username' => "$user",
                  'password' => "$password",
    
                  // [optional]
                  'charset' => 'utf8',
                  'port' => $port,
    
                  // [optional] Enable logging (Logging is disabled by default for better performance)
                  'logging' => true,
    
                  // [optional] driver_option for connection, read more from http://www.php.net/manual/en/pdo.setattribute.php
                  'option' => array(
                    PDO::ATTR_CASE => PDO::CASE_NATURAL, PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC,
                  ),
    
                  // [optional] Medoo will execute those commands after connected to the database for initialization
                  'command' => array(
                    'SET SQL_MODE=ANSI_QUOTES',
                ),
                  );
    
        $this->database = new Medoo($default);
    }
}
