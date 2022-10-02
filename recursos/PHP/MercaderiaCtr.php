<?php
require '../../data_lab/Db.class.php';
require '../../data_lab/Conf.class.php';
///intdiv($dividend, $divisor)


if($_SERVER['REQUEST_METHOD']=='POST'){
    $datos = json_decode(file_get_contents("php://input"),true);
		
    $Bandera = $datos["Bandera"];
    $bd=Db::getInstance();
    

    
    controlAcceso($Bandera);
 }                

$Bandera=$datos;

function controlAcceso($Bandera){
    switch ($Bandera) {
        case 1;
        agregar();
        break;
        case 2;
        Modificar();

        break;
        case 3;
         Eliminar();

        break;
        case 4;
       cargartabla();

        break;
        case 6;
        cargarNacionalidad();

        break;
        case 7;
       cargartipo_mercaderia();

        break;


    }   
    
}

function cargarNacionalidad() {
    global $bd;
    $sql = "SELECT * FROM nacionalidad ";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {


        $codigo = $fila[0];
        $descripcion = $fila[1];


        $json[] = array(
            'codigo' => $codigo,
            'descripcion' => $descripcion);
    }

    echo json_encode($json);
}

function cargartipo_mercaderia() {
    global $bd;
    $sql = "SELECT * FROM `tipo_mercaderias` ";

    $stmt = $bd->ejecutar($sql);

    /* Realizamos un bucle para ir obteniendo los resultados */
    $json = array();
    while ($fila = $bd->obtener_fila($stmt, 0)) {


        $codigo = $fila[0];
        $descripcion = $fila[1];


        $json[] = array(
            'codigo' => $codigo,
            'descripcion' => $descripcion);
    }

    echo json_encode($json);
}

function cargartabla(){
global $bd;
$sql="SELECT m.id_mercaderia, m.mer_descripcion,
m.mer_costo,m.mer_precio, m.id_nacionalidad, 
i.descripccion, m.id_tipo_mercaderia,n.descripccion,t.descripcion FROM mercaderias m 
INNER JOIN impuesto i on i.id_impuesto =m.id_impuesto
INNER JOIN nacionalidad n on n.id_nacionalidad =m.id_nacionalidad
INNER JOIN tipo_mercaderias t on t.id_tipo_mercaderia = m.id_tipo_mercaderia"; 

$stmt=$bd->ejecutar($sql);

/*Realizamos un bucle para ir obteniendo los resultados*/
$json=array();
while ($fila=$bd->obtener_fila($stmt,0)){
   

$codigo=$fila[0];
$descripcion=$fila[1];
$costo=$fila[2];
$precio=$fila[3];
$tipoimpuesto=$fila[5];
$nacionalidad=$fila[7];
$tipo=$fila[8];
    
$json[]= array(
'codigo'=> $codigo,
'descripcion'=> $descripcion,
'costo'=> $costo,
'precio'=> $precio,
'nacionalidad'=> $nacionalidad,
'tipo'=> $tipo,    
'tipoimpuesto'=> $tipoimpuesto);
             
}

echo json_encode($json);    
}

function agregar(){
 $datos = json_decode(file_get_contents("php://input"),true);
 //$id = $datos["id_mercaderia"];   
 $Descripcion = $datos["mer_descripcion"];   
 $costo = $datos["mer_costo"];   
 $precio = $datos["mer_precio"];   
 $id_nacionalidad = $datos["id_nacionalidad"];  
 $tipoimpuesto = $datos["mer_tipoimpuesto"];  
 $tipo_mercaderia = $datos["tipo_mercaderia"];  
 
 
global $bd;
$sql="INSERT INTO `mercaderias`(mer_descripcion,mer_costo,mer_precio,id_nacionalidad,id_impuesto,id_tipo_mercaderia) VALUES (?,?,?,?,?,?)"; 
//INSERT INTO `mercaderias`(`mer_descripcion`, `mer_costo`, `mer_precio`, `mer_tipoimpuesto`) VALUES (?,?,?,?)
$stmt3=$bd->ejecutarPrepared($sql);

mysqli_stmt_bind_param($stmt3,"ssssss",$Descripcion,$costo,$precio,$id_nacionalidad,$tipoimpuesto,$tipo_mercaderia);

mysqli_stmt_execute($stmt3);

$filas=$bd->filas();

if($filas>0){
$retorno="Agregado";
 $json[]=array('retorno'=>$retorno); 
}else{
$retorno="Error agreado";
$json[]=array('retorno'=>$retorno); 
}

	
echo json_encode($json); 
}

function Modificar(){
global $bd;
	 $datos = json_decode(file_get_contents("php://input"),true);
        $id = $datos["id_mercaderia"];   
        $Descripcion = $datos["mer_descripcion"];   
        $costo = $datos["mer_costo"];   
        $precio = $datos["mer_precio"]; 
        $id_nacionalidad = $datos["id_nacionalidad"];  
        $tipoimpuesto = $datos["mer_tipoimpuesto"]; 
        $tipo_mercaderia = $datos["tipo_mercaderia"];  
        $retorno="";
	$json=array();

$sql3="UPDATE `mercaderias` SET `mer_descripcion`=?,`mer_costo`=?,`mer_precio`=?,`id_nacionalidad`=?,`id_impuesto`=?,`id_tipo_mercaderia`=? WHERE `id_mercaderia`=?";
//$sql3="UPDATE `mercaderias` SET `mer_descripcion`=?,`mer_costo`=?,`mer_precio`=?,`mer_tipoimpuesto`=? WHERE `id_mercaderia`=?";

$stmt3=$bd->ejecutarPrepared($sql3);

mysqli_stmt_bind_param($stmt3,"sssssss",$Descripcion,$costo,$precio,$id_nacionalidad,$tipoimpuesto,$tipo_mercaderia,$id);

mysqli_stmt_execute($stmt3);

$filas=$bd->filas();

if($filas>0){
$retorno="Actualizado Correctamente";
$json[]=array('retorno'=>$retorno);	
echo json_encode($json);

}else if($filas==0){
$retorno="No se han realizado cambios en el registro";
$json[]=array('retorno'=>$retorno);	
echo json_encode($json);
}else{
$retorno="Error Al actualizar";
$json[]=array('retorno'=>$retorno);
echo json_encode($json);
}	

}

function Eliminar(){
    global  $bd;
	 $datos = json_decode(file_get_contents("php://input"),true);
        $id = $datos["id_mercaderia"];   
        
        $retorno="";
	$json=array(); 

$sql3="DELETE FROM `mercaderias` WHERE id_mercaderia=?";

$stmt3=$bd->ejecutarPrepared($sql3);

mysqli_stmt_bind_param($stmt3,"i",$id);

mysqli_stmt_execute($stmt3);

$filas=$bd->filas();

if($filas>0){
$retorno="Eliminado Correctamente";
$json[]=array('retorno'=>$retorno);	
echo json_encode($json);

}else{
$retorno="Error Al Eliminar";
$json[]=array('retorno'=>$retorno);
echo json_encode($json);
}	


}


