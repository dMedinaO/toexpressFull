<?php

	include("../../../connection.php");#incluimos la base de datos

	$name = $_REQUEST['name'];
	$username = $_REQUEST['username'];
	$phone = $_REQUEST['phone'];
	$email = $_REQUEST['email'];
	$bodega = $_REQUEST['bodega'];
	$idbodeguero = $_REQUEST['iduser'];

	$query = "update bodeguero set bodeguero.nombreBodeguero='$name', bodeguero.bodega=$bodega where bodeguero.idbodeguero=$idbodeguero";
	$informacion["query1"] = $query;
	$query2 = "update user set user.nameUser = '$username', user.email='$email', user.modifiedUser= NOW() where user.iduser = $idbodeguero";
	$informacion["query2"] = $query2;
	$query3 = "update device set device.numberDevice = '$phone' where device.user=$idbodeguero";
	$informacion["query3"] = $query3;

	$resultado = mysqli_query($conexion, $query);
	$resultado2 = mysqli_query($conexion, $query2);
	$resultado3 = mysqli_query($conexion, $query3);

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
