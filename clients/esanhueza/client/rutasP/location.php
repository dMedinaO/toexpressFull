<?php

include_once "connection.php";

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// se inicializa la conexion a la base de datos
if ( !isset($conn) ){
    $conn = mysqli_connect($server, $user, $password, $bd);
    mysqli_set_charset($conn,"utf8");
    if (!$conn){
        http_response_code(500);
        echo json_encode(array("message", "Can't connect to database."));
        die();
    }
}


$query =<<<'QUERY'
select chofer.rutChofer as rut, chofer.nombre, chofer.latitud, chofer.longitud, chofer.ultimaActualizacion
from ruta
join documento_en_ruta dr on dr.ruta = ruta.idrutas 
join documento d on dr.documento = d.iddocumento
join chofer on ruta.rutChofer = chofer.rutChofer
AND chofer.ultimaActualizacion IS NOT NULL
AND ruta.estado = "PENDIENTE"
limit 1
QUERY;


$query = sprintf($query);
$resultado = mysqli_query($conn, $query);

$json = mysqli_fetch_all ($resultado, MYSQLI_ASSOC);

echo json_encode($json);

mysqli_free_result($resultado);


http_response_code(200);
header('Content-Type: application/json');

mysqli_close($conn);
?>
