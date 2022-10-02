var url ="../PHP/FacturaCompraCTR.php";
CargarFecha();

function insertDetalle(){
 document.getElementById('agregar_tabla').setAttribute("disabled", "disabled");
    var id = document.getElementById('nro_trx').innerHTML;
    var res = id.split(":");
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL =url;
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        //document.getElementById('agregar_tabla').;
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
           var json = JSON.parse(xhr.responseText);
            var i;
            var v;
            for (i = 0; i < json.length; i++) {
            v=json[i].retorno;
            }
            if(v==="exito"){
                CargarDetalle();
                sumatotal();
            }else{
                alert(v);  
                console.log(v);
                document.getElementById('agregar_tabla').removeAttribute("disabled");
            }
            
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 5,
        id_producto: document.getElementById('cod_producto').value,
        cantidad: document.getElementById('cantidad_producto').value,
        precio: document.getElementById('precio_producto').value,
        id_transaccion: res[1]}));   
}

function sumatotal(){
document.getElementById('agregar_tabla').setAttribute("disabled", "disabled");
    var id = document.getElementById('nro_trx').innerHTML;
    var res = id.split(":");
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL =url;
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        //document.getElementById('agregar_tabla').;
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "", sum = "";
            for (i = 0; i < json.length; i++) {
                sum = json[i].suma;
            }
            //document.getElementById("Cuerpos").innerHTML = filas;
            document.getElementById("suma_total").value = sum;
            limpiar();

           /// document.getElementById('agregar_tabla').removeAttribute("disabled");
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 7,id_transaccion: res[1]}));  
}

function CargarDetalle() {
    document.getElementById('agregar_tabla').setAttribute("disabled", "disabled");
    var id = document.getElementById('nro_trx').innerHTML;
    var res = id.split(":");
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL =url;
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        //document.getElementById('agregar_tabla').;
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "", sum = "";
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].id_mercaderia + "</td>";
                filas += "<td>" + json[i].mer_descripcion + "</td>";
                filas += "<td>" + json[i].dv_cantidad + "</td>";
                filas += "<td>" + json[i].dv_precio + "</td>";
                filas += "<td>" + json[i].subtotal + "</td>";
                filas += "</tr>";
               /// sum = json[i].Suma;
            }
            document.getElementById("Cuerpos").innerHTML = filas;
            ///document.getElementById("suma_total").value = sum;
            document.getElementById('agregar_tabla').removeAttribute("disabled");
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 6,id_transaccion: res[1]}));
}

function limpiar() {
    var vacio = "";
    //document.getElementById('cod_cliente').value = vacio;
    //document.getElementById('documento_cliente').value = vacio;
    //document.getElementById('nombre_cliente').value = vacio;
    //document.getElementById('apellido_cliente').value = vacio;
    //document.getElementById('correo_cliente').value = vacio;
    document.getElementById('cod_producto').value = vacio;
    document.getElementById('name_producto').value = vacio;
    document.getElementById('stock_producto').value = vacio;
    document.getElementById('precio_producto').value = vacio;
    document.getElementById('cantidad_producto').value = vacio;
}

function validacionOPeraciones(value) {
    var cant_producto = parseInt(document.getElementById('cantidad_producto').value.trim());
    var stock_producto = parseInt(document.getElementById('stock_producto').value.trim());
    switch (value) {
        case 1:
            if (document.getElementById('cod_cliente').value.trim() === "") {
                alert('Primero debe de selecionar un Proveedor');
            } else {
                CrearFactura();
            }
            break;
        case 2:
            if (cant_producto === "") {
                alert('Ingrese Cantidad');
            } else if (cant_producto <= 0) {
                alert('Ingrese un valor valido');
            } else if (cant_producto <= 0,0) {
                alert('Ingrese un valor valido');
            } else if (cant_producto > stock_producto) {
                alert('Stock no Disponible');
            } else {
                ///cargamos el detalle
                insertDetalle();

            }
            break;
    }
}

function cargarBuscadorCliente() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL =url;
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].id_cliente + "</td>";
                filas += "<td>" + json[i].cli_ruc + "</td>";
                filas += "<td>" + json[i].cli_razonsocial + "</td>";
                filas += "<td>" + json[i].cli_telefono + "</td>";
                filas += "<td>" + json[i].cli_email + "</td>";
                filas += "<td><img onclick=\"recuperarDeBuscadorCliente('" + json[i].id_cliente + "','" + json[i].cli_ruc + "','" + json[i].cli_razonsocial + "','" + json[i].cli_telefono + "','" + json[i].cli_email + "')\" src='../img/select.png' alt='Sel'></td>";
                filas += "</tr>";
            }
            document.getElementById("datosCuerpoBuscador").innerHTML = filas;
            document.getElementById('datos_Abuscar').style.display = 'block';
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 2}));
}

