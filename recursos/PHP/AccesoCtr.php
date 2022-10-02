<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
require 'Session.class.php';
include '../../log/Log.class.php';



if($_SERVER['REQUEST_METHOD']=='POST'){
    $datos = json_decode(file_get_contents("php://input"),true);
    $data = Session::getInstance();
    $Bandera = $datos["Bandera"];
    $bd=Db::getInstance();
    $usuario = $datos["usuario"];   
    $clave = $datos["clave"];   
    
    $log= new Log();
    
    $log->insert('Inciando Sesion');    
    $log->insert('Datos Recibidos:');    
    $log->insert('Usuario: '.$usuario);    
    $log->insert('Password: '.$clave);
    
// $sql="SELECT id_funcionario,id_perfil,id_usuario FROM usuarios WHERE usu_nombre='$usuario' and usu_clave='$clave'"; 
    $sql="SELECT cod_emple, cod_perfil_usu, cod_usu FROM usuario WHERE usuario ='$usuario' and clave ='$clave'"; 
    
    $log->insert('SQL ACCESO:'.$sql);

 //SELECT id_funcionario,id_perfil FROM usuarios WHERE usu_nombre='rgonzalez' and usu_clave='12345' 
        $stmt=$bd->ejecutar($sql);

    /*Realizamos un bucle para ir obteniendo los resultados*/
    $json=array();
    if($fila=$bd->obtener_fila($stmt,0)){
    $id_funcionario=$fila[0]; 
    $id_perfil=$fila[1]; 
    $id=$fila[2];
    $Cod_Respuesta="0"; 
    $json[]= array(
        'Cod_Respuesta'=> $Cod_Respuesta,
        'id_perfil'=> $id_perfil,
        'id_funcionario'=>$id_funcionario);
        $data->idkey = $id;      
        $data->idperfil = $id_perfil;      
        $data->idfuncionario = $id_funcionario;     
    
        $log->insert('El usuario '.$usuario.' Se ha Logueado xdxd');    
        $log->insert('Fin Session'); 
        
    }else{
    $Cod_Respuesta="1"; 
    $json[]= array('Cod_Respuesta'=> $Cod_Respuesta);
    
    $log->insert('El usuario '.$usuario.' No pudo Iniciar Sesion');    
    $log->insert('Fin Session');    
    
    }

        echo json_encode($json);

 }
 

