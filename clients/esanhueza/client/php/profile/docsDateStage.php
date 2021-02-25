<?php

#header("content-type: application/json");

#incluimos la conexion a la base de datos
include ("../../../connection.php");
$idUSer = '96885930';#CLINICA BICENTENERAIO SPA

$responseFinal = [];

$seriesData = [];
$responseFinal = [];

$series = [];
$series['name'] = "Documentos";

$query = "select count(CAST(documento.fechaEmision as DATE)) as cantidad, CAST(documento.fechaEmision as DATE) as fecha from documento where documento.rutReceptor = '$idUSer' group by CAST(documento.fechaEmision as DATE)";
$resultData = mysqli_query($conexion, $query);
$dataValues = [];

$cont=0;
while($data = mysqli_fetch_assoc($resultData)){

  $dataCol = [];
  $fecha = $data['fecha'];
  $cantidad = $data['cantidad'];

  #transformamos la fecha a formato Date.UTC...
  $dataFecha = explode("-", $fecha);
  $fechaReal = "Date.UTC(".$dataFecha[0].",".$dataFecha[1].",".$dataFecha[2].")";


  $dataCol[0] = $fecha;

  $dataCol[1] = (int)$cantidad;

  $dataValues[$cont] = $dataCol;
  $cont++;
}

$series['data'] = $dataValues;

$seriesData[0] = $series;


$responseFinal['valuesData'] = $seriesData;

echo json_encode($responseFinal);
mysqli_free_result($resultData);
mysqli_close($conexion);
?>
