<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<?php
               
                require '../../data_lab/Db.class.php';
                require '../../data_lab/Conf.class.php';
                
                $bd = Db::getInstance();
                
               /// $Bandera =$_GET["Bandera"];
                
              

        
                
function  crearFactura(){
      global $bd;
      $id = $_GET["id"];
    $datos = json_decode(file_get_contents('php://input'), true);
   // $id_transaccion = $datos['id_transaccion'];
    $sql = "SELECT d.id_mercaderia,m.mer_descripcion, d.dv_cantidad, d.dv_precio, d.subtotal
    FROM detalle_ventas d
    inner join mercaderias m on m.id_mercaderia=d.id_mercaderia
    WHERE d.id_venta='$id'";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $row = "";
    while ($fila = $bd->obtener_fila($stmt, 0)) {
        
        $row .="<tr bordercolor='#000000' bgcolor='#FFFFFF'>";
        $row .="<td align='center'>".$fila[2].'</td>';
        $row .="<td colspan='2' align='center' >".$fila[1]."</td>";
        //$row .="<td >&nbsp;</td>";
        $row .="<td align='center'>$fila[3]</td>";
        $row .="<td >&nbsp;</td>";
        $row .="<td bordercolor='#000000' bgcolor='#FFFFFF'>&nbsp;</td>";
        $row .="<td align='center' bordercolor='#000000' bgcolor='#FFFFFF'>&nbsp;</td>";
        $row .="<td align='center' bordercolor='#000000' bgcolor='#FFFFFF'>&nbsp;</td>";
        $row .='<tr>';
    }

     return $row;  
    }
 
function CargarSumaTotal(){
    global $bd;
    $id = $_GET["id"];
    $datos = json_decode(file_get_contents("php://input"), true);
    $id_transaccion = $datos["id_transaccion"];
    $sql = "select round( sum( subtotal ),0) as t from detalle_ventas where id_venta='$id'";
    $stmt = $bd->ejecutar($sql);
    /* Realizamos un bucle para ir obteniendo los resultados */
    $id_mercaderia = "";
    if($fila = $bd->obtener_fila($stmt, 0)) {
      $id_mercaderia = $fila[0];  
    
    }
    return $id_mercaderia;
   // echo json_encode($json);

   /// echo json_encode($json);
} 

function  cargarfecha() {
    
     global $bd;
    $sql = "select CURRENT_DATE";

    $stmt = $bd->ejecutar($sql);
    $fecha="";
    if($fila = $bd->obtener_fila($stmt, 0)) {
        $fecha = $fila[0];
        
    }
  
    return $fecha;
}
 
$row= crearFactura();
         $total= CargarSumaTotal();
         $fecha = cargarfecha();
           

 echo "
<html>
    <head>
        <title>Factura</title>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    </head>
    <body>
        <body  style='background-color:#FFFFFF; font-size:11px; font-family:Arial, Helvetica, sans-serif;'>
<table width='1050' height='130' border='0' align='center' cellspacing='0' background='images/top_1050.png'>
  <tr>
    <td width='98%'>&nbsp;</td>
  </tr>
</table>
 
<table width='1050' border='0' align='center' cellpadding='0' cellspacing='0' background='images/center_1050.png'>
  <tr>
    <td width='98%'><table width='96%' border='0' align='center'>
     
      <tr>
        <td bgcolor='#FFFFFF'>
    
             <table width='100%' height='72' border='1' align='center' cellpadding='0' cellspacing='0'>
              
              <tr>
                <td width='48%' height='23' align='left' bordercolor='#000000' bgcolor='#FFFFFF'><strong>&nbsp;&nbsp;&nbsp;FECHA DE EMISION:&nbsp;&nbsp;&nbsp;<input type='text' name='fecha_emision' value='$fecha' disabled='disbaled'/> </strong></td>
                <td colspan='4' align='left' bordercolor='#000000' bgcolor='#FFFFFF'>&nbsp;&nbsp;&nbsp;<strong>CONDICION DE VENTA:</strong><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input value ='Contado' disabled='disbaled'></strong></td>
               </tr>
              <tr>
                <td height='22' colspan='5' align='left' bordercolor='#000000' bgcolor='#FFFFFF'><strong>&nbsp;&nbsp;&nbsp;RUC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type='text' disabled='disbaled' name='ruc' value='4538217' /> </strong></td>
               </tr>
              <tr>
                <td height='22' colspan='2' align='left' bordercolor='#000000' bgcolor='#FFFFFF'><strong>&nbsp;&nbsp;&nbsp;NOM. O RAZON SOCIAL:</strong></strong>&nbsp;&nbsp;&nbsp;<input  disabled='disbaled' type='text' name='nom_razon_social' value='Diana Jara' /> </td>
                <!--<td width='52%' colspan='3' align='LEFT' bordercolor='#000000' bgcolor='#FFFFFF'><strong>&nbsp;&nbsp;&nbsp;NOTA DE REMISI&Oacute;N N&deg; &nbsp;&nbsp;&nbsp;<input type='text' name='nota_remision' /></strong></td>-->
               </tr>
                
            </table>
                
             <table width='100%' border='1' align='center' cellpadding='0' cellspacing='0'>
                <tr>
                 <td width='116' height='19' align='center' bordercolor='#000000' bgcolor='#E6E6E6'></td>
                 <td colspan='2' align='center' bordercolor='#000000' bgcolor='#E6E6E6'></strong></td>
                 <td width='119' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>PRECIO</strong></td>
                 <td colspan='3' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>VALOR DE VENTA</strong></td>
                </tr>
               <tr>
                 <td width='116' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>CANTIDAD</strong></td>
                 <td colspan='2' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>DESCRIPCION</strong></td>
                 <td width='119' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>UNITARIO</strong></td>
                 <td width='120' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>EXENTAS</strong></td>
                 <td width='105' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>5%</strong></td>
                 <td width='106' align='center' bordercolor='#000000' bgcolor='#E6E6E6'><strong>10%</strong></td>
               </tr>
               
                " .$row. "
              
               
             
                <tr>
                  <td height='19' bordercolor='#000000' bgcolor='#FFFFFF'><span class='Estilo1'>LIQUIDACION DEL IVA:</span> </td>
                  <td align='right' width='65' bordercolor='#000000' bgcolor='#FFFFFF'>5%</td>
                  <td width='372' bordercolor='#000000' bgcolor='#FFFFFF'>&nbsp;</td>
                  <td align='right' bordercolor='#000000' bgcolor='#FFFFFF'>10%</td>
                  <td bordercolor='#000000' bgcolor='#FFFFFF'>&nbsp;</td>
                  <td align='center' bordercolor='#000000' bgcolor='#FFFFFF'><strong>TOTAL</strong></td>
                  <td bordercolor='#000000' bgcolor='#FFFFFF'>".$total."</td>
               </tr>
               <tr>
                 <td colspan='7' bordercolor='#FFFFFF'><p>&nbsp;</p></td>
               </tr>
               <tr>
                 <td bordercolor='#009900' colspan='7' bgcolor='#FFFFFF'><div align='center'>

</body>";   


?>