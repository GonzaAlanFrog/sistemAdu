///alert("js");
CargaTabla();


function CargaTabla(){
   
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/CiudadCtr.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var filas="";
              var opcion1;
              for(i=0;i < json.length ;i++){
                  filas+="<tr>";
                  filas+="<td>"+json[i].id+"</td>";
                  filas+="<td>"+json[i].descripcion+"</td>";
                //  filas+="<td>"+(typeof json[i].obsv==="undefined"? "":json[i].obsv )+"</td>";
                filas += "<td><img onclick=\"editar('" + json[i].id + "','" + json[i].descripcion +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                filas += "<td><img onclick=\"eliminar('" + json[i].id + "','" + json[i].descripcion + "')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
                
                  filas+="</tr>";
                 // opcion1+="<option value="+json[i].id_Perfil +">" +json[i].Descripcion+"</option>";
              }
              document.getElementById("Cuerpos").innerHTML=filas;
              
             }
         };
         xhr.send(JSON.stringify(datos={Bandera :4}));
    
    
}
    
function agregar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/CiudadCtr.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
            if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var filas="";
              var opcion1;
              for(i=0;i < json.length ;i++){
                  alert(json[i].retorno);
              }
             CargaTabla();
        
      } 
      
       };
         xhr.send(JSON.stringify(
         datos ={
        Bandera : 1,
        id_ciudad: ( document.getElementById('id_ciudad').value === '' ? 0 : document.getElementById('id_ciudad').value),
        Descripcion : document.getElementById('Descripcion').value
    }));
    
    
}
   
function modificar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/CiudadCtr.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
            if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var filas="";
              var opcion1;
              for(i=0;i < json.length ;i++){
                  alert(json[i].retorno);
              }
             CargaTabla();
        
      } 
      
       };
         xhr.send(JSON.stringify(
         datos ={
        Bandera : 2,
        id_ciudad: ( document.getElementById('id_ciudad').value === '' ? 0 : document.getElementById('id_ciudad').value),
        Descripcion : document.getElementById('Descripcion').value
    }));
    
    
}

function iseliminar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/CiudadCtr.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
            if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var filas="";
              var opcion1;
              for(i=0;i < json.length ;i++){
                  alert(json[i].retorno);
              }
             CargaTabla();
        
      } 
      };
         xhr.send(JSON.stringify(
         datos ={
        Bandera : 3,
        id_ciudad: ( document.getElementById('id_ciudad').value === '' ? 0 : document.getElementById('id_ciudad').value),
        Descripcion : document.getElementById('Descripcion').value
    })); 
   }   
   


function limpiar() {
  document.getElementById('id_ciudad').value = "";
    document.getElementById('Descripcion').value = "";

}

function eliminar(id, nombre) {
    document.getElementById("id_ciudad").value = id;
    document.getElementById("Descripcion").value = nombre;
    if (confirm('Confirmar la eliminación del registro ' + id + ' - ' + nombre)) {
        iseliminar();
        limpiar();
    } else {
        limpiar();
    }
    
      
}

function editar(id, Descripcion) {
    document.getElementById('id_ciudad').value = id;
    document.getElementById('Descripcion').value = Descripcion;    
}

function validacionBtn(value){
    switch (value) {
        case 1://es agregar
        if(document.getElementById('Descripcion').value.trim()===""){
        alert("Por favor completa todos los campos");    
        }else{
        agregar();
        //alert("Agregado");
        limpiar();
        }  
        break;
        case 2://es eliminar
        if(document.getElementById('id_ciudad').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        eliminar(document.getElementById('id_ciudad').value.trim(),document.getElementById('Descripcion').value.trim()); 
       // alert("Eliminado");
        limpiar();
        }       
            break;
        case 3://es modificar
         if(document.getElementById('id_ciudad').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        modificar();
        //alert("Modificado");
        limpiar();
        }    
        break;
        case 4://es cancelar
        limpiar();
            break;
         
    }
}///este perro
      
 function BuscarRegistro() {
     
     console.log('se ejecuta buscador');
    var input, filter, table, tr, td, i;
    console.log('se ejecuta buscador o no');
    input = document.getElementById("buscado");
    filter = input.value.toUpperCase();
    table = document.getElementById("Cuerpos");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}   