function recuperarDeBuscadorCliente(idcliente, documento, nombre, telefono_cliente, correo) {
    document.getElementById('cod_cliente').value = idcliente;
    document.getElementById('documento_cliente').value = documento;
    document.getElementById('nombre_cliente').value = nombre;
    document.getElementById('telefono_cliente').value = telefono_cliente;
    document.getElementById('correo_cliente').value = correo;
    document.getElementById('datos_Abuscar').style.display = 'none';
}

function cargarBuscadorPro() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL =url;
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].id_mercaderia + "</td>";
                filas += "<td>" + json[i].mer_descripcion + "</td>";
                filas += "<td>" + json[i].mer_precio + "</td>";
                filas += "<td>" + json[i].stk_cantidad + "</td>";
                filas += "<td><img onclick=\"recuperarDeBuscadorPro('" + json[i].id_mercaderia + "','" + json[i].mer_descripcion + "','" + json[i].stk_cantidad + "','" + json[i].mer_precio + "')\" src='../img/select.png' alt='Sel'></td>";
                filas += "</tr>";
            }
            document.getElementById("datosCuerpoBuscadorp").innerHTML = filas;
            document.getElementById('datos_Abuscarp').style.display = 'block';
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 3}));
}

function recuperarDeBuscadorPro(id, nombre, stock, precio) {
    document.getElementById('cod_producto').value = id;
    document.getElementById('name_producto').value = nombre;
    document.getElementById('stock_producto').value = stock;
    document.getElementById('precio_producto').value = precio;
    document.getElementById('datos_Abuscarp').style.display = 'none';
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

function obDatosUnicoBuscadorp() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("dato_filtrop");
    filter = input.value.toUpperCase();
    table = document.getElementById("datosCuerpoBuscadorp");
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

function deshabilitados() {
    document.getElementById('nuevo').setAttribute("class", "w3-btn w3-blue w3-round w3-disabled");
    document.getElementById('nuevo').setAttribute("disabled", "disabled");
    document.getElementById('imprimir').setAttribute("class", "w3-btn w3-round w3-green");
    document.getElementById('imprimir').removeAttribute("disabled");
    document.getElementById('cancelar').setAttribute("class", "w3-btn w3-round w3-red");
    document.getElementById('cancelar').removeAttribute("disabled");
    ///
    document.getElementById('cargarBuscadorCliente').setAttribute("class", "w3-right w3-round w3-border w3-green w3-disabled");
    document.getElementById('cargarBuscadorCliente').setAttribute("disabled", "disabled");
    //document.getElementById('cargarBuscadorCliente').removeAttribute("disabled");
    document.getElementById('cargarBuscadorPro').setAttribute("class", "w3-right w3-round w3-border w3-green");
    document.getElementById('cargarBuscadorPro').removeAttribute("disabled");
    document.getElementById('cantidad_producto').setAttribute("class", "w3-round w3-border w3-hover-border-dark-grey");
    document.getElementById('cantidad_producto').removeAttribute("disabled");
    document.getElementById('agregar_tabla').setAttribute("class", "w3-right w3-round w3-border w3-green");
    document.getElementById('agregar_tabla').removeAttribute("disabled");
}

function CrearFactura() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL =url;
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            document.getElementById("nro_trx").innerHTML = xhr.responseText;
            deshabilitados();
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 4, id_cliente: document.getElementById('cod_cliente').value}));
}

function CargarFecha() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL =url;
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            document.getElementById("fecha_actual").innerHTML = xhr.responseText;
        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 1}));
}


function loadDocPdf() {
    var id = document.getElementById('nro_trx').innerHTML;
    var res = id.split(":");
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "../PHP/factura.php?id="+res[1]+"");
    xhr.responseType = "text/html";

    xhr.onload = function () {
        if (this.status === 200) {
            var blob = new Blob([xhr.response], {type: "text/html"});
            var objectUrl = URL.createObjectURL(blob);
            window.open(objectUrl, '_blank');
        }
    };
    xhr.send();
  // xhr.send(JSON.stringify(datos = {bandera: bandera}));
  ///xhr.send(JSON.stringify(datos = {bandera: 1, id:res[1]}));
}
