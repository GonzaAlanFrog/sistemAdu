<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//out.print("<label>Fecha:"+genericos.Genericos.FechaServidor()+"</label>");



require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
require 'Session.class.php';


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
            cargarfecha();
            break;
        case 2;
            cargarclientes();

            break;
        case 3;
            cargarproductos();

            break;
        case 4;
         crearfactura();

            break;
        case 5;
            inserdetalle();

            break;
        case 6;
            cargarDetalle();

            break;
        case 7;
            CargarSumaTotal();

            break;
        case 8;
            botonerror();

            break;
    }
}

function  cargarfecha() {
    
     global $bd;
    $sql = "select CURRENT_DATE";

    $stmt = $bd->ejecutar($sql);
    
    if($fila = $bd->obtener_fila($stmt, 0)) {
        $fecha = $fila[0];
        echo '<label>Fecha:'.$fecha.'</label>';
    }
  
    
}

function cargarclientes() {
    
    global $bd;
    $sql = "SELECT `id_cliente`, `cli_ruc`, `cli_razonsocial`, `cli_telefono`,  `cli_email` FROM `clientes`";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        $id_cliente = $fila[0];
        $cli_ruc = $fila[1];
        $cli_razonsocial = $fila[2];
        $cli_telefono = $fila[3];
        $cli_email = $fila[4];
        

        $json[] = array(
            'id_cliente' => $id_cliente,
            'cli_ruc' => $cli_ruc,
            'cli_razonsocial' => $cli_razonsocial,
            'cli_telefono' => $cli_telefono,
            'cli_email' => $cli_email
      
        );
    }

    echo json_encode($json);
}

function  cargarproductos(){
     global $bd;
    $sql = "SELECT m.id_mercaderia, m.mer_descripcion, m.mer_precio, s.stk_cantidad FROM `mercaderias` m INNER JOIN stock s on s.id_mercaderia = m.id_mercaderia ";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        $id_mercaderia = $fila[0];
        $mer_descripcion = $fila[1];
        $mer_precio = $fila[2];
        $stk_cantidad = $fila[3];
   
        

        $json[] = array(
            'id_mercaderia' => $id_mercaderia,
            'mer_descripcion' => $mer_descripcion,
            'mer_precio' => $mer_precio,
            'stk_cantidad' => $stk_cantidad
        );
    }

    echo json_encode($json);
}


function crearfactura() {
    $data = Session::getInstance();
    global $bd;
    $id_caja=$data->idfcaja;
    $nro_parametro=returnNroParamatro();//PARA RETORNAR EL MISMO ID BAtO    
    $nro_ultimo=returnNro();
    
    //echo 'id_caja:'.$id_caja;
    //echo 'Parametro:'.$nro_parametro;
    //echo 'Factura:'.$nro_ultimo;
    $inicio='12000';
    $fin='12100';
    $sql = "INSERT INTO parametro(id_parametro,ultimo_numero,numero_fin,numero_inicio,id_caja) VALUES (?,?,?,?,?)";
        
    $stmt3 = $bd->ejecutarPrepared($sql);

    mysqli_stmt_bind_param($stmt3,"sssss",$nro_parametro,$nro_ultimo,$fin,$inicio,$id_caja);

    mysqli_stmt_execute($stmt3);
    //mysqli_close($stmt3);
    $filas = $bd->filas();

    if ($filas > 0) {//si todo es bien insertamos la factura
       // echo 'parametro insertado .....';
    $datos = json_decode(file_get_contents("php://input"), true);
    $id_cliente = $datos["id_cliente"];
    $id_funcionario=$data->idfuncionario; 
    $id_apertura=$data->idapertura; 
    $sql = "INSERT INTO `ventas`(`ven_fecha`,`id_venta`, `id_cliente`, `id_funcionario`, `id_apercierre`,`id_parametro`) VALUES (CURRENT_DATE,?,?,?,?,?)";

    $stmt3 = $bd->ejecutarPrepared($sql);

    mysqli_stmt_bind_param($stmt3, "sssss",$nro_ultimo,$id_cliente,$id_funcionario,$id_apertura,$nro_parametro);

    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
       echo 'Nro.Transaccion:'.$nro_ultimo.'';
    } else {
       echo 'No se Creo en Tabla Venta';   
       printf("Error: %s.\n", mysqli_stmt_error($stmt3)); 
       echo '<label>Nro.Transaccion:ERROR</label>';
    } 
    } else {//murio en parametros inserttss
    
        echo 'No se Creo en Tabla Parametros';     
        printf("Error: %s.\n", mysqli_stmt_error($stmt3));
        
    }
    
    
}

