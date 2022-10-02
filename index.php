<!DOCTYPEhtml>
<!--
To changethis license header, choose License Headers in Project Properties.
To changethis template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <title>Acceda a ControlAdu</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="recursos/css/w3.css"/>
        <script type="text/javascript" src="recursos/js/JsIndex.js"></script>  
        <script type="text/javascript" src="recursos/js/JsAcceso.js"></script> 
    </head>
    <body >
    
<div class="w3-blue ">
    
  <div class="w3-container ">
    <h2>ControlAdu</h2>
   </div>
 
    <table  cellspacing="3" cellpadding="1" class="w3-blue w3-display-topright" style="margin-right:50px; margin-top:12px;">
         <tbody id="tabladatos">
         <tr>
         <th><input type='text' id='usuario' size='15' placeholder='user' class='w3-input w3-border w3-round-large'/> </th>
         <th><input type='password' id='clave' size='15' placeholder='password' class='w3-input w3-border w3-round-large'/></th>
         <th><input type='button' onclick='Validator();' value='Ingresar' class='w3-button w3-round-large w3-green'/></th>
         </tr>
         </tbody>
    </table>
    </div>
        
    
        <div id="resultado" class="w3-display-topmiddle"></div>
        
        
        
        
        
        <div style="width: 100%">
        <div class="w3-container">
        <div class="w3-bar w3-light-grey " id="bar_menu_principal">
            
        </div>
        </div>
            
            
            <div class="w3-container w3-gray" >
                <div id="datos_Abuscar" class="w3-modal">
                    <div class="w3-modal-content">
                        <header class="w3-container w3-teal"> 
                            <span onclick="document.getElementById('datos_Abuscar').style.display = 'none'" 
                                  class="w3-button w3-display-topright">&times;</span>
                            <h2>Seleccione Caja</h2>
                </header>
                        <div class="w3-gray">
                 <select id="cajas" class="w3-select">
                 </select>
                 <label class="w3-text-white"><b>Ingrese Monto Inicial</b></label>       
                 <input class="w3-input w3-border" type="text" id="monto"/></div>
                <footer class='w3-container w3-teal'>
                <p>Presione Procesar</p>
                <button class="w3-border w3-gray "  id="procesarApertura" onclick="RealizarApertura();">Procesar</button>
                <br>
                </footer>
               </div>    
                

                </div>
                </div>
            
            
            
            

        <div style="text-align: center">
        <iframe name="contenedor_paginas" id="main" style="margin-top: 50px" scrolling="si" frameborder="0" width="900" height="700"> 
        </iframe> 
        </div>  
        </div>
       
        
    </body>
</html>

