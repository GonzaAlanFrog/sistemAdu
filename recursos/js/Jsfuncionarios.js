//alert("ccc");
CargaTabla();
CargaComboxCargo();
CargaComboxCiudad();


function CargaTabla(){
   
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/FuncionariosCTR.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
              var json=JSON.parse(xhr.responseText);
              var i;
              var filas="";
              var opcion1;
              for(i=0;i < json.length ;i++){
                  filas+="<tr>";
                  filas+="<td>"+json[i].id_funcionario+"</td>";
                  filas+="<td>"+json[i].fun_nombre+"</td>";
                  filas+="<td>"+json[i].fun_apellido+"</td>";
                  filas+="<td>"+json[i].fun_direccion+"</td>";
                  filas+="<td>"+json[i].fun_ci+"</td>";
                  filas+="<td>"+json[i].fun_imail+"</td>";
                  filas+="<td>"+json[i].fun_telefono+"</td>"; 
                  filas+="<td>"+json[i].id_cargo+"</td>";
                  filas+="<td>"+json[i].id_ciudad+"</td>";
                 
                filas += "<td><img onclick=\"editar(" + json[i].id_funcionario + "," + json[i].fun_ci +",'" + json[i].fun_nombre +"','" + json[i].fun_apellido +"','" + json[i].fun_telefono +"','" + json[i].fun_direccion +"','" + json[i].fun_imail +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                filas += "<td><img onclick=\"eliminar(" + json[i].id_funcionario + ",'" + json[i].fun_nombre + "')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
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
         URL="../PHP/FuncionariosCTR.php";
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
        id_funcionario: ( document.getElementById('id_funcionario').value === '' ? 0 : document.getElementById('id_funcionario').value),
        fun_ci : document.getElementById('ci').value,
        fun_nombres : document.getElementById('nombre').value,
        fun_apellido : document.getElementById('apellido').value,
        fun_telefono : document.getElementById('Telefono').value,
        fun_direccion : document.getElementById('direccion').value,
        fun_imail : document.getElementById('Correo').value,
        id_cargo : document.getElementById('id_cargo').value,
        id_ciudad : document.getElementById('id_ciudad').value
        
    }));
    
    
}
   
function modificar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/FuncionariosCTR.php";
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
        id_funcionario: ( document.getElementById('id_funcionario').value === '' ? 0 : document.getElementById('id_funcionario').value),
        fun_ci : document.getElementById('ci').value,
        fun_nombres : document.getElementById('nombre').value,
        fun_apellido : document.getElementById('apellido').value,
        fun_telefono : document.getElementById('Telefono').value,
        fun_direccion : document.getElementById('direccion').value,
        fun_imail : document.getElementById('Correo').value,
        id_cargo : document.getElementById('id_cargo').value,
        id_ciudad : document.getElementById('id_ciudad').value
        
    }));
    
    
}

function iseliminar(){
 var xhr = new XMLHttpRequest(),
         method="POST",
         URL="../PHP/FuncionariosCTR.php";
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
        id_funcionario: ( document.getElementById('id_funcionario').value === '' ? 0 : document.getElementById('id_funcionario').value)
    }));
    
    
}

function limpiar() {
  document.getElementById('id_funcionario').value = "";
  document.getElementById('nombre').value = "";
  document.getElementById('apellido').value = "";
  document.getElementById('direccion').value = "";
  document.getElementById('ci').value = "";
  document.getElementById('Correo').value = "";
  document.getElementById('Telefono').value = "";
  document.getElementById('id_cargo').value = "";
  document.getElementById('id_ciudad').value = "";
  
}

function eliminar(id, nombre) {
    document.getElementById("id_funcionario").value = id;
    document.getElementById("nombre").value = nombre;
    if (confirm('Confirmar la eliminación del registro ' + id + ' - ' + nombre)) {
        iseliminar();
    } else {
        limpiar();
    }
}

function editar(id,ci,nombre,apellido,telefono,direccion,email) {
  document.getElementById('id_funcionario').value = id; 
  document.getElementById('nombre').value = nombre;
  document.getElementById('apellido').value = apellido;
  document.getElementById('Telefono').value = telefono;
  document.getElementById('direccion').value = direccion;
  document.getElementById('ci').value = ci;
  document.getElementById('Correo').value = email;
 // document.getElementById('Telefono').value = Telefono;
//  document.getElementById('id_cargo').value = cargo;
//  document.getElementById('id_ciudad').value = ciudad;
}

function validacionBtn(value){
    switch (value) {
        case 1://es agregar
        if(document.getElementById('nombre').value.trim()===""){
        alert("Por favor completa todos los campos");    
        }else{
        agregar();
        limpiar();
        }  
        break;
        case 2://es eliminar
        if(document.getElementById('id_funcionario').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        eliminar(document.getElementById('id_funcionario').value.trim(),document.getElementById('nombre').value.trim()); 
        limpiar();
        }       
            break;
        case 3://es modificar
         if(document.getElementById('id_funcionario').value.trim()===""){
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

function CargaComboxCargo() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/FuncionariosCTR.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var opcion1;
            for (i = 0; i < json.length; i++) {
                opcion1 += "<option value=" + json[i].codigo + ">" + json[i].descripcion + "</option>";
            }
            document.getElementById("id_cargo").innerHTML = opcion1;
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 5}));


}

function CargaComboxCiudad() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/FuncionariosCTR.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var opcion1;
            for (i = 0; i < json.length; i++) {
                opcion1 += "<option value=" + json[i].codigo + ">" + json[i].descripcion + "</option>";
            }
            document.getElementById("id_ciudad").innerHTML = opcion1;
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 6}));


}
