<?php

	header("content-type: application/json");

	#incluimos la conexion a la base de datos
	include ("../../../connection.php");

	#consulta para obtener los pacientes anormales segun el criterio chileno
	$query = "select COUNT(documento.rutReceptor) as cantidad, documento.rutReceptor  from documento group by documento.rutReceptor";
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
