<?php

	include ("../../../connection.php");

	#obtenemos el id del formulario

	$informacion = [];

	#hacemos la consulta
	$idrutas = $_REQUEST['idrutas'];

	$query = "delete from ruta where ruta.idrutas = $idrutas";
	$resultado = mysqli_query($conexion, $query);

	verificar_resultado( $resultado );
	cerrar( $conexion );

	function verificar_resultado($resultado){

		if (!$resultado) $informacion["respuesta"] = "ERROR";
		else $informacion["respuesta"] ="BIEN";
		echo json_encode($informacion);
	}

	function cerrar($conexion){
		mysqli_close($conexion);
	}

?>
