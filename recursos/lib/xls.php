<?php

session_start();
/* $datosImprimir = $_SESSION['datosImprimir'];
  $aux = '<a href="ticket/impresion.php" target="_blank"><img src="img/imprimir.jpg" border="0"></a>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="ticket/xls.php" target="_blank">      <img src="img/excel.jpg" border="0"></a>';
  = str_replace($aux, ' ', $datosImprimir);
  $nombre = str_replace(' ', '_', $_SESSION['repName']);
  $nombre = $nombre.'_'.date('d-m-Y');

  header('Content-type: application/vnd.ms-excel');
  header("Content-Disposition: attachment; filename=".$nombre.".xls");
  header("Pragma: no-cache");
  header("Expires: 0");

  echo "<h1 align='center'>PRONET S.A. - Aqui Pago</h1>
  <div align='center'>".$datosImprimir."</div>
  <br/>Generado por: ".$_SESSION['usuario']." a las ".date("H:i:s")."
  ";
 */

$datosImprimir = $_SESSION['datosImprimir'];
$aux = '<a href="ticket/impresion.php" target="_blank"><img src="img/imprimir.jpg" border="0"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="ticket/xls.php" target="_blank">      <img src="img/excel.jpg" border="0"></a>';
$datosImprimir = str_replace($aux, ' ', $datosImprimir);

$cabecera = explode('|', $_SESSION['repName']);

if ($cabecera[1] == 1) {
    $nombre = str_replace(' ', '_', $cabecera[0]);
    $datos = "";
} else {
    $nombre = str_replace(' ', '_', $_SESSION['repName']);
    $nombre = $nombre . '_' . date('d-m-Y');
    $datos = "<br/>Generado por: " . $_SESSION['usuario'] . " el " . date("d/m/Y") . " a las " . date("H:i:s") . "
	 <br/>Datos Confidenciales, propiedad de proNET S.A.<br/>
         La divulgacion Total o Parcial es responsabilidad del ";
}
$nombre = str_ireplace('-', '_', $nombre);
$nombre = str_ireplace('/', '', $nombre);
header('Content-type: application/vnd.ms-excel');
header("Content-Disposition: attachment; filename=" . $nombre . ".xls");
header("Pragma: cache");
header("Expires: 0");
echo "<h1 align='center'>PRONET S.A. - Aqui Pago</h1>
	  <div align='center'>" . $datosImprimir . "</div>".$datos;
?>