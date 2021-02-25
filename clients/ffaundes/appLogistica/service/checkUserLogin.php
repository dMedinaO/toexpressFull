<?php

  #script que permite procesar si la cuenta de usuario existe o no, en caso de que exista

  #incluimos archivo de conexion a la base de datos...
  include("connection.php");

  #recepcion de parametros...
  $username = $_REQUEST['username'];
  $password = $_REQUEST['password'];
	$responseAndroid = [];

  #formamos la consulta para la base de datos...
  $query = "select COUNT(*) as cantidad from user where user.nameUser  = '$username' AND user.password  = '$password'";

  $resultado = mysqli_query($conexion, $query);

  $response = 0;
	if (!$resultado){
		die("Error");
	}else{

		while($data = mysqli_fetch_assoc($resultado)){

			$response = $data["cantidad"];
		}
	}

  #preguntamos por el valor de response...
  if ($response == 0){

		$responseAndroid["status"] = "ERROR";
  }else{

    #obtenemos el id del usuario...
    #formamos la consulta para la base de datos...
    $query = "select user.iduser from user where user.nameUser = '$username' AND user.password = '$password'";
    $resultado = mysqli_query($conexion, $query);

    $idUser = 0;
  	if (!$resultado){
  		die("Error");
  	}else{

  		while($data = mysqli_fetch_assoc($resultado)){

  			$idUser = $data["iduser"];
  		}
  	}

		$responseAndroid["status"] = "OK";
		$responseAndroid["iduser"] = $idUser;
  }

	echo json_encode($responseAndroid);
	
	mysqli_free_result($resultado);
	mysqli_close($conexion);

?>
