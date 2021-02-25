<?php

#header("content-type: application/json");

#incluimos la conexion a la base de datos
include ("../../../connection.php");

$query = "select cliente.nombreCliente, cliente.rutCliente from cliente";
$resultData = mysqli_query($conexion, $query);

#para cada cliente obtenemos la informacion de la data de fechas y hacemos la serie para dicho sujeto
$responseInformation = [];

$index=0;
while($data = mysqli_fetch_assoc($resultData)){

  #obtenemos las fechas y la cantidad de documentos por fecha
  $rutClient = $data['rutCliente'];
  $nameClient = $data['nombreCliente'];
  $serie['name'] = $nameClient;

  $queryDate = "select count(CAST(documento.fechaEmision as DATE)) as cantidad, CAST(documento.fechaEmision as DATE) as fecha from documento where documento.rutReceptor = $rutClient group by CAST(documento.fechaEmision as DATE)";

  $dataArray = [];
  $resultQuery = mysqli_query($conexion, $queryDate);

  $cont=0;
  while($data = mysqli_fetch_assoc($resultQuery)){

    $dataCol = [];
    $fecha = $data['fecha'];
    $cantidad = $data['cantidad'];

    #transformamos la fecha a formato Date.UTC...
    $dataFecha = explode("-", $fecha);
    $fechaReal = "Date.UTC(".$dataFecha[0].",".$dataFecha[1].",".$dataFecha[2].")";


    $dataCol[0] = $fecha;
    $dataCol[1] = (int)$cantidad;

    $dataArray[$cont] = $dataCol;
    $cont++;
  }
  $serie['data'] = $dataArray;

  $responseInformation[$index] = $serie;
  $index++;
}

echo json_encode($responseInformation);
mysqli_close($conexion);

?>
