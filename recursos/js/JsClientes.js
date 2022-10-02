//alert("ccc");
CargaTabla();
CargarCiudad();
 //esModificar();
function CargaTabla() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/clientesCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].codigo + "</td>";
                filas += "<td>" + json[i].ruc + "</td>";
                filas += "<td>" + json[i].razonSocial + "</td>";
                filas += "<td>" + json[i].telefono + "</td>";
                filas += "<td>" + json[i].direccion + "</td>";
                filas += "<td>" + json[i].email + "</td>";
                filas += "<td>" + json[i].ciudades + "</td>";
                filas += "<td><img onclick=\"editar('" + json[i].codigo + "','" + json[i].ruc + "','" + json[i].telefono + "','" + json[i].direccion + "','" + json[i].cuidades_id_cuidad + "','" + json[i].razonSocial +"','"+ json[i].email +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                filas += "<td><img onclick=\"eliminar('" + json[i].codigo + "','" + json[i].razonSocial + "')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
                filas += "</tr>";
            }
            document.getElementById("Cuerpos").innerHTML = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 4}));


}

function CargarCiudad() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/clientesCtr.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;

            var opcion1 = "";
            for (i = 0; i < json.length; i++) {


                opcion1 += "<option value=" + json[i].codigo + ">" + json[i].descripcion + "</option>";
            }
            document.getElementById("ciudades").innerHTML = opcion1;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 5}));


}

function agregar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/clientesCtr.php";
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
                id_cliente: (document.getElementById('id_cliente').value === '' ? 0 : document.getElementById('id_cliente').value),
                ruc: document.getElementById('ruc').value,
                razonSocial: document.getElementById('razonSocial').value,
                telefono: document.getElementById('telefono').value,
                direccion: document.getElementById('direccion').value,
                email: document.getElementById('email').value,
                ciudades: document.getElementById('ciudades').value
              
            }));


}

function esModificar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/clientesCtr.php";
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
                id_cliente: (document.getElementById('id_cliente').value === '' ? 0 : document.getElementById('id_cliente').value),
                ruc: document.getElementById('ruc').value,
                razonSocial: document.getElementById('razonSocial').value,
                telefono: document.getElementById('telefono').value,
                direccion: document.getElementById('direccion').value,
                email: document.getElementById('email').value,
                ciudades: document.getElementById('ciudades').value
            }));


}

function iseliminar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/clientesCtr.php";
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
               id_cliente: (document.getElementById('id_cliente').value === '' ? 0 : document.getElementById('id_cliente').value)
               
            }));


}


function buscador() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("buscado");
    filter = input.value.toUpperCase();
    table = document.getElementById("Cuerpos");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function limpiar() {
  document.getElementById('id_cliente').value = "";
    document.getElementById('ruc').value = "";
    document.getElementById('telefono').value = "";
    document.getElementById('direccion').value = "";
    document.getElementById('ciudades').value = "";
    document.getElementById('razonSocial').value = "";
    document.getElementById('email').value = "";
    
}

function eliminar(id, nombre) {
    document.getElementById("id_cliente").value = id;
    document.getElementById("razonSocial").value = nombre;
    if (confirm('Confirmar la eliminación del registro ' + id + ' - ' + nombre)) {
        iseliminar();
    } else {
        limpiar();
    }
}

function editar(id, ruc, telefono, direccion, ciudades,razonSocial,email) {
    document.getElementById('id_cliente').value = id;
    document.getElementById('ruc').value = ruc;
    document.getElementById('telefono').value = telefono;
    document.getElementById('direccion').value = direccion;
    document.getElementById('ciudades').value = ciudades;
    document.getElementById('razonSocial').value = razonSocial;
    document.getElementById('email').value = email;
    
}

function validacionBtn(value){
    switch (value) {
        case 1://es agregar
        if(document.getElementById('razonSocial').value.trim()===""){
        alert("Por favor completa todos los campos");    
        }else{
        agregar();
        //alert("Agregado");
        limpiar();
        }  
        break;
        case 2://es eliminar
        if(document.getElementById('id_cliente').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        eliminar(document.getElementById('id_cliente').value.trim(),document.getElementById('razonSocial').value.trim()); 
       // alert("Eliminado");
        limpiar();
        }       
            break;
        case 3://es modificar
         if(document.getElementById('id_cliente').value.trim()===""){
        alert("Primero selecciona un registro");    
        }else{
        esModificar();
        //alert("Modificado");
        limpiar();
        }    
        break;
        case 4://es cancelar
        limpiar();
            break;
         
    }    
    
}