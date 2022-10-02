<?php

/* Clase encargada de gestionar las conexiones a la base de datos */
Class Db{

   private $servidor;
   private $usuario;
   private $password;
   private $base_datos;
   private $link;
   private $stmt;
   private $array;

   static $_instance;

   /*La funciÃ³n construct es privada para evitar que el objeto pueda ser creado mediante new*/
   private function __construct(){
      $this->setConexion();
      $this->conectar();
   }

   /*MÃ©todo para establecer los parÃ¡metros de la conexiÃ³n*/
   private function setConexion(){
      $conf = Conf::getInstance();
      $this->servidor=$conf->getHostDB();
      $this->base_datos=$conf->getDB();
      $this->usuario=$conf->getUserDB();
      $this->password=$conf->getPassDB();
   }

   /*Evitamos el clonaje del objeto. PatrÃ³n Singleton*/
   private function __clone(){ }

   /*FunciÃ³n encargada de crear, si es necesario, el objeto. Esta es la funciÃ³n que debemos llamar desde fuera de la clase para instanciar el objeto, y asÃ­, poder utilizar sus mÃ©todos*/
   public static function getInstance(){
      if (!(self::$_instance instanceof self)){
         self::$_instance=new self();
      }
         return self::$_instance;
   }

   /*Realiza la conexiÃ³n a la base de datos.*/
   private function conectar(){
      $this->link=mysqli_connect($this->servidor, $this->usuario, $this->password);
mysqli_select_db($this->link,$this->base_datos);
      @mysqli_query("SET NAMES 'utf8mb4'");
   }

   /*MÃ©todo para ejecutar una sentencia sql*/
   public function ejecutar($sql){
      $this->stmt=mysqli_query($this->link,$sql);
      return $this->stmt;
   }

   /*MÃ©todo para obtener una fila de resultados de la sentencia sql*/
   public function obtener_fila($stmt,$fila){
      if ($fila==0){
         $this->array=mysqli_fetch_array($stmt);
      }else{
         mysqli_data_seek($stmt,$fila);
         $this->array=mysqli_fetch_array($stmt);
      }
      return $this->array;
   }


   public function lastID(){
	   $query="SELECT DATE_SUB(NOW(), INTERVAL 4 HOUR)";
	   $this->stmt=mysqli_query($this->link,$query);
	 while($fila=mysqli_fetch_row($this->stmt)){
        $nombre=$fila[0];
           }
      return $nombre;
   }


public function ejecutarPrepared($sql){
	$this->stmt= mysqli_prepare($this->link,$sql);
     return $this->stmt;
}
 public function filas(){
    $fila=mysqli_affected_rows($this->link);
    return $fila;
}
public function error(){
    return mysqli_error($this->link);
}

public function errorPrepared(){
    return  mysqli_stmt_error($this->stmt);
}
public function filasEjecutadas(){
   return mysqli_affected_rows($this->link);
}
public function ultimoID(){
    
    return mysqli_insert_id($this->link);
}



}

?>