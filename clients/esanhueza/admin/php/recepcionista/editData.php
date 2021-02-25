<?php

	include("../../../connection.php");#incluimos la base de datos

	$name = $_REQUEST['name'];
	$rut = $_REQUEST['rut'];
	$oldRut = $_REQUEST['oldRut'];
	$phone = $_REQUEST['phone'];
	$email = $_REQUEST['email'];
	$username = $_REQUEST['username'];
	$cargo = $_REQUEST['cargo'];

	$query = "update receptoresProducto set receptoresProducto.idreceptoresProducto = $rut, receptoresProducto.nombreReceptor = '$name', receptoresProducto.modifiedReceptor = NOW(), receptoresProducto.cargo='$cargo' where receptoresProducto.idreceptoresProducto = $oldRut";
	$informacion["query1"] = $query;
	$query2 = "update user set user.nameUser = '$username', user.email='$email', user.iduser = $rut, user.modifiedUser= NOW() where user.iduser = $oldRut";
	$informacion["query2"] = $query2;
	$query3 = "update device set device.numberDevice = '$phone' where device.user=$rut";
	$informacion["query3"] = $query3;

	$resultado = mysqli_query($conexion, $query);
	$resultado = mysqli_query($conexion, $query2);
	$resultado = mysqli_query($conexion, $query3);

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
