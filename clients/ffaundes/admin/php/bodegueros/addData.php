<?php

	include("../../../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$name = $_REQUEST['name'];
	$username = $_REQUEST['username'];
	$phone = $_REQUEST['phone'];
	$email = $_REQUEST['email'];
	$bodega = $_REQUEST['bodega'];

	$idData = time();

	$query = "insert into bodeguero values ($idData, '$name', NOW(), NOW(), $bodega)";
	$resultado = mysqli_query($conexion, $query);
	$informacion = verificar_resultado( $resultado, $conexion, $query);

	if($informacion["respuesta"] == "BIEN"){

		#agregamos el usuario...
		$query = "insert into user values ($idData, '$username', '$username', NOW(), NOW(), 2, '$email')";
		$resultado = mysqli_query($conexion, $query);

		#agregamos el dispositivo
		$query = "insert into device values ($idData, '$phone', '-', $idData)";
		$resultado = mysqli_query($conexion, $query);

		$informacion = verificar_resultado( $resultado, $conexion, $query);

		echo json_encode($informacion);

	}else{
		echo json_encode($informacion);
	}
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
