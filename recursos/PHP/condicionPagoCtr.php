<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
include '../../log/Log.class.php';



if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $datos = json_decode(file_get_contents("php://input"), true);

    $Bandera = $datos["Bandera"];
    $bd = Db::getInstance();
   



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
        case 3;
            Eliminar();

            break;
        case 4;
            cargartabla();

            break;

    }
}



function cargartabla() {
    global $bd;
    $sql = "SELECT `cod_condi`, `descrip_condi` FROM `condicion_pago`";
    
    $stmt = $bd->ejecutar($sql);
    

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    

    while ($fila = $bd->obtener_fila($stmt, 0)) {
        

        $cod_condi = $fila[0];
        $descrip_condi = $fila[1];


        $json[] = array(
            'cod_condi' => $cod_condi,
            'descrip_condi' => $descrip_condi
      
        );
        
    }

    echo json_encode($json);
}

function agregar() {
    $datos = json_decode(file_get_contents("php://input"), true);
    global $bd;
    $descrip_condi = $datos["descrip_condi"];  
  
       $sql = "INSERT INTO `condicion_pago`(`descrip_condi`) VALUES  (?)";

    $stmt3 = $bd->ejecutarPrepared($sql);
    //var_dump($stmt3);

    mysqli_stmt_bind_param($stmt3,"s",$descrip_condi);

    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
        $retorno = "Agregado";
        $json[] = array('retorno' => $retorno);
    } else {
        $retorno = "Error agregando";
        $json[] = array('retorno' => $retorno);
    }


    echo json_encode($json);
}

function Modificar() {
    global $bd;
    $datos = json_decode(file_get_contents("php://input"), true);
       
    $cod_condi = $datos["cod_condi"];
    $descrip_condi = $datos["descrip_condi"];
    
    $retorno = "";
    $json = array();
        
     $sql3 = "UPDATE `condicion_pago` SET `descrip_condi`=? WHERE `cod_condi`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);
    
    mysqli_stmt_bind_param($stmt3, "ss",$descrip_condi,$cod_condi);

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

function Eliminar() {
    global $bd;
    $datos = json_decode(file_get_contents("php://input"), true);
        
    $cod_condi = $datos["cod_condi"];
    $retorno = "";
    $json = array();

    $sql3 = "DELETE FROM `condicion_pago` where `cod_condi`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "s", $cod_condi);
    
    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
        $retorno = "Eliminado Correctamente";
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    } else {
        $retorno = "Error Al Eliminar ".mysqli_stmt_error($stmt3);
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    }
}

