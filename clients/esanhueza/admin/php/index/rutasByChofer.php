<?php

	header("content-type: application/json");

	#incluimos la conexion a la base de datos
	include ("../../../connection.php");

	#consulta para obtener los pacientes anormales segun el criterio chileno
	$query = "select COUNT(ruta.rutChofer) as cantidad, ruta.rutChofer from ruta group by ruta.rutChofer";
	$resultado = mysqli_query($conexion, $query);

	$responseData = [];

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$responseData[] = $data;

		}
	}

	echo json_encode($responseData);

	mysqli_free_result($resultado);
	mysqli_close($conexion);

?>
