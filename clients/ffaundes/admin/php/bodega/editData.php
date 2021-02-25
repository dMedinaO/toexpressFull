<?php

	include("../../../connection.php");#incluimos la base de datos

	$name = $_REQUEST['name'];
	$provincia = $_REQUEST['provincia'];
	$comuna = $_REQUEST['comuna'];
	$ciudad = $_REQUEST['ciudad'];
	$direccion = $_REQUEST['direccion'];
	$idbodega = $_REQUEST['iduser'];

	$query = "update bodega set bodega.nombre = '$name', bodega.modifiedBodega= NOW() where bodega.idbodega=$idbodega";
	$query2 = "update direccionBodega set direccionBodega.comuna='$comuna', direccionBodega.direccion='$direccion', direccionBodega.ciudad = '$ciudad', direccionBodega.provincia='$provincia', direccionBodega.modified=NOW() where direccionBodega.iddireccionBodega=$idbodega";

	$resultado = mysqli_query($conexion, $query);
	$resultado2 = mysqli_query($conexion, $query2);

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
