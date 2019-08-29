<?php

	include("../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$name = $_REQUEST['name'];
	$empresa = $_REQUEST['empresa'];
	$correoContacto = $_REQUEST['correoContacto'];
	$telefono = $_REQUEST['telefono'];
	$username = $_REQUEST['username'];
	$password = $_REQUEST['password'];
	$databasename = $_REQUEST['databasename'];

	$idData = time();

	$query = "insert into administrador values ($idData, '$name', '$empresa', '$correoContacto', '$telefono', '$username', '$password', '$databasename', NOW(), NOW(), 'PENDIENTE')";
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
