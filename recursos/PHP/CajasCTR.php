<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
include '../../log/Log.class.php';




if ($_SERVER['REQUEST_METHOD'] == 'POST') {

	$datos;
	$Bandera;
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
    $sql = "SELECT * FROM caja";
//SELECT * FROM `ciudades`
    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {


        $id = $fila[0];
        $descripcion = $fila[1];


        $json[] = array(
            'id' => $id,
            'descripcion' => $descripcion);
    }

    echo json_encode($json);
}

function agregar() {
    $datos = json_decode(file_get_contents("php://input"), true);
    $Descripcion = $datos["Descripcion"];
    
        $log= new Log();    

    global $bd;
    $sql = "INSERT INTO caja (descrip_caja) VALUES (?)";
    
   
    $stmt3 = $bd->ejecutarPrepared($sql);

    mysqli_stmt_bind_param($stmt3, "s", $Descripcion);

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
    $id_caja = $datos["id_caja"];
    $descripcion = $datos["Descripcion"];

    $retorno = "";
    $json = array();

    $sql3 = "UPDATE caja SET descrip_caja=? WHERE cod_caja=?";
//UPDATE `ciudades` SET `id_ciudad`=?, ciu_descripcion=?
    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "ss", $descripcion, $id_caja);

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
    $id_ciudad = $datos["id_caja"];
    $retorno = "";
    $json = array();

    $sql3 = "DELETE FROM caja WHERE cod_caja=?";
//DELETE FROM `ciudades` WHERE '8'
    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "i", $id_ciudad);

    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
        $retorno = "Eliminado Correctamente";
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    } else {
        $retorno = "Error Al Eliminar";
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    }
}