function returnNro(){
    global $bd;
    $data = Session::getInstance();
    $datos = json_decode(file_get_contents("php://input"), true);
    $id_caja=$data->idfcaja;
    $sql ="select coalesce(max(ultimo_numero),0) +  1 as id from parametro where id_caja=$id_caja";
    $stmt = $bd->ejecutar($sql);
        if ($fila = $bd->obtener_fila($stmt, 0)) {
                $re=$fila[0];
            }  
    return $re;
}

function returnNroParamatro(){
    global $bd;
    $sql ="select coalesce(max(id_parametro),0) +  1 as id from parametro";
    $stmt = $bd->ejecutar($sql);
        if ($fila = $bd->obtener_fila($stmt, 0)) {
                $re=$fila[0];
            }  
            return $re;
}

function inserdetalle(){
    $datos = json_decode(file_get_contents("php://input"), true);
    global $bd;
    $cod_producto = $datos["id_producto"];
    $cantidad_producto = $datos["cantidad"];
    $precio_producto = $datos["precio"];
    $id_transaccion = $datos["id_transaccion"];
    
    ///var_dump($total);
    if(empty($cantidad_producto)){
     $retorno = "Por Favor Ingrese una cantidad Valida..";
     $json[] = array('retorno' => $retorno);
     echo json_encode($json);   
     return;
    }
    $total=$precio_producto*$cantidad_producto;
    
    $sql = "INSERT INTO `detalle_ventas`(
    `id_venta`,
    `id_mercaderia`,
    `dv_cantidad`,
    `dv_precio`,subtotal)
     VALUES(?,?,?,?,?)";

    $stmt3 = $bd->ejecutarPrepared($sql);

    mysqli_stmt_bind_param($stmt3, "sssss",$id_transaccion,$cod_producto,$cantidad_producto,$precio_producto,$total);

    mysqli_stmt_execute($stmt3);

    $filas = $bd->filas();

    if ($filas > 0) {
        $retorno = "exito";
        $json[] = array('retorno' => $retorno);
    } else {
        printf("Error: %s.\n", mysqli_stmt_error($stmt3));
        var_dump(mysqli_stmt_error($stmt3));
        $retorno = "Error al insertar Detalle.";
        $json[] = array('retorno' => $retorno);
    }
    echo json_encode($json);
    
    mysqli_stmt_close($stmt3);
}

function cargarDetalle() {
    global $bd;
    $datos = json_decode(file_get_contents("php://input"), true);
    $id_transaccion = $datos["id_transaccion"];
    $sql = "SELECT d.id_mercaderia,m.mer_descripcion, d.dv_cantidad, d.dv_precio, d.subtotal
    FROM detalle_ventas d
    inner join mercaderias m on m.id_mercaderia=d.id_mercaderia
    WHERE d.id_venta='$id_transaccion'";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        $id_mercaderia = $fila[0];
        $mer_descripcion = $fila[1];
        $dv_cantidad = $fila[2];
        $dv_precio = $fila[3];
        $subtotal = $fila[4];


        $json[] = array(
            'id_mercaderia' => $id_mercaderia,
            'mer_descripcion' => $mer_descripcion,
            'dv_cantidad' => $dv_cantidad,
            'dv_precio' => $dv_precio,
            'subtotal' => $subtotal
      
        );
    }

    echo json_encode($json);
}

function CargarSumaTotal(){
    global $bd;
    $datos = json_decode(file_get_contents("php://input"), true);
    $id_transaccion = $datos["id_transaccion"];
    $sql = "select round( sum( subtotal ),0) as t from detalle_ventas where id_venta='$id_transaccion'";
    $stmt = $bd->ejecutar($sql);
    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    if($fila = $bd->obtener_fila($stmt, 0)) {
      $id_mercaderia = $fila[0];  
    $json[] = array('suma' => $id_mercaderia);
    }

    echo json_encode($json);

   /// echo json_encode($json);
}

function imprimir(){
$html="";


    
    
}

function botonerror() {
  // document.getElementById('botonerror').all ='red';     
}
