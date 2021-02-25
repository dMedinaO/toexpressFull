<?php

	include("../../../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$name = $_REQUEST['name'];
	$rut = $_REQUEST['rut'];
	$phone = $_REQUEST['phone'];
	$email = $_REQUEST['email'];
	$username = $_REQUEST['username'];

	$query = "insert into cliente values ('$rut', '$name', NOW(), NOW())";
	$resultado = mysqli_query($conexion, $query);
	$informacion = verificar_resultado( $resultado, $conexion, $query);

	if($informacion["respuesta"] == "BIEN"){

		#agregamos el usuario...
		$query = "insert into user values ($rut, '$username', '$rut', NOW(), NOW(), 4, '$email')";
		$resultado = mysqli_query($conexion, $query);

		#agregamos el dispositivo
		$query = "insert into device values ($rut, '$phone', '-', $rut)";
		$resultado = mysqli_query($conexion, $query);

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
