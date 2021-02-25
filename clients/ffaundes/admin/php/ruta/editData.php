<?php

	include("../../../connection.php");#incluimos la base de datos

	$name = $_REQUEST['name'];
	$jornada = $_REQUEST['jornada'];
	$idrutas = $_REQUEST['idrutas'];

	$query = "update ruta set ruta.nombreRuta = '$name', ruta.jornadaRuta='$jornada', ruta.modifiedRuta= NOW() where ruta.idrutas = $idrutas";
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
