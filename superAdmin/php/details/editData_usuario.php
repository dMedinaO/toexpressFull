<?php

	include("../connection.php");#incluimos la base de datos

	$id_administrador = $_REQUEST['id_administrador'];
	$username = $_REQUEST['username'];
	$password = $_REQUEST['password'];

	$query = "update administrador set nameUser='$username', password='$password' where idadministrador=$id_administrador";

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
