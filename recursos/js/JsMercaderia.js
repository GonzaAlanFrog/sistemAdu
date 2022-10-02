//alert("ccc");
CargaTabla();
CargaComboxNacionalidad();
CargaComboxtipo_mercaderia();
limpiar();
function CargaTabla(){
   
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/MercaderiaCtr.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var filas="";
              var opcion1;
              for(i=0;i < json.length ;i++){
                  filas+="<tr>";
                  filas+="<td>"+json[i].codigo+"</td>";
                  filas+="<td>"+json[i].descripcion+"</td>";
                  filas+="<td>"+json[i].costo+"</td>";
                  filas+="<td>"+json[i].precio+"</td>";
                  filas+="<td>"+json[i].tipoimpuesto+"</td>";
                  filas+="<td>"+json[i].nacionalidad+"</td>";
                  filas+="<td>"+json[i].tipo+"</td>";
                
                   filas += "<td><img onclick=\"editar('" + json[i].codigo + "','" + json[i].descripcion +"','" + json[i].costo +"','" + json[i].precio +"','" + json[i].tipoimpuesto +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                   filas += "<td><img onclick=\"eliminar('" + json[i].codigo + "','" + json[i].descripcion +"')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
                   filas += "</tr>";
              }
              document.getElementById("Cuerpos").innerHTML=filas;
              
             }
         };
         xhr.send(JSON.stringify(datos={Bandera :4}));
    
    
}
    
function agregar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/MercaderiaCtr.php";
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
        id_mercaderia: ( document.getElementById('id_mercaderia').value === '' ? 0 : document.getElementById('id_mercaderia').value),
        mer_descripcion : (document.getElementById('mer_descripcion').value),
        mer_costo : (document.getElementById('mer_costo').value),
        mer_precio : (document.getElementById('mer_precio').value),
        mer_tipoimpuesto:( document.getElementById('mer_tipoimpuesto').value),
        id_nacionalidad:( document.getElementById('id_nacionalidad').value),
        tipo_mercaderia:( document.getElementById('tipo_mercaderia').value)
}));
 }
   
function modificar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/MercaderiaCtr.php";
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
        id_mercaderia: ( document.getElementById('id_mercaderia').value === '' ? 0 : document.getElementById('id_mercaderia').value),
        mer_descripcion : (document.getElementById('mer_descripcion').value),
        mer_costo : (document.getElementById('mer_costo').value),
        mer_precio : (document.getElementById('mer_precio').value),
        mer_tipoimpuesto:( document.getElementById('mer_tipoimpuesto').value),
        id_nacionalidad:( document.getElementById('id_nacionalidad').value),
        tipo_mercaderia:( document.getElementById('tipo_mercaderia').value)
}));
    
    
}

function iseliminar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/MercaderiaCtr.php";
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
        id_mercaderia: ( document.getElementById('id_mercaderia').value === '' ? 0 : document.getElementById('id_mercaderia').value)

    }));
    
    
}

function   buscador() {
    var input, filter, table, tr, td, i;
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
function validacionBtn(value){
    switch (value) {
        case 1://es agregar
        if(document.getElementById('mer_descripcion').value.trim()===""){
        alert("Por favor completa todos los campos");    
        }else{
        agregar();
        limpiar();
        }  
        break;
        case 2://es eliminar
        if(document.getElementById('id_mercaderia').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        eliminar(document.getElementById('id_mercaderia').value.trim(),document.getElementById('mer_descripcion').value.trim()); 
        limpiar();
        }       
            break;
        case 3://es modificar
         if(document.getElementById('id_mercaderia').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        modificar();
        limpiar();
        }    
        break;
        case 2://es cancelar
        limpiar();
            break;
         
    }    
    
}
function limpiar() {
        document.getElementById('mer_descripcion').value= "";
        document.getElementById('mer_costo').value= "";
        document.getElementById(' mer_precio ').value= "";
   
}

function eliminar(id_mercaderia, mer_descripcion) {
   document.getElementById('id_mercaderia').value= id_mercaderia;
   document.getElementById('mer_descripcion').value=mer_descripcion;
   
   if (confirm('Confirmar la eliminación del registro ' + id_mercaderia + ' - ' + mer_descripcion)) {
        iseliminar();
    } else {
        limpiar();
    }
}
function CargaComboxNacionalidad() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
             URL="../PHP/MercaderiaCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var opcion1;
            for (i = 0; i < json.length; i++) {
                opcion1 += "<option value=" + json[i].codigo + ">" + json[i].descripcion + "</option>";
            }
            document.getElementById("id_nacionalidad").innerHTML = opcion1;
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 6}));


}
function CargaComboxtipo_mercaderia() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
             URL="../PHP/MercaderiaCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var opcion1;
            for (i = 0; i < json.length; i++) {
                opcion1 += "<option value=" + json[i].codigo + ">" + json[i].descripcion + "</option>";
            }
            document.getElementById("tipo_mercaderia").innerHTML = opcion1;
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 7}));


}

function editar(id_mercaderia, mer_descripcion,mer_costo,mer_precio,mer_tipoimpuesto) {
   document.getElementById('id_mercaderia').value= id_mercaderia;
   document.getElementById('mer_descripcion').value=mer_descripcion;
   document.getElementById('mer_costo').value= mer_costo;
   document.getElementById('mer_precio').value= mer_precio;
  // document.getElementById('mer_tipoimpuesto').value= mer_tipoimpuesto;
}