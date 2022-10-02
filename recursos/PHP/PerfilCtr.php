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
   // $sql = "SELECT `id_perfil`, `per_descripcion` FROM `perfiles`";
    $sql = "SELECT `cod_perfil_usu`, `descrip_perfil` FROM `perfil_usuario`";
    
    $log= new Log();

   $log->insert('SQL per:'.$sql);

    $stmt = $bd->ejecutar($sql);
    

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    

    while ($fila = $bd->obtener_fila($stmt, 0)) {
        

        $id_perfil = $fila[0];
        $per_descripcion = $fila[1];


        $json[] = array(
            'id_perfil' => $id_perfil,
            'per_descripcion' => $per_descripcion
      
        );
    }

    echo json_encode($json);
}

function agregar() {
    $datos = json_decode(file_get_contents("php://input"), true);
    global $bd;
    //$id_perfil = $datos["id_perfil"];
    $per_descripcion = $datos["per_descripcion"];
  
  
 
       $sql = "INSERT INTO `perfil_usuario`(`descrip_perfil`) VALUES  (?)";

    //$sql = "INSERT INTO `clientes`(`cli_ruc`, `cli_razonsocial`, `cli_telefono`, `cli_direccion`, `cli_email`, `id_ciudad`) VALUES  (?,?,?,?,?,?)";

    $stmt3 = $bd->ejecutarPrepared($sql);
    //var_dump($stmt3);

    mysqli_stmt_bind_param($stmt3,"s",$per_descripcion);

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
    $id_perfil = $datos["id_perfil"];
    $per_descripcion = $datos["per_descripcion"];


    $retorno = "";
    $json = array();
        
    $sql3 = "UPDATE `perfil_usuario` SET `descrip_perfil`=? WHERE `cod_perfil_usu`=?";
    //$sql3 = "UPDATE `usuarios` SET  `usu_nombre`=?,`usu_clave`=?,`id_funcionario`=?,`id_perfil`=? WHERE `id_usuario`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "ss", $per_descripcion, $id_perfil);

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
    $id_perfil = $datos["id_perfil"];
    $retorno = "";
    $json = array();

    $sql3 = "DELETE FROM `perfil_usuario` WHERE `cod_perfil_usu`=?";

    $stmt3 = $bd->ejecutarPrepared($sql3);

    mysqli_stmt_bind_param($stmt3, "s", $id_perfil);
    
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

