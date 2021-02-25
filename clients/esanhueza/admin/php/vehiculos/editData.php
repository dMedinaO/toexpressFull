<?php

	include("../../../connection.php");#incluimos la base de datos

	$patenteOld = $_REQUEST['patenteOld'];
	$patente = $_REQUEST['patente'];
	$marca = $_REQUEST['marca'];
	$modelo = $_REQUEST['modelo'];
	$ano = $_REQUEST['ano'];

	$query = "update vehiculo set vehiculo.patente='$patente', vehiculo.marca='$marca', vehiculo.modelo='$modelo', vehiculo.anoVehiculo=$ano, vehiculo.modifiedVehiculo = NOW() where vehiculo.patente = '$patenteOld'";

	$resultado = mysqli_query($conexion, $query);

	verificar_resultado( $resultado);
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
