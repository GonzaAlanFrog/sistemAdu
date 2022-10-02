/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

CargaComboxPerfiles();
CargaTabla();
//CargarBuscador();


function esAgregar() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/UsuariosCTR.php";
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
                id_usuario: (document.getElementById('id_usuario').value === '' ? 0 : document.getElementById('id_usuario').value),
                usu_nombre: document.getElementById('usu_nombre').value,
                usu_clave: document.getElementById('usu_clave').value,
                id_funcionario: document.getElementById('id_funcionario').value,
                id_perfil: document.getElementById('id_perfil').value

            }));
}

function esModificar() {
   var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/UsuariosCTR.php";
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
                id_usuario: (document.getElementById('id_usuario').value === '' ? 0 : document.getElementById('id_usuario').value),
                usu_nombre: document.getElementById('usu_nombre').value,
                usu_clave: document.getElementById('usu_clave').value,
                id_funcionario: document.getElementById('id_funcionario').value,
                id_perfil: document.getElementById('id_perfil').value

            }));
}

function esEliminar() {
   var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/UsuariosCTR.php";
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
                id_usuario: (document.getElementById('id_usuario').value === '' ? 0 : document.getElementById('id_usuario').value)

            }));
}

function CargaTabla() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/UsuariosCTR.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].id_usuario + "</td>";
                filas += "<td>" + json[i].usu_nombre + "</td>";
                filas += "<td>" + json[i].usu_clave + "</td>";
                filas += "<td>" + json[i].fun_nombres + "</td>";
                filas += "<td>" + json[i].per_descripcion + "</td>";
                filas += "<td> <img onclick=\"editar('" + json[i].id_usuario + "','" + json[i].usu_nombre + "','" + json[i].usu_clave + "','" + json[i].id_perfil + "','" + json[i].id_funcionario + "','" + json[i].fun_nombres + "')\" src=\"../img/update.png\" alt=\"Mod\"/></td>";
                filas += "<td> <img onclick=\"eliminar(" + json[i].id_usuario + ")\" src=\"../img/delete.png\" alt=\"Elim\"/></td>";

                filas += "</tr>";

            }
            document.getElementById("Cuerpos").innerHTML = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 4}));


}

function CargaComboxPerfiles() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/UsuariosCTR.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var opcion1;
            for (i = 0; i < json.length; i++) {
                opcion1 += "<option value=" + json[i].codigo + ">" + json[i].descripcion + "</option>";
            }
            document.getElementById("id_perfil").innerHTML = opcion1;
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 5}));


}

function RecuperarRegistro() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/UsuariosCTR";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            // alert("hay respuesta");
            var json = JSON.parse(xhr.responseText);
            var i;
            for (i = 0; i < json.length; i++) {
                //// alert("JSON  OBTENEDIO"+json[i].Descripcion);

                document.getElementById('Nombre').value = json[i].Nombre;
                document.getElementById('Apellido').value = json[i].Apellido;
                document.getElementById('Documento').value = json[i].Documento;
                document.getElementById('Telefono').value = json[i].Telefono;
                document.getElementById('Correo').value = json[i].Correo;
            }

        }
    };
    xhr.send(JSON.stringify(
            datos = {Bandera: 4,
                id_funcionario: document.getElementById('id_funcionario').value
            }));


}

function buscador() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("Buscar");
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

function limpiar() {
    document.getElementById('id_usuario').value = "";
    document.getElementById('usu_nombre').value = "";
    document.getElementById('usu_clave').value = "";

}

function eliminar(id) {
    document.getElementById("id_usuario").value = id;
    if (confirm('Confirmar la eliminación del registro ' + id + ' ? ')) {
        //   construirJSON(3);
    } else {
        limpiar();
    }
}

function editar(id, user, pass, PerfilesCuerpo, id_funcionario, nombre) {
    document.getElementById("id_usuario").value = id;
    document.getElementById("usu_nombre").value = user;
    document.getElementById("usu_clave").value = pass;
    document.getElementById("funcionario").value = nombre;
    document.getElementById("id_funcionario").value = id_funcionario;
    document.getElementById("id_perfil").value = PerfilesCuerpo;

}

function validacionBtn(value) {
    switch (value) {
        case 1://es agregar
            if (document.getElementById('usu_nombre').value.trim() === "") {
                alert("Por favor completa todos los campos");
            } else {
                esAgregar();

                limpiar();
            }
            break;
        case 2://es eliminar
            if (document.getElementById('id_usuario').value.trim() === "") {
                alert("Primero selecciona un registro");
            } else {
                eliminar(document.getElementById('id_user').value.trim());

                limpiar();
            }
            break;
        case 3://es modificar
            if (document.getElementById('id_usuario').value.trim() === "") {
                alert("Primero selecciona un registro");
            } else {
                esModificar();

                limpiar();
            }
            break;
        case 4://es cancelar
            limpiar();
            break;

    }

}


function obDatosUnicoBuscador() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("dato_filtro");
    filter = input.value.toUpperCase();
    table = document.getElementById("datosCuerpoBuscador");
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

function recuperar(id_funcionario, nombre) {
    document.getElementById("funcionario").value = nombre;
    document.getElementById("id_funcionario").value = id_funcionario;
    document.getElementById('datos_Abuscar').style.display = 'none';
}

function CargarBuscador() {
   
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/UsuariosCTR.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].codigo + "</td>";
                filas += "<td>" + json[i].descripcion + "</td>";
                filas += "<td><img onclick=\"recuperar('" + json[i].codigo + "','" + json[i].descripcion + "')\" src='../img/select.png' alt='Sel'></td>";
                filas += "</tr>";
            }
            document.getElementById("datosCuerpoBuscador").innerHTML = filas;
            document.getElementById('datos_Abuscar').style.display = 'block';
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 6}));

}


