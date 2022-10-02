

getSesion();

function getSesion(){
    
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="/siscobro/recursos/PHP/sesion.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i,filas="";
              var alertita="";
              var none="'none'"; 
              for(i=0;i < json.length ;i++){
              //  alert(xhr.responseText);
              if(json[i].estado==="inciado"){//sesion ya iniciada
              var fun=json[i].id_funcionario; 
              var espacio="&nbsp;";
              var id_perfil=json[i].id_perfil;
              filas+="<tr>";
              filas+="<th><div id='funcionario_id'><div></th>";
              filas+="<th><label>"+espacio+"<label/></th>";
              filas+="<th><input type='button' onclick='CerrarSesion(0);' value='Cerrar Sesion' class='w3-button w3-round-large w3-green'/></th>";
              filas+="</tr>";
              //getFuncionario(fun);
              cargarMenu(id_perfil);
              F5();
              }else if(json[i].estado==="caja_cerrada"){///caja cerrrada porfavor abralo
              alertita='<div class="w3-panel w3-red w3-display-container w3-animate-top"><span onclick="CargaComboxCajas();"class="w3-button w3-green w3-large w3-display-topright">&times;</span><h3>Atencíon...!</h3><p>Por Favor Realize su Apertura</p></div>';    
              
              document.getElementById("resultado").innerHTML=alertita;   
              }else{///sesion cerrada volvamos al login
               filas+="<tr>";
               filas+="<th><input type='text' id='usuario' size='15' placeholder='user' class='w3-input w3-border w3-round-large'/> </th>";
               filas+="<th><input type='password' id='clave' size='15' placeholder='password' class='w3-input w3-border w3-round-large'/></th>";
               filas+="<th><input type='button' onclick='Validator();' value='Ingresar' class='w3-button w3-round-large w3-green'/></th>";
               filas+="</tr>"; 
               // vaciamos el menu
               cargaVacio();
              }    
            }
            document.getElementById("tabladatos").innerHTML=filas;
          console.log(filas);
            
             }
         };
        xhr.send(JSON.stringify(datos ={Bandera:1,id_usuario:3}));
          
}

function getFuncionario(id_funcionario){
 var funcionario;
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="/siscobro/recursos/PHP/FuncionariosCTR.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              json=JSON.parse(xhr.responseText);
              var i,variable="";
              for(i=0;i < json.length ;i++){
            funcionario=""+json[i].Nombre;
            document.getElementById("funcionario_id").innerHTML=funcionario;
              }
             }
          
            
         };
         xhr.send(JSON.stringify(datos={Bandera:5,id_funcionario :id_funcionario})); 
}

function logueado(id_funcionario){
var filas="";
var espacio="&nbsp;";
filas+="<tr>";
filas+="<th><div id='funcionario_id'><div></th>";
filas+="<th><label>"+espacio+"<label/></th>";
filas+="<th><input type='button' onclick='CerrarSesion("+espacio+");' value='Cerrar Sesion' class='w3-button w3-round-large w3-green'/></th>";
filas+="</tr>"; 
document.getElementById("tabladatos").innerHTML=filas;
getFuncionario(id_funcionario);
}

function cargaVacio(){
//vaciamos el menu y iframe
var menus="";
document.getElementById("bar_menu_principal").innerHTML=menus;
var iframe = document.getElementById("main");
var html = "";
iframe.contentWindow.document.open();
iframe.contentWindow.document.write(html);
iframe.contentWindow.document.close();
}

function F5(){
//vaciamos el iframe
var iframe = document.getElementById("main");
var html = "";
iframe.contentWindow.document.open();
iframe.contentWindow.document.write(html);
iframe.contentWindow.document.close();
}

function CerrarSesion(sesionID){
    if(confirm("¿Estas apunto de Cerrar Sesion?")){
    var xhr = new XMLHttpRequest(),
         method="POST",
         URL="/siscobro/recursos/PHP/sesion.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              getSesion(); 
             }
         };
         xhr.send(JSON.stringify(datos={Bandera:2,id_sesion :sesionID,estado:1}));   
    }
}

function cargarMenu(id_perfil){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="/siscobro/recursos/PHP/GestorMenu.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var filas="";
              for(i=0;i < json.length ;i++){
                  filas+=json[i].cadena;
                  console.log(filas);
                
              }
              ///alert(filas);
              document.getElementById("bar_menu_principal").innerHTML=filas;
              ///console.log(filas);
             }
         };
        // xhr.send(JSON.stringify(datos={Bandera:1,id_perfil:id_perfil}));
                 xhr.send(JSON.stringify(datos={Bandera:1,id_perfil:id_perfil}));

}

function CargaComboxCajas() {
 
  document.getElementById('resultado').style.display = 'none';
    var xhr = new XMLHttpRequest(),
            method = "POST",
URL="/siscobro/recursos/PHP/GestorMenu.php";    
xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var opcion1;
            for (i = 0; i < json.length; i++) {
                opcion1 += "<option value=" + json[i].codigo + ">" + json[i].descripcion + "</option>";
            }
            document.getElementById("cajas").innerHTML = opcion1;
            document.getElementById('datos_Abuscar').style.display = 'block';
            getSesion();
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 2}));


}

function RealizarApertura(){
  
    var xhr = new XMLHttpRequest(),
         method="POST",
         URL="/siscobro/recursos/PHP/AperturaCierreCTR.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
                 document.getElementById('datos_Abuscar').style.display = 'none';
              getSesion(); 
             }
         };
         xhr.send(JSON.stringify(datos={Bandera:1,caja :document.getElementById('cajas').value,monto:(document.getElementById('monto').value === '' ? 0 : document.getElementById('monto').value)}));   
     
    
}

