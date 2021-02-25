<?php

	header("content-type: application/json");
	#session_start();
  #$idUSer = $_SESSION['idUser'];
	$idUSer = '96885930';#CLINICA BICENTENERAIO SPA

	#incluimos la conexion a la base de datos
	include ("../../../connection.php");

	#consulta para obtener la cantidad de usuarios
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'INICIADO'";
	$resultado = mysqli_query($conexion, $query);

	$userMost = 0;

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$userMost = $data['cantidad'];

		}
	}

	#consulta para obtener la cantidad de instituciones
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'EN PROCESO'";
	$resultadoAA = mysqli_query($conexion, $query);

	$institution = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAA)){

			$institution = $data['cantidad'];

		}
	}

	#consulta para obtener la cantidad de jobs ejecutados
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'TERMINADO'";
	$resultadoAAA = mysqli_query($conexion, $query);

	$jobs = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAAA)){

			$jobs = $data['cantidad'];

		}
	}

	#consulta para obtener la cantidad de jobs en cola
	$query = "select COUNT(*) as cantidad from comentarioRecepcion where motivo = 'Productos recibidos correctamente.'";
	$resultadoAAA = mysqli_query($conexion, $query);

	$jobsQueue = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAAA)){

			$jobsQueue = $data['cantidad'];

		}
	}

	$responseData = [];
	$responseData['panel1'] = $userMost;
	$responseData['panel2'] = $institution;
	$responseData['panel3'] = $jobs;
	$responseData['panel4'] = $jobsQueue;

	echo json_encode($responseData);

	mysqli_free_result($resultado);
	mysqli_close($conexion);

?>
