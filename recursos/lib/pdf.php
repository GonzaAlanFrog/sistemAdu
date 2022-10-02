
 <page backtop="18mm" backbottom="12mm" backleft="1mm" backright="15mm"> 
      <page_header> 
		<table style="width: 100%; font-size:12px;">
			<tr>
				<td style="text-align: left; width: 85%"><b>Reporte</b></td>	
			</tr>
		</table>                 
      </page_header> 
      <page_footer> 
		<table style="width: 100%;">
			<tr>
				<td style="text-align: left;	width: 33%">&nbsp;</td>
				<td style="text-align: center;	width: 34%">Fin del Reporte</td>
				<td style="text-align: right;	width: 33%">&nbsp;</td>
			</tr>
		</table>                     
      </page_footer>          
     <table border="1"   style="width: 100%; border: solid 1px black; font-size:30px; text-align:center;">      
        <?php
	require '../PHP/Session.class.php';
        $data = Session::getInstance();
        echo $data->idReportecaja;
        ?>
	</table>
 </page> 

<?php
	$content = ob_get_clean();
        //var_dump($content);
	$nombre = "ReporteCaja.pdf";	
	// conversion HTML => PDF
	require_once('html2pdf/html2pdf.class.php');
	$html2pdf = new HTML2PDF('L', 'legal', 'fr', false, 'ISO-8859-15');
	$html2pdf->pdf->SetDisplayMode('real');
	$html2pdf->writeHTML($content,false);
	$html2pdf->Output($nombre, 'D');
?>