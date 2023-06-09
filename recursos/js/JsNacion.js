
CargaTabla();


function CargaTabla() {

            var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/NacionCtr.php";
            xhr.open(method, URL, true);
            xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].cod_nacion + "</td>";
                filas += "<td>" + json[i].descrip_nacion + "</td>";
                filas += "<td><img onclick=\"editar('" + json[i].cod_nacion + "','" + json[i].descrip_nacion +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                filas += "<td><img onclick=\"eliminar('" + json[i].cod_nacion + "','" + json[i].descrip_nacion + "')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
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
            URL = "../PHP/NacionCtr.php";
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
                cod_nacion: (document.getElementById('cod_nacion').value === '' ? 0 : document.getElementById('cod_nacion').value),
                descrip_nacion: document.getElementById('descrip_nacion').value
 }));


}

function modificar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/NacionCtr.php";
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
                cod_nacion: (document.getElementById('cod_nacion').value === '' ? 0 : document.getElementById('cod_nacion').value),
                descrip_nacion: document.getElementById('descrip_nacion').value
}));


}

function iseliminar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/NacionCtr.php";
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
                cod_nacion: (document.getElementById('cod_nacion').value === '' ? 0 : document.getElementById('cod_nacion').value),
                Descripcion : document.getElementById('descrip_nacion').value

               
            }));


}

function limpiar() {
  document.getElementById('cod_nacion').value = "";
    document.getElementById('descrip_nacion').value = "";
  
}

function eliminar(id, nombre) {
    document.getElementById("cod_nacion").value = id;
    document.getElementById("descrip_nacion").value = nombre;
    if (confirm('Confirmar la eliminación del registro ' + id + ' - ' + nombre)) {
        iseliminar();
        limpiar();
    } else {
        limpiar();
    }
}

function editar(id, descrip_nacion) {
    document.getElementById('cod_nacion').value = id;
    document.getElementById('descrip_nacion').value = descrip_nacion;
}

function validacionBtn(value){
    switch (value) {
        case 1://es agregar
        if(document.getElementById('descrip_nacion').value.trim()===""){
        alert("Por favor completa todos los campos");    
        }else{
        agregar();
        limpiar();
        }  
        break;
        case 2://es eliminar
        if(document.getElementById('cod_nacion').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        eliminar(document.getElementById('cod_nacion').value.trim(),document.getElementById('descrip_nacion').value.trim()); 
        limpiar();
        }       
            break;
        case 3://es modificar
         if(document.getElementById('cod_nacion').value.trim()===""){
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