<?php

	include ("../../../connection.php");

	#obtenemos el id del formulario

	$informacion = [];

	#hacemos la consulta
	$chofer = $_REQUEST['chofer'];
	$vehiculo = $_REQUEST['vehiculo'];

	$query = "delete from vehiculoAsignado where vehiculoAsignado.vehiculo_patente = '$vehiculo' AND vehiculoAsignado.chofer_rutChofer = $chofer";

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
