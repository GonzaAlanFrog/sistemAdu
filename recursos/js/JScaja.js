
CargaTabla();
funcionario();
getFecha();
getcaja();
getmonto();

function CargaTabla() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/caja.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].nro_factura + "</td>";
                filas += "<td>" + json[i].Monto + "</td>";
                filas += "<tr>";
             
            }
            document.getElementById("Cuerpos").innerHTML = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 1}));


}

function funcionario() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/caja.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas = json[i].va;
            }
            document.getElementById("Funcionario").value = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 2}));


}

function getFecha() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/caja.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas = json[i].va;
            }
            document.getElementById("Fecha").value = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 3}));


}

function getcaja() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/caja.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas = json[i].va;
            }
            document.getElementById("idcaja").value = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 5}));


}
function getmonto() {
    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/caja.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            for (i = 0; i < json.length; i++) {
                filas = json[i].va;
            }
            document.getElementById("monto").value = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 6}));


}

function reporte() {
                var datos;
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "../lib/pdf.php");
                xhr.responseType = "arraybuffer";

                xhr.onload = function () {
                    if (this.status === 200) {
                        var blob = new Blob([xhr.response], {type: "application/pdf"});
                        var objectUrl = URL.createObjectURL(blob);
                        window.open(objectUrl,'_blank');
                    }
                };
                xhr.send();
               // xhr.send(JSON.stringify(datos = {bandera: bandera}));
               // xhr.send(JSON.stringify(datos = {bandera: 2, id: $('#codigo_presupuesto').val()}));
            }


function RealizarCierre(monto){
  
    var xhr = new XMLHttpRequest(),
         method="POST",
         URL="/siscobro/recursos/PHP/AperturaCierreCTR.php";
         xhr.open(method,URL,true);
         xhr.onreadystatechange=function(){
             if(xhr.readyState === XMLHttpRequest.DONE && xhr.status ===200 ){
             //location.href="http://localhost/siscobro/index.php";
             //document.getElementById('main').contentWindow.location.reload(true);
             var html = "";
             parent.location.reload();
             }
         };
         xhr.send(JSON.stringify(datos={Bandera:2,monto:monto}));   
     
    
}