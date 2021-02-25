<?php

	include("../../../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$region = $_REQUEST['region'];
	$comuna = $_REQUEST['comuna'];
	$ciudad = $_REQUEST['ciudad'];
	$direccion = $_REQUEST['direccion'];
	$client = $_REQUEST['client'];

	$idData = time();

	$query = "insert into direccion values ($idData, '$comuna', '$ciudad', '$region', '$direccion', NOW(), NOW(), '$client')";
	$resultado = mysqli_query($conexion, $query);
	$informacion = verificar_resultado( $resultado, $conexion, $query);

	echo json_encode($informacion);

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
		return $informacion;
	}

	function cerrar($conexion){
		mysqli_close($conexion);
	}
?>
