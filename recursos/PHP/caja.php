<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
require 'Session.class.php';
require_once('../lib/html2pdf/html2pdf.class.php');

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
            cargartabla();
            break;
           break;
        case 2;
            get_funcionario();

            break;
        case 3;
            getFecha();

            break;
        case 4;
            creadorpdf();

            break;
        case 5;
            getcaja();

            break;
        case 6;
            monto();

            break;

    }
}

function cargartabla() {
    creadorpdf();
    global $bd;
    $sql = "SELECT
    ROUND(SUM(d.subtotal),0) AS Monto,v.nro_factura
    FROM
        detalle_ventas d
    INNER JOIN ventas v on v.nro_factura=d.id_venta
    WHERE v.ven_fecha=CURRENT_DATE
    GROUP BY v.nro_factura
    ";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        $nro_factura = $fila[1];
        $Monto = $fila[0];


        $json[] = array(
            'nro_factura' => $nro_factura,
            'Monto' => $Monto
      
        );
    }

    echo json_encode($json);
}

function get_funcionario() {
 global $bd; 
  $data = Session::getInstance();
  $id=$data->idfuncionario;
   $sql = "SELECT fun_nombres, fun_apellidos from funcionarios WHERE id_funcionario=$id";
    //echo $sql;
    $stmt = $bd->ejecutar($sql);
    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    if ($fila = $bd->obtener_fila($stmt, 0)) {
        $va = $fila[0]." ".$fila[1];


        $json[] = array('va' => $va);
    }

    echo json_encode($json);  
}

function getFecha() {
 global $bd; 
  global $bd;
    $sql = "SELECT CURRENT_DATE";
    
    $stmt = $bd->ejecutar($sql);
    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    if ($fila = $bd->obtener_fila($stmt, 0)) {
        $va = $fila[0];


        $json[] = array('va' => $va);
    }

    echo json_encode($json);  
}



function getcaja() {
 global $bd; 
   $data = Session::getInstance();
   $id=$data->idfcaja;
   
  $sql = "SELECT  `descrip_caja` FROM `caja` WHERE `cod_caja`=$id";
    
    $stmt = $bd->ejecutar($sql);
    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    if ($fila = $bd->obtener_fila($stmt, 0)) {
        $va = $fila[0];
        $json[] = array('va' => $va);
    }

    echo json_encode($json);  
}
function monto() {
 global $bd; 
   $data = Session::getInstance();
   $idapertura =  $data->idapertura;
   
  $sql = "select round( sum( v.subtotal ),0) as t 
from detalle_ventas v
inner JOIN ventas f on f.id_apercierre =$idapertura";
    
    $stmt = $bd->ejecutar($sql);
    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    if ($fila = $bd->obtener_fila($stmt, 0)) {
        $va = $fila[0];
        
    }
        if($va !=NULL){
            $json[] = array('va' => $va);
           echo json_encode($json);    
        } else {
            $va = "0";
            $json[] = array('va' => $va);
           echo json_encode($json);    
        }
   // echo json_encode($json);  
}

function creadorpdf() {
    $data = Session::getInstance();
    global $bd;
    $tabla="";
    $sql = "SELECT
    ROUND(SUM(d.subtotal),0) AS Monto,v.nro_factura
    FROM
        detalle_ventas d
    INNER JOIN ventas v on v.nro_factura=d.id_venta
    WHERE v.ven_fecha=CURRENT_DATE
    GROUP BY v.nro_factura
    ";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    $tabla .="<thead >
            <tr>
            <td>Numero Factura</td>   
            <td >Monto</td>   
            </tr>
            </thead>";
    $tabla .="<tbody> \n";
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        $nro_factura = $fila[1];
        $Monto = $fila[0];
        $tabla .="<tr>\n";
        $tabla .="<td>$nro_factura</td>\n";
        $tabla .="<td>$Monto</td>\n";
        $tabla .="</tr>\n";
        
    }
    $tabla .="</tbody>\n";

   $data->idReportecaja= $tabla;
        
  //echo $data->idReportecaja;
}