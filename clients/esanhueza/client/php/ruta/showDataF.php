<?php

	#script para hacer la carga de informacion desde la base de datos a la tabla
	include ("../../../connection.php");

	$idUsuario = '96885930';
	$query = "select DISTINCT ruta.idrutas, ruta.nombreRuta, ruta.jornadaRuta, ruta.fecha, ruta.modifiedRuta, ruta.rutChofer  from ruta join documento_en_ruta on (documento_en_ruta.ruta = ruta.idrutas) join documento on (documento.iddocumento = documento_en_ruta.documento) where ruta.estado = 'TERMINADO'";
	$resultado = mysqli_query($conexion, $query);

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$arreglo["data"][] = $data;
		}

		echo json_encode($arreglo);

	}

	mysqli_free_result($resultado);
	mysqli_close($conexion);
?>
