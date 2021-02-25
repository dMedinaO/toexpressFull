<?php

	#script para hacer la carga de informacion desde la base de datos a la tabla
	include ("../../../connection.php");

	$ruta = $_REQUEST['ruta'];
	$query = "select * from ruta where ruta.idrutas = $ruta";

	$resultado = mysqli_query($conexion, $query);
	$response = [];

	if (!$resultado){
		$response['exec'] = "ERROR";
	}else{

		$response['exec'] = "OK";
		while($data = mysqli_fetch_assoc($resultado)){

			$response['name'] = $data['nombreRuta'];
			$response['fecha'] = $data['fecha'];
			$response['estado'] = $data['estado'];
			$response['chofer'] = $data['rutChofer'];
		}
	}

	echo json_encode($response);
	mysqli_free_result($resultado);
	mysqli_close($conexion);
?>
