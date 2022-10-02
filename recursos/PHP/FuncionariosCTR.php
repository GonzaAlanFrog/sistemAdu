<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';



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
        case 5;
            cargarCargos();

            break;
        case 6;
            cargarCiudad();

            break;
    }
}

function cargartabla() {
    global $bd;
    $sql = "SELECT
    f.`id_funcionario`,
    f.`fun_ci`,
    f.`fun_nombres`,
    f.`fun_apellidos`,
    f.`fun_telefono`,
    f.`fun_direccion`,
    f.`fun_email`,
    c.car_descripcion,
    ciu.ciu_descripcion
FROM
    `funcionarios` f
    INNER JOIN cargos c on c.id_cargo= f.id_cargo
    INNER JOIN ciudades ciu on ciu.id_ciudad = f.id_ciudad
    ";
//$sql="SELECT `id_funcionario`, `nombre_usaurio`, `apellido_usuario`, `direccion_usuario`, `ci_funcionario`, `fecha_nacimiento` FROM `funcionario`"; 

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {


        $id_funcionario = $fila[0];
        $fun_ci = $fila[1];
        $fun_nombre = $fila[2];
        $fun_apellido = $fila[3];
        $fun_telefono = $fila[4];
        $fun_direccion = $fila[5];
        $fun_imail = $fila[6];
        $id_cargo = $fila[7];
        $id_ciudad = $fila[8];

        $json[] = array(
            'id_funcionario' => $id_funcionario,
            'fun_ci' => $fun_ci,
            'fun_nombre' => $fun_nombre,
            'fun_apellido' => $fun_apellido,
            'fun_telefono' => $fun_telefono,
            'fun_direccion' => $fun_direccion,
            'fun_imail' => $fun_imail,
            'id_cargo' => $id_cargo,
            'id_ciudad' => $id_ciudad);
    }

    echo json_encode($json);
}

function agregar() {
    $datos = json_decode(file_get_contents("php://input"), true);
    $fun_ci = $datos["fun_ci"];
    $fun_nombre = $datos["fun_nombres"];
    $fun_apellido = $datos["fun_apellido"];
    $fun_telefono = $datos["fun_telefono"];
    $fun_direccion = $datos["fun_direccion"];
    $fun_imail = $datos["fun_imail"];
    $id_cargo = $datos["id_cargo"];
    $id_ciudad = $datos["id_ciudad"];


    global $bd;
    $sql = "INSERT INTO `funcionarios`( `fun_ci`, `fun_nombres`, `fun_apellidos`, `fun_telefono`, `fun_direccion`, `fun_email`, `id_cargo`, `id_ciudad`) VALUES (?,?,?,?,?,?,?,?)";

    $stmt3 = $bd->ejecutarPrepared($sql);

    mysqli_stmt_bind_param($stmt3, "ssssssss", $fun_ci, $fun_nombre, $fun_apellido, $fun_telefono, $fun_direccion, $fun_imail, $id_cargo, $id_ciudad);

    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
        $retorno = "Agregado";
        $json[] = array('retorno' => $retorno);
    } else {
        $retorno = "Error agreado";
        $json[] = array('retorno' => $retorno);
    }


    echo json_encode($json);
}

function Modificar() {
    global $bd;
    $datos = json_decode(file_get_contents("php://input"), true);
    $fun_ci = $datos["fun_ci"];
    $fun_nombre = $datos["fun_nombres"];
    $fun_apellido = $datos["fun_apellido"];
    $fun_telefono = $datos["fun_telefono"];
    $fun_direccion = $datos["fun_direccion"];
    $fun_imail = $datos["fun_imail"];
    $id_cargo = $datos["id_cargo"];
    $id_ciudad = $datos["id_ciudad"];
    $id_funcionario = $datos["id_funcionario"];
    ///var_dump($datos);
    $retorno = "";
    $json = array();

    $sql3 = "UPDATE
    funcionarios
SET
    fun_ci = ?,
    fun_nombres = ?,
    fun_apellidos = ?,
    fun_telefono = ?,
    fun_direccion = ?,
    fun_email = ?,
    id_cargo = ?,
    id_ciudad = ?
WHERE
     id_funcionario  = ?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "sssssssss", $fun_ci, $fun_nombre, $fun_apellido, $fun_telefono, $fun_direccion, $fun_imail, $id_cargo, $id_ciudad,$id_funcionario);

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
        //+$bd->errorPrepared()
        $retorno = "Error Al actualizar";
        $json[] = array('retorno' => $retorno);
        echo json_encode($json);
    }
}

function Eliminar() {
    global $bd;
    $datos = json_decode(file_get_contents("php://input"), true);
    $id_funcionario = $datos["id_funcionario"];
    $retorno = "";
    $json = array();

    $sql3 = "DELETE FROM `funcionarios` WHERE id_funcionario = ?;";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "i", $id_funcionario);

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

function cargarCargos() {
    global $bd;
    $sql = "SELECT * FROM `cargos`";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {


        $codigo = $fila[0];
        $descripcion = $fila[1];


        $json[] = array(
            'codigo' => $codigo,
            'descripcion' => $descripcion);
    }

    echo json_encode($json);
}

function cargarCiudad() {
    global $bd;
    $sql = "SELECT * FROM `ciudades`";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {


        $codigo = $fila[0];
        $descripcion = $fila[1];


        $json[] = array(
            'codigo' => $codigo,
            'descripcion' => $descripcion);
    }

    echo json_encode($json);
}
