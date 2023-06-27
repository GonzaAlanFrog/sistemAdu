
CargaTabla();


function CargaTabla() {

            var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/condicionPagoCtr.php";
            xhr.open(method, URL, true);
            xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].cod_condi + "</td>";
                filas += "<td>" + json[i].descrip_condi + "</td>";
                filas += "<td><img onclick=\"editar('" + json[i].cod_condi + "','" + json[i].descrip_condi +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                filas += "<td><img onclick=\"eliminar('" + json[i].cod_condi + "','" + json[i].descrip_condi + "')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
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
            URL = "../PHP/condicionPagoCtr.php";
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
                cod_condi: (document.getElementById('cod_condi').value === '' ? 0 : document.getElementById('cod_condi').value),
                descrip_condi: document.getElementById('descrip_condi').value
 }));


}

function modificar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/condicionPagoCtr.php";
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
                cod_condi: (document.getElementById('cod_condi').value === '' ? 0 : document.getElementById('cod_condi').value),
                descrip_condi: document.getElementById('descrip_condi').value
}));


}

function iseliminar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/condicionPagoCtr.php";
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
                cod_condi: (document.getElementById('cod_condi').value === '' ? 0 : document.getElementById('cod_condi').value),
                Descripcion : document.getElementById('descrip_condi').value

               
            }));


}

function limpiar() {
  document.getElementById('cod_condi').value = "";
    document.getElementById('descrip_condi').value = "";
  
}

function eliminar(id, nombre) {
    document.getElementById("cod_condi").value = id;
    document.getElementById("descrip_condi").value = nombre;
    if (confirm('Confirmar la eliminación del registro ' + id + ' - ' + nombre)) {
        iseliminar();
        limpiar();
    } else {
        limpiar();
    }
}

function editar(id, descrip_condi) {
    document.getElementById('cod_condi').value = id;
    document.getElementById('descrip_condi').value = descrip_condi;
}

function validacionBtn(value){
    switch (value) {
        case 1://es agregar
        if(document.getElementById('descrip_condi').value.trim()===""){
        alert("Por favor completa todos los campos");    
        }else{
        agregar();
        limpiar();
        }  
        break;
        case 2://es eliminar
        if(document.getElementById('cod_condi').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        eliminar(document.getElementById('cod_condi').value.trim(),document.getElementById('descrip_condi').value.trim()); 
        limpiar();
        }       
            break;
        case 3://es modificar
         if(document.getElementById('cod_condi').value.trim()===""){
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