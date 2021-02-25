<?php

	#script para hacer la carga de informacion desde la base de datos a la tabla
	include ("../../../connection.php");

	$sucursal = $_REQUEST['sucursal'];
	$query = "select * from receptoresProducto join user on (user.iduser = receptoresProducto.idreceptoresProducto ) join device on (device.user = user.iduser) where receptoresProducto.sucursal = $sucursal";
	$resultado = mysqli_query($conexion, $query);

	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$arreglo["data"][] = $data;
		}

		echo json_encode($arreglo);

	}

	mysqli_free_result($resultado);
	mysqli_close($conexion);
?>
