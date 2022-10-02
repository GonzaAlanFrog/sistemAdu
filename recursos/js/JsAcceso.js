//window.history.forward();
        
function limpiar() {
        document.getElementById('usuario').value= "";
        document.getElementById('clave').value= "";
}

function Acceso(){
   
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="/siscobro/recursos/PHP/AccesoCtr.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var alertita="";
              var none="'none'"; 
              
              for(i=0;i < json.length ;i++){
                
                if(json[i].Cod_Respuesta==='1'){
                    console.log(json[i].Cod_Respuesta);
                alertita='<div class="w3-panel w3-red w3-display-container w3-animate-top"><span onclick="this.parentElement.style.display='+none+'"class="w3-button w3-red w3-large w3-display-topright">&times;</span><h3>Atencíon...!</h3><p>Credenciales Incorrectas ,Por favor verifique sus datos.!</p></div>';    
                limpiar();
              }else{
             console.log("logueadoo");
   
                         CargaComboxCajas();  
                         getSesion();
              }
            }
              document.getElementById("resultado").innerHTML=alertita;
              
             }
         };
        xhr.send(JSON.stringify(datos ={
        Bandera:1,
        usuario :document.getElementById('usuario').value,
        clave : document.getElementById('clave').value
        }));
    
    
}

function Validator(){
var none="'none'";    
 if(document.getElementById('usuario').value=== ""||document.getElementById('clave').value===""){ 
 var alerta='<div class="w3-panel w3-yellow w3-display-container w3-animate-top"><span onclick="this.parentElement.style.display='+none+'"class="w3-button w3-yellow w3-large w3-display-topright">&times;</span><h3>Atencíon...!</h3><p>Por Favor complete todos los campos</p></div>';    
 document.getElementById("resultado").innerHTML=alerta;    
 }else{
 Acceso();    
 }   
 
}
