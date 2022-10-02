function CargaTabla() {

    var xhr = new XMLHttpRequest(),
            method = "POST",
            URL = "../PHP/factura.php";
    xhr.open(method, URL, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            var json = JSON.parse(xhr.responseText);
            var i;
            var filas = "";
            var opcion1;
            for (i = 0; i < json.length; i++) {
                filas += "<tr>";
                filas += "<td>" + json[i].id_perfil + "</td>";
                filas += "<td>" + json[i].per_descripcion + "</td>";
              
                filas += "<td><img onclick=\"editar('" + json[i].id_perfil + "','" + json[i].per_descripcion +"')\" src=\"../img/update.png\" alt=\"Mod\"/ class='w3-btn'></td>";
                filas += "<td><img onclick=\"eliminar('" + json[i].id_perfil + "','" + json[i].per_descripcion + "')\" src=\"../img/delete.png\" alt=\"Elim\" class='w3-btn'/></td>";
                filas += "</tr>";
            }
            document.getElementById("Cuerpos").innerHTML = filas;

        }
    };
    xhr.send(JSON.stringify(datos = {Bandera: 4}));


}
