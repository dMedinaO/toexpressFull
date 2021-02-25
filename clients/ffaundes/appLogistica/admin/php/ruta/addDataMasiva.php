<?php

	include("../../../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$ruta = $_REQUEST['ruta'];

	#obtenemos el nombre del archivo
	$pathRespone = "../../../docsResource/";
  #obtenemos el nombre del archivo de entrada...
  $pathData = "../../../docsResource/docName.txt";
  $nameDocument = readDocument($pathData);
	$nameDocument = $pathRespone.$nameDocument;

	#ejecutamos el comando python
	$command = "python ../../../service/pythonScripts/processCargaMasiva.py $nameDocument $ruta";
	$output = [];
	exec($command, $output);

	$response['process'] = $output[0];
	echo json_encode($response);

	#funcion que permite la lectura de archivos...
  function readDocument($nameFile){
    $nameDocument = "";
    //leemos un archivo de texto para capturar el nombre de la imagen...
    $file = fopen($nameFile, "r");
    while(!feof($file)) {
      $nameDocument =  fgets($file);
    }
    fclose($file);
    return $nameDocument;
  }

?>
