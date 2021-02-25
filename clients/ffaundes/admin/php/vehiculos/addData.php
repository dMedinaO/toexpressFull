<?php

	include("../../../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$patente = $_REQUEST['patente'];
	$marca = $_REQUEST['marca'];
	$modelo = $_REQUEST['modelo'];
	$ano = $_REQUEST['ano'];

	$idData = time();

	$query = "insert into vehiculo values ('$patente', '$marca', '$modelo', $ano, NOW(), NOW())";
	$resultado = mysqli_query($conexion, $query);

	verificar_resultado( $resultado, $conexion, $query);
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
