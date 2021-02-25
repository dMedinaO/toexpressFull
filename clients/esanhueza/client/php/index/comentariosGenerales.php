<?php

	header("content-type: application/json");

	#incluimos la conexion a la base de datos
	include ("../../../connection.php");
	$idUser = '96885930';

	#consulta para obtener los pacientes anormales segun el criterio chileno
	$query = "select COUNT(comentarioRecepcion.motivo) as cantidad, comentarioRecepcion.motivo from documento join documento_en_ruta on (documento.iddocumento = documento_en_ruta.documento) join comentarioRecepcion on (documento_en_ruta.comentario = comentarioRecepcion.idcomentario) group by comentarioRecepcion.motivo";
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
