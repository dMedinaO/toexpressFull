<?php

	include("../../../connection.php");#incluimos la base de datos

	$iduser = $_REQUEST['iduser'];
	$name = $_REQUEST['name'];
	$passwd = $_REQUEST['passwd'];
	$email = $_REQUEST['email'];
	$phone = $_REQUEST['phone'];

	$query = "update user set user.nameUser = '$name', user.password='$passwd', user.email='$email', user.modifiedUser=NOW() where user.iduser= $iduser";
	$query2 = "update device set device.numberDevice = '$phone' where device.user=$iduser";

	$resultado = mysqli_query($conexion, $query);
	$resultado = mysqli_query($conexion, $query2);

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
