
<?php
require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
$bd = Db::getInstance();
 $sql = "SELECT `id_perfil`, `per_descripcion` FROM `perfiles`";

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
?>
