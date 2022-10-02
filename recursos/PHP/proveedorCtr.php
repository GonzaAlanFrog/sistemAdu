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
            cargarSelectCiudad();

            break;
    }
}

function cargarSelectCiudad() {
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

function cargartabla() {
    global $bd;
    $sql = "SELECT p.`id_proveedor`, p.`telefono`, p.`direccion`, p.`email`, p.`ruc`, p.`razon_social`, p.`id_ciudad`,c.ciu_descripcion
FROM `proveedor` p 
INNER JOIN ciudades c on c.id_ciudad =  p.id_ciudad";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        $codigo = $fila[0];
        $ruc = $fila[4];
        $razonSocial = $fila[5];
        $telefono = $fila[1];
        $direccion = $fila[2];
        $email = $fila[3];
        $cuidades_id_cuidad = $fila[6];
        $cuidades = $fila[7];
//var_dump($fila[3]);


        $json[] = array(
            'codigo' => $codigo,
            'ruc' => $ruc,
            'razonSocial' => $razonSocial,
            'telefono' => $telefono,
            'direccion' => $direccion,
            'email' => $email,
            'cuidades_id_cuidad' => $cuidades_id_cuidad,
            'ciudades' => $cuidades
        );
    }

    echo json_encode($json);
}

function agregar() {
    $datos = json_decode(file_get_contents("php://input"), true);
     global $bd;
    $ruc = $datos["ruc"];
    $razonSocial = $datos["razonSocial"];
    $telefono = $datos["telefono"];
    $direccion = $datos["direccion"];
    $email = $datos["email"];
    $ciudades = $datos["ciudades"];

    //var_dump($datos);
   
    $sql = "INSERT INTO `proveedor`( `telefono`, `direccion`, `email`, `ruc`, `razon_social`, `id_ciudad`) VALUES  (?,?,?,?,?,?)";

    $stmt3 = $bd->ejecutarPrepared($sql);
    //var_dump($stmt3);
    
    mysqli_stmt_bind_param($stmt3, "ssssss", $telefono, $direccion, $email, $ruc, $razonSocial, $ciudades);

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
    $id_cliente = $datos["id_cliente"];
    $ruc = $datos["ruc"];
    $razonSocial = $datos["razonSocial"];
    $telefono = $datos["telefono"];
    $direccion = $datos["direccion"];
    $email = $datos["email"];
    $ciudades = $datos["ciudades"];

    $retorno = "";
    $json = array();

    $sql3 = "UPDATE `proveedor` SET `telefono`=?,`direccion`=?,`email`=?,`ruc`=?,`razon_social`=?,`id_ciudad`=? WHERE `id_proveedor`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "sssssss", $telefono, $direccion, $email, $ruc, $razonSocial, $ciudades,$id_cliente);

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
    $id_cliente = $datos["id_cliente"];
    $retorno = "";
    $json = array();

    $sql3 = "DELETE FROM `proveedor` WHERE `id_proveedor`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "i", $id_cliente);

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
