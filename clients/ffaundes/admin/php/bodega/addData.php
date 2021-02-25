<?php

	include("../../../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$name = $_REQUEST['name'];
	$provincia = $_REQUEST['provincia'];
	$comuna = $_REQUEST['comuna'];
	$ciudad = $_REQUEST['ciudad'];
	$direccion = $_REQUEST['direccion'];

	$idData = time();

	$query = "insert into bodega values ($idData, '$name', NOW(), NOW())";
	$query2 = "insert into direccionBodega values ($idData, '$provincia', '$direccion', '$comuna', '$ciudad', NOW(), NOW(), $idData)";
	$resultado = mysqli_query($conexion, $query);

	verificar_resultado( $resultado, $conexion, $query2);
	cerrar( $conexion );

	function verificar_resultado($resultado, $conexion, $query){

		if (!$resultado) $informacion["respuesta"] = "ERROR";
		else{

			#hacemos la consulta...
			$resultado2 = mysqli_query($conexion, $query);

			#evaluamos...
			if (!$resultado) $informacion["respuesta"] = "ERROR";
			else{
				$informacion["respuesta"] ="BIEN";
			}
		}
		echo json_encode($informacion);
	}

	function cerrar($conexion){
		mysqli_close($conexion);
	}
?>
