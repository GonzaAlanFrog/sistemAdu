<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
require 'Session.class.php';
include '../../log/Log.class.php';


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $datos = json_decode(file_get_contents("php://input"), true);

    $Bandera = $datos["Bandera"];
    $bd = Db::getInstance();
    $log= new Log();


    controlAcceso($Bandera);
}

$Bandera = $datos;

function controlAcceso($Bandera) {
    switch ($Bandera) {
        case 1;
            agregar();
            break;
        case 2;
            Modificar();

            break;
      
    }
}





function agregar() {
    $datos = json_decode(file_get_contents("php://input"), true);
    global $bd,$log;
    $data = Session::getInstance();
    var_dump($data);
    $id_funcionario=$data->idfuncionario;  
    $cajas = $datos["caja"];
    $monto = $datos["monto"];
    $log->insert('Nueva Apertura: '); 
    $log->insert('idfuncionario: '.$id_funcionario); 
    $log->insert('IdCaja: '.$cajas); 
    $log->insert('monto: '.$monto); 
    
//    $sql = "INSERT INTO `apertura_cierres`(`aper_monto`, `id_caja`,`id_funcionario`) VALUES  (?,?,?)";
    $sql = "INSERT INTO aper_cie(monto_ape, cod_caja,cod_usu) VALUES  (?,?,?)";
    
    $log->insert("Insert de apertura: ".$sql);
    
    $stmt3 = $bd->ejecutarPrepared($sql);
    //var_dump($stmt3);
        
    mysqli_stmt_bind_param($stmt3,"sss",$monto,$cajas,$id_funcionario);

    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
        $retorno = "Agregado";
        $json[] = array('retorno' => $retorno);
        $data->idfcaja=$cajas;
        $data->idapertura=$bd->ultimoID();
    } else {
        $retorno = "Error agreado";
        $json[] = array('retorno' => $retorno);
    }


    echo json_encode($json);
}

function Modificar() {
    global $bd;
    $data = Session::getInstance();
    $datos = json_decode(file_get_contents("php://input"), true);
    $monto = $datos["monto"];
    $idapertura =  $data->idapertura;


    $retorno = "";
    $json = array();
        
    $sql3 = "UPDATE `aper_cie`  SET `fecha_cie`=CURRENT_TIMESTAMP,`monto_cie`=? WHERE cod_aper_cie=?";
    //$sql3 = "UPDATE `usuarios` SET  `usu_nombre`=?,`usu_clave`=?,`id_funcionario`=?,`id_perfil`=? WHERE `id_usuario`=?";

    $log->insert("Update de apertura: ".$sql);
    
    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "ss", $monto, $idapertura);

    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
        $retorno = "Actualizado Correctamente";
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    } else if ($filas == 0) {
        $retorno = "No se han realizado cambios en el registro";
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    } else {
        $retorno = "Error Al actualizar";
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    }
}


