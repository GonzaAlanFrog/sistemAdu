<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
require 'Session.class.php';
include '../../log/Log.class.php';



if($_SERVER['REQUEST_METHOD']=='POST'){
   $log= new Log();
   $datos = json_decode(file_get_contents("php://input"), true);
    $bd = Db::getInstance();
    $data = Session::getInstance();
    $Bandera = $datos["Bandera"];
    
        
    
    
    switch ($Bandera) {
        case '1':
    $bd = Db::getInstance();
    $Cod_Respuesta=""; 
    $id_perfil=""; 
    $id_funcionario=""; 
         
            
            
    if($data->idkey !=null){
        
         $log->insert('buscar apertura cierre'); 
        
        $sql = "SELECT * FROM `aper_cie` WHERE cod_usu=$data->idfuncionario and fecha_cie is null" ;

        //"SELECT * FROM `apertura_cierres` WHERE id_funcionario=$data->idfuncionario and cierre_fecha is null";
        //
        $log->insert("select apertura: ".$sql);

        //echo $sql;
        $stmt = $bd->ejecutar($sql);
        ///var_dump($bd);
        //var_dump($stmt);
        $cajayes =false;
        if ($bd->obtener_fila($stmt,0)) {
        $cajayes =true;
        }else{
         $cajayes =true;   
        }   
        
        if($cajayes){
          $Cod_Respuesta="inciado"; 
          $id_perfil=$data->idperfil; 
          $id_funcionario=$data->idfuncionario;  
        } else {
            $Cod_Respuesta="caja_cerrada"; 
            $id_perfil=''; 
            $id_funcionario='';   
        }
        

    $json[]= array('estado'=> $Cod_Respuesta,
        'id_perfil'=> $id_perfil,
        'id_funcionario'=> $id_funcionario); 
    echo json_encode($json);    

    }else{
        
    $Cod_Respuesta="cerrado"; 
    $json[]= array('estado'=> $Cod_Respuesta);
    echo json_encode($json);
    }
            
    break;
        case '2':
        $data->destroy();   
    break;
   }
   
   
   
   
 }




