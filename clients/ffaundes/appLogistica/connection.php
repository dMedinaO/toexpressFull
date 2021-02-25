<?php
	$server = "localhost";
	$user = "root";
	#$password = "123ewq";
  $password = "desarrollo.toexpress.2019";
  $bd = "dbLogistica";
	$secret = "c85ae6f5bbf337301e33bb5ee0d13f9a7a3e2148";

	$conexion = mysqli_connect($server, $user, $password, $bd);
	if (!$conexion){
		die('Error de Conexión: ' . mysqli_connect_errno());
	}

?>
