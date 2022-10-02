<?php

session_start();
ob_start();
$hoja = $_GET['hoja'];
echo $_SESSION['chequera'];

$content = ob_get_clean();

// conversion HTML => PDF
require_once(dirname(__FILE__) . '/../html2pdf.class.php');
 
try { 
    $html2pdf = new HTML2PDF('P', $hoja, 'es', false, 'C93');
    $html2pdf->setTestTdInOnePage(false);
    $html2pdf->pdf->SetDisplayMode('real');
    $html2pdf->pdf->SetDisplayMode('fullpage');
     $html2pdf->setDefaultFont('Arial');
    //   $html2pdf->pdf->IncludeJS("app.alert('Atencion:Esta boleta  es Valida solo para la fecha de cierre ingresada. ');");
    $html2pdf->pdf->IncludeJS("print(true);");
    $html2pdf->writeHTML($content, isset($_GET['vuehtml']));
    $html2pdf->Output($_SESSION['nombreArchivo'], false);
} catch (HTML2PDF_exception $e) {
    echo $e;
} 

