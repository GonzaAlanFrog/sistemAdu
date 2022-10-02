<?php
session_start();
/**
 * Logiciel : exemple d'utilisation de HTML2PDF
 * 
 * Convertisseur HTML => PDF
 * Distribu� sous la licence LGPL. 
 *
 * @author		Laurent MINGUET <webmaster@html2pdf.fr>
 * 
 * isset($_GET['vuehtml']) n'est pas obligatoire
 * il permet juste d'afficher le r�sultat au format HTML
 * si le param�tre 'vuehtml' est pass� en param�tre _GET
 */

 	// r�cup�ration du contenu HTML
 	ob_start();
 	//include(dirname(__FILE__).'/res/exemple00.php');*/
/*	$imprimir="
<table   style='   font-family: arial; border-style:1px;'>
    <tr>
        <td colspan='2'  style='text-align: right; font-size: 14; background-color:green; font-family: arial; color: white;'>
            <b> DEPOSITO EN  <u>GUARANIES</u>  EFECTIVO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;     CORRESPONSALIA SUB RED PRONET S.A.<BR></b>
                                                                               USO EXCLUSIVO
        </td>
    </tr>
    <tr>
        <td colspan='2'>
            N&deg; de Boleta:80802
        </td>
    </tr>
    <tr>
        <td style='text-align: right;  width:400px; font-size:12;' ><b>Total Depositado</b> <br>
          <b>Gs.</b><input type='text' size='25'>
          </td>
          <td style='text-align: right; width:250px; font-size:12 '>
          <b>Fecha Deposito</b><input  type='text'  style='width:40px;'><input  type='text' style='width:40px;'><input  type='text' style='width:60px;'><br>
                               <input  type='text' value='dia' style='width:40px;'><input  type='text' value='mes' style='width:40px;'><input value='a&ntilde;o' type='text' style='width:60px;'>
          </td>
    </tr>
    <tr>
        <td rowspan=2 style=' line-height:150%; font-size:11' >
        Nombre y  Apellido del  Depositante:_______________________________________________<br>
        Ocupacion:_________________Direccion:________________________________________<br>
        C.I.N&deg;:_______________ Tel.:_______________ Nacionalidad________________________<br>
        N&deg; DE CUENTA:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' size='30'><br>
        NOMBRE DE LA CUENTA:<input type='text'  value='PRONET S.A.' size='30'><br><br>
        SON GUARANIES:______________________________________________________________<br><br>
     ____________________________________________________________________________
        </td>
            <td  style='width:140px;  font-size: 7; font-family: arial; text-align:justify; '>
                ESTE FORMULARIO TIENE CARACTER DE DECLARACION
JURADA,Y<br>  SEG&Uacutee;N LA RESOLUCION N° 2 ACTA 3 DEL 19
DE ENERO DE 2010<br> DEL DIRECTORIO DEL BANCO CENTRAL  DEL 
PARAGUAY DEBE SER<br> LLENADO POR LAS OPERACIONES
UNICAS,  FRACCIONADAS O MULTIPLES<br> REALIZADAS 
EN MONEDANACIONAL O EXTRANJERA QUE    ALCANCEN  O<br>
EXCEDAN LOS<b> USS.10.000</b> (DIEZ MIL DOLARES AMERICANOS)  O SU EQUIVALENTE EN OTRA MONEDA.<br>
SE DEJA CONSTANCIA QUE EL BANCO NO ASUMIR&Aacute; RESPONSABILIDAD ALGUNA ACERCA DE
LA AUTENTICIDAD DE LA INORMACION PROVISTA EN ESTE FORMULARIO
 
</td>
    </tr>
   <tr>
         
        <td style='font-size:7; text-align:center;'>______________________________<br>Firma del depositante.</td>
   </tr>
    <tr>
        <td colspan='2' style='  font-size: 8'>
            _______________________________________________________________________________________________________________________________________________________
            <br>No  Escribir  bajo esta linea<br>


              <fieldset style='text-align:center'>
                 <barcode type='C39' value='0847111000000080802' label='none' style='width: 70mm; height: 8mm'></barcode>
              <br>    0847111000000080802

</fieldset>
        </td>
    </tr>

</table>";
$imprimir2=" <table   style='   font-family: arial; border-style:1px;'>
    <tr>
        <td colspan='2'  style='text-align: right; font-size: 14; background-color:green; font-family: arial; color: white;'>
            <b> DEPOSITO EN  <u>GUARANIES</u>  EFECTIVO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;     CORRESPONSALIA SUB RED PRONET S.A.<BR></b>
                                                                               USO EXCLUSIVO
        </td>
    </tr>
    
    <tr>
        <td style='text-align: right;  width:400px; font-size:12;' >
           N&deg; de Boleta:5000802
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Total Depositado</b> <br>
          <b>Gs.</b><input type='text' size='25'>
          </td>
          <td style='text-align: right; width:250px; font-size:12 '>
          <b>Fecha Deposito</b><input  type='text'  style='width:40px;'><input  type='text' style='width:40px;'><input  type='text' style='width:60px;'><br>
                               <input  type='text' value='dia' style='width:40px;'><input  type='text' value='mes' style='width:40px;'><input value='a&ntilde;o' type='text' style='width:60px;'>
          </td>
    </tr>
    <tr>
        <td rowspan=2 style=' line-height:150%; font-size:11' >
         Nombre y  Apellido del  Depositante:_______________________________________________<br>
        Ocupacion:_________________Direccion:________________________________________<br>
        C.I.N&deg;:_______________ Tel.:_______________ Nacionalidad________________________<br>
        N&deg; DE CUENTA:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' size='30'><br>
        NOMBRE DE LA CUENTA:<input type='text'  value='PRONET S.A.' size='30'><br>
        <table border='1'  style=' font-size:8; border-style: dotted;border-width: 1px; border-collapse:collapse; '>
            <tr>
                <td>N&deg;</td>
                <td>BANCO</td>
                <td>N&deg; de CHEQUE</td>
                <td>IMPORTE</td>
            </tr>
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td style='width:170px; '>&nbsp;</td>
                <td  style='width:120px; '>&nbsp;</td>
                <td style='width:120px; '>&nbsp;</td></tr>
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td style='width:170px; '>&nbsp;</td>
                <td  style='width:120px; '>&nbsp;</td>
                <td style='width:120px; '>&nbsp;</td></tr>
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td style='width:170px; '>&nbsp;</td>
                <td  style='width:120px; '>&nbsp;</td>
                <td style='width:120px; '>&nbsp;</td></tr>
            <tr><td colspan='2' style=' font-size:7; border-style: none; '><i>(Todos los cheles  librados a la orden del Emisor)</i></td>
                <td style='border-style: none; '><b>TOTAL</b>  Deposito</td><td>&nbsp;</td></tr>
</table>
SON GUARANIES:______________________________________________________________<br> 
     ____________________________________________________________________________
        </td>
            <td  style='width:140px;  font-size: 7; font-family: arial; text-align:justify; '>
                ESTE FORMULARIO TIENE CARACTER DE DECLARACION
JURADA,Y<br>  SEG&Uacutee;N LA RESOLUCION N° 2 ACTA 3 DEL 19
DE ENERO DE 2010<br> DEL DIRECTORIO DEL BANCO CENTRAL  DEL
PARAGUAY DEBE SER<br> LLENADO POR LAS OPERACIONES
UNICAS,  FRACCIONADAS O MULTIPLES<br> REALIZADAS
EN MONEDANACIONAL O EXTRANJERA QUE    ALCANCEN  O<br>
EXCEDAN LOS<b> USS.10.000</b> (DIEZ MIL DOLARES AMERICANOS)  O SU EQUIVALENTE EN OTRA MONEDA.<br>
SE DEJA CONSTANCIA QUE EL BANCO NO ASUMIR&Aacute; RESPONSABILIDAD ALGUNA ACERCA DE
LA AUTENTICIDAD DE LA INORMACION PROVISTA EN ESTE FORMULARIO

</td>
    </tr>
   <tr>

        <td style='font-size:7; text-align:center;'>______________________________<br>Firma del depositante.</td>
   </tr>
    <tr>
        <td colspan='2' style='  font-size: 8'>
            _______________________________________________________________________________________________________________________________________________________
            <br>No  Escribir  bajo esta linea<br>


              <fieldset style='text-align:center'>
                 <barcode type='C39' value='0847111000000080802' label='none' style='width: 70mm; height: 8mm'></barcode>
              <br>    0847111000000080802

</fieldset>
        </td>
    </tr>

</table>";*/
        $imprimir=$_SESSION['boleta'];
        echo $imprimir.'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                         <br> ';
         echo $imprimir.'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                          ';
          echo $imprimir.' ';
/*
 echo $imprimir2.'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                        <br> <br>';
         echo $imprimir2.'- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                        <br> <br>';
          echo $imprimir2.'<br><br>';
*/
          $content = ob_get_clean();
	
	// conversion HTML => PDF
	require_once(dirname(__FILE__).'/../html2pdf.class.php');
	try
	{
		$html2pdf = new HTML2PDF('P','A4','es', false, 'ISO-8859-15');
 		 
                 $html2pdf->setTestTdInOnePage(false);
                 $html2pdf->pdf->SetDisplayMode('real');
		$html2pdf->pdf->SetDisplayMode('fullpage');
		$html2pdf->setDefaultFont('Arial');
             //   $html2pdf->pdf->IncludeJS("app.alert('Atencion:Esta boleta  es Valida solo para la fecha de cierre ingresada. ');");
                $html2pdf->pdf->IncludeJS("print(true);");
		 $html2pdf->writeHTML($content, isset($_GET['vuehtml']));
		$html2pdf->Output('boletaDeposito'.$_SESSION['nroBoleta'].'.pdf', false);
	}
	catch(HTML2PDF_exception $e) { echo $e; } 

