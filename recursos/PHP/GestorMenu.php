<?php

require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
include '../../log/Log.class.php';



if($_SERVER['REQUEST_METHOD']=='POST'){
    $datos = json_decode(file_get_contents("php://input"),true);
     
    $log= new Log();

		
    $Bandera = $datos["Bandera"];
    
  

    switch ($Bandera) {
        case '1':
     $datos = json_decode(file_get_contents("php://input"),true);
		
    $id_perfil = $datos["id_perfil"];
     $bd=Db::getInstance(); 
            
$sql="SELECT * FROM menu where estado = 1";

#$log->insert('Imprimiendo '.$datos.' datos');    

$stmt=$bd->ejecutar($sql);
/*Realizamos un bucle para ir obteniendo los resultados*/
$json=array();


while($fila=$bd->obtener_fila($stmt,0)){
   
$inicio="<div class='w3-dropdown-hover'><button class='w3-button'>";

$des=$fila[1].'</button>';
$medio="<div class='w3-dropdown-content w3-bar-block w3-card-2'>";
/*$sqlw="SELECT item.url
    ,item.descripccion as item
    FROM permisomenu per
    INNER JOIN menuiten item on item.id=per.idmenuitem
    INNER JOIN menu menu on menu.id=item.id_menu
    where per.id_perfil='$id_perfil' and menu.id='$fila[0]'and per.estado=1";*/
$sqlw="SELECT item.url
    ,item.descripccion as item
    FROM permisomenu per
    INNER JOIN menuitem item on item.id=per.idorden
    INNER JOIN menu menu on menu.id=item.id_menu
    where per.cod_perfil_usu='$id_perfil' and menu.id='$fila[0]' and per.estado=1";
 $log->insert('SQL PermisosMenu:'.$sqlw);
$stmtw=$bd->ejecutar($sqlw);
/*Realizamos un bucle para ir obteniendo los resultados*/
$itemc="";
while ($filaw=$bd->obtener_fila($stmtw,0)){

    $itemc .="<a href='$filaw[0]' target='contenedor_paginas' class='w3-bar-item w3-button'>$filaw[1]</a>";


}

$medioas=$itemc;
$fin='</div></div>';

$cadena=$inicio.$des.$medio.$medioas.$fin;
    
$json[]= array('cadena'=> $cadena);


}

echo json_encode($json);

break;

case 2:
    $bd=Db::getInstance(); 
    $log->insert('entrando a caso 2');    

    $sql = "SELECT `cod_caja`, `descrip_caja` FROM `caja`";//"SELECT `id_caja`, `caja_descripcion` FROM `cajas`";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {
       
    $log->insert('obteniendo cajas');    

        $codigo = $fila[0];
        $descripcion = $fila[1];


        $json[] = array(
            'codigo' => $codigo,
            'descripcion' => $descripcion);
    }

    echo json_encode($json);
   
    
break;



   }
   
   
   
   
   
   
 }




