<?php


	#script para hacer la carga de informacion desde la base de datos a la tabla
	include ("../../../connection.php");

	#$idUser = $_REQUEST['data'];
	$idUser = 96885930;
	$query = "select * from cliente join user on (cliente.rutCliente = user.iduser) join device on (device.user = user.iduser) where user.iduser = $idUser";
	$resultado = mysqli_query($conexion, $query);

	$response = [];
	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$response['nombreCliente'] = $data['nombreCliente'];
			$response['rutCliente'] = $data['rutCliente'];
			$response['nameUser'] = $data['nameUser'];
			$response['email'] = $data['email'];
			$response['numberDevice'] = $data['numberDevice'];
		}

		echo json_encode($response);

	}

	mysqli_free_result($resultado);
	mysqli_close($conexion);
?>
