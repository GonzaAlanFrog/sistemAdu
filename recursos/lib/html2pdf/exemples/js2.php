<?php
/**
 * Logiciel : exemple d'utilisation de HTML2PDF
 * 
 * Convertisseur HTML => PDF
 * Distribu� sous la licence LGPL. 
 *
 * @author		Laurent MINGUET <webmaster@html2pdf.fr>
 * 
 * IncludeJS : permet d'inclure du Javascript au format PDF
 * 
 * isset($_GET['vuehtml']) n'est pas obligatoire
 * il permet juste d'afficher le r�sultat au format HTML
 * si le param�tre 'vuehtml' est pass� en param�tre _GET
 */
 	ob_start();
?>
<page>
	<h1>Test de JavaScript 2</h1><br>
	<br>
	Normalement une alerte devrait apparaitre, indiquant "coucou"
</page>
<?php
	$content = ob_get_clean();
	$fecha='20/11/2011';
	require_once(dirname(__FILE__).'/../html2pdf.class.php');
	try
	{
		$html2pdf = new HTML2PDF('P','A4','fr', false, 'ISO-8859-15');
		$html2pdf->pdf->IncludeJS("app.alert('Esta boleta  es Valida solo para la fechade cierre:.".$fecha."');");
                $html2pdf->pdf->IncludeJS("print(true);");
		$html2pdf->writeHTML($content, isset($_GET['vuehtml']));
		$html2pdf->Output('js2.pdf');
	}
	catch(HTML2PDF_exception $e) { echo $e; }