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
            cargarPerfiles();

            break;
        case 6;
            cargarFuncionarios();

            break;
    }
}

function cargarPerfiles() {
    global $bd;
    $sql = "SELECT * FROM `perfiles`";

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

function cargartabla() {
    global $bd;
    $sql = "SELECT u.id_usuario, u.usu_nombre, u.usu_clave, u.id_funcionario, u.id_perfil ,"
            . "f.fun_nombres,p.per_descripcion "
            . "FROM `usuarios` u "
            . "INNER JOIN funcionarios f on f.id_funcionario=u.id_funcionario "
            . "INNER JOIN perfiles p on p.id_perfil = u.id_perfil ";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        $id_usuario = $fila[0];
        $usu_nombre = $fila[1];
        $usu_clave = $fila[2];
        $id_funcionario = $fila[3];
        $id_perfil = $fila[4];
        $fun_nombres = $fila[5];
        $per_descripcion = $fila[6];

        //$cuidades = $fila[7];

        $json[] = array(
            'id_usuario' => $id_usuario,
            'usu_nombre' => $usu_nombre,
            'usu_clave' => $usu_clave,
            'id_funcionario' => $id_funcionario,
            'id_perfil' => $id_perfil,
            'fun_nombres' => $fun_nombres,
            'per_descripcion' => $per_descripcion
            
        );
    }

    echo json_encode($json);
}

function agregar() {
    $datos = json_decode(file_get_contents("php://input"), true);
    global $bd;
    $id_usuario = $datos["id_usuario"];
    $usu_nombre = $datos["usu_nombre"];
    $usu_clave = $datos["usu_clave"];
    $id_funcionario = $datos["id_funcionario"];
    $id_perfil = $datos["id_perfil"];


    //var_dump($datos);

    $sql = "INSERT INTO `usuarios`(`usu_nombre`, `usu_clave`, `id_funcionario`, `id_perfil`) VALUES  (?,?,?,?)";
    //$sql = "INSERT INTO `clientes`(`cli_ruc`, `cli_razonsocial`, `cli_telefono`, `cli_direccion`, `cli_email`, `id_ciudad`) VALUES  (?,?,?,?,?,?)";

    $stmt3 = $bd->ejecutarPrepared($sql);
    //var_dump($stmt3);

    mysqli_stmt_bind_param($stmt3, "ssss", $usu_nombre, $usu_clave, $id_funcionario, $id_perfil);

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
    $id_usuario = $datos["id_usuario"];
    $usu_nombre = $datos["usu_nombre"];
    $usu_clave = $datos["usu_clave"];
    $id_funcionario = $datos["id_funcionario"];
    $id_perfil = $datos["id_perfil"];

    $retorno = "";
    $json = array();

    $sql3 = "UPDATE `usuarios` SET  `usu_nombre`=?,`usu_clave`=?,`id_funcionario`=?,`id_perfil`=? WHERE `id_usuario`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "ssssi", $usu_nombre, $usu_clave, $id_funcionario, $id_perfil, $id_usuario);

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
    $id_usuario = $datos["id_usuario"];
    $retorno = "";
    $json = array();

    $sql3 = "DELETE FROM `ususarios` WHERE `id_usuario`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "i", $id_usuario);

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

function cargarFuncionarios() {
    global $bd;
    $sql = "SELECT `id_funcionario`,`fun_nombres` FROM `funcionarios`";

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