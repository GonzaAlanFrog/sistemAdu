
CargaTabla();


function CargaTabla() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/DepositoCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].id_deposito + "</td>";
                filas += "<td>" + json[i].dep_descripcion + "</td>";
              
                filas += "<td><img onclick=\"editar('" + json[i].id_deposito + "','" + json[i].dep_descripcion +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                filas += "<td><img onclick=\"eliminar('" + json[i].id_deposito + "','" + json[i].dep_descripcion + "')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
                filas += "</tr>";
            }
            document.getElementById("Cuerpos").innerHTML = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 4}));


}



function agregar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/DepositoCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
       if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                alert(json[i].retorno);
            }
            CargaTabla();
        }

    };
    xhr.send(JSON.stringify(
            datos = {
                Bandera: 1,
                id_deposito: (document.getElementById('id_deposito').value === '' ? 0 : document.getElementById('id_deposito').value),
                dep_descripcion: document.getElementById('dep_descripcion').value
 }));


}

function modificar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/DepositoCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                alert(json[i].retorno);
            }
            CargaTabla();

        }

    };
    xhr.send(JSON.stringify(
            datos = {
                Bandera: 2,
                id_deposito: (document.getElementById('id_deposito').value === '' ? 0 : document.getElementById('id_deposito').value),
                dep_descripcion: document.getElementById('dep_descripcion').value
}));


}

function iseliminar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/DepositoCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                alert(json[i].retorno);
            }
            CargaTabla();

        }

    };
    xhr.send(JSON.stringify(
            datos = {
                Bandera: 3,
               id_deposito: (document.getElementById('id_deposito').value === '' ? 0 : document.getElementById('id_deposito').value)
               
            }));


}

function limpiar() {
  document.getElementById('id_deposito').value = "";
  document.getElementById('dep_descripcion').value = "";
  
}

function eliminar(id, nombre) {
    document.getElementById("id_deposito").value = id;
    document.getElementById("dep_descripcion").value = dep_descripcion;
    if (confirm('Confirmar la eliminación del registro ' + id + ' - ' + nombre)) {
        iseliminar();
    } else {
        limpiar();
    }
}

function editar(id, dep_descripcion) {
    document.getElementById('id_deposito').value = id;
    document.getElementById('dep_descripcion').value = dep_descripcion;
}

function validacionBtn(value){
    switch (value) {
        case 1://es agregar
        if(document.getElementById('dep_descripcion').value.trim()===""){
        alert("Por favor completa todos los campos");    
        }else{
        agregar();
        limpiar();
        }  
        break;
        case 2://es eliminar
        if(document.getElementById('id_deposito').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        eliminar(document.getElementById('id_deposito').value.trim(),document.getElementById('dep_descripcion').value.trim()); 
        limpiar();
        }       
            break;
        case 3://es modificar
         if(document.getElementById('id_deposito').value.trim()===""){
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