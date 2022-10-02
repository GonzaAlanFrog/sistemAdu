<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';



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
    $sql = "SELECT * FROM ciudad";
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


    global $bd;
    $sql = "INSERT INTO ciudad (descrip_ciu) VALUES (?)";

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
    $id_ciudad = $datos["id_ciudad"];
    $descripcion = $datos["Descripcion"];

    $retorno = "";
    $json = array();

    $sql3 = "UPDATE ciudad SET descrip_ciu=? WHERE cod_ciu=?";
//UPDATE `ciudades` SET `id_ciudad`=?, ciu_descripcion=?
    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "ss", $descripcion, $id_ciudad);

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
    $id_ciudad = $datos["id_ciudad"];
    $retorno = "";
    $json = array();

    $sql3 = "DELETE FROM ciudad WHERE cod_ciu=?";
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
