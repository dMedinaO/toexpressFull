<?php

	header("content-type: application/json");
	#session_start();
  #$idUSer = $_SESSION['idUser'];
	$idUSer = '96885930';#CLINICA BICENTENERAIO SPA

	#incluimos la conexion a la base de datos
	include ("../../../connection.php");

	#consulta para obtener la cantidad de usuarios
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'INICIADO' AND ruta.jornadaRuta = 'MATUTINA'";
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
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'EN PROCESO' AND ruta.jornadaRuta = 'MATUTINA'";
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
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'TERMINADO' AND ruta.jornadaRuta = 'MATUTINA'";
	$resultadoAAA = mysqli_query($conexion, $query);

	$jobs = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAAA)){

			$jobs = $data['cantidad'];

		}
	}

	##########################################################
	#consulta para obtener la cantidad de usuarios
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'INICIADO' AND ruta.jornadaRuta = 'TARDE'";
	$resultado = mysqli_query($conexion, $query);

	$userMost2 = 0;

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$userMost2 = $data['cantidad'];

		}
	}

	#consulta para obtener la cantidad de instituciones
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'EN PROCESO' AND ruta.jornadaRuta = 'TARDE'";
	$resultadoAA = mysqli_query($conexion, $query);

	$institution2 = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAA)){

			$institution2 = $data['cantidad'];

		}
	}

	#consulta para obtener la cantidad de jobs ejecutados
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'TERMINADO' AND ruta.jornadaRuta = 'TARDE'";
	$resultadoAAA = mysqli_query($conexion, $query);

	$jobs2 = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAAA)){

			$jobs2 = $data['cantidad'];

		}
	}

	##########################################################
	#consulta para obtener la cantidad de usuarios
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'INICIADO' AND ruta.jornadaRuta = 'OTROS'";
	$resultado = mysqli_query($conexion, $query);

	$userMost3 = 0;

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$userMost3 = $data['cantidad'];

		}
	}

	#consulta para obtener la cantidad de instituciones
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'EN PROCESO' AND ruta.jornadaRuta = 'OTROS'";
	$resultadoAA = mysqli_query($conexion, $query);

	$institution3 = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAA)){

			$institution3 = $data['cantidad'];

		}
	}

	#consulta para obtener la cantidad de jobs ejecutados
	$query = "select COUNT(*) as cantidad from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'TERMINADO' AND ruta.jornadaRuta = 'OTROS'";
	$resultadoAAA = mysqli_query($conexion, $query);

	$jobs3 = 0;

	if (!$resultadoAA){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultadoAAA)){

			$jobs3 = $data['cantidad'];

		}
	}


	$responseData = [];
	$responseData['panel1'] = $userMost;
	$responseData['panel2'] = $institution;
	$responseData['panel3'] = $jobs;

####################################
	$responseData['panel4'] = $userMost2;
	$responseData['panel5'] = $institution2;
	$responseData['panel6'] = $jobs2;

####################################
	$responseData['panel7'] = $userMost3;
	$responseData['panel8'] = $institution3;
	$responseData['panel9'] = $jobs3;

	echo json_encode($responseData);

	mysqli_free_result($resultado);
	mysqli_close($conexion);

?>
