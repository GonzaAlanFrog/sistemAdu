<?php

date_default_timezone_set('America/Asuncion');


class Log{


public function __construct()
{

$date     = date("Y-m-d ");

$this->path ="../../log/logs_txt/";
$this->filename = "log_$date";

$this->dateS     = date("Y-m-d H:i:s");

$this->ip       = ($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : 0;

}




public function insert($text)
{
    

$date   = "";
$append =FILE_APPEND;

$log    = $this->dateS . " [ip] " . $this->ip . " [text] " . $text . PHP_EOL;
$result = (file_put_contents($this->path . $this->filename .".log", $log, $append)) ? 1 : 0;
 
return $result;


}

}
?>
