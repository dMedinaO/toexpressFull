<?php

	include("../../../connection.php");#incluimos la base de datos

	$comuna = $_REQUEST['comuna'];
	$region = $_REQUEST['region'];
	$ciudad = $_REQUEST['ciudad'];
	$direccion = $_REQUEST['direccion'];
	$iddireccion = $_REQUEST['iddireccion'];

	$query = "update direccion set direccion.comuna = '$comuna', direccion.region = '$region', direccion.ciudad = '$ciudad', direccion.direccionValue = '$direccion', direccion.modifiedDireccion = NOW() where direccion.iddireccion = $iddireccion";
	$informacion["query1"] = $query;

	$resultado = mysqli_query($conexion, $query);

	$informacion["response"] = verificar_resultado( $resultado, $informacion);
	echo json_encode($informacion);
	cerrar( $conexion );

	function verificar_resultado($resultado){

		if (!$resultado) $informacion["respuesta"] = "ERROR";
		else $informacion["respuesta"] ="BIEN";
		return $informacion;
	}

	function cerrar($conexion){
		mysqli_close($conexion);
	}
?>
