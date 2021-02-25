<?php

	include("../connection.php");#incluimos la base de datos

	$id_administrador = $_REQUEST['id_administrador'];
	$nombreAdmin = $_REQUEST['nombreAdmin'];
	$empresa = $_REQUEST['empresa'];
	$correoContacto = $_REQUEST['correoContacto'];
	$telefonoContacto = $_REQUEST['telefonoContacto'];

	$query = "update administrador set nombreAdmin='$nombreAdmin', empresa='$empresa', correoContacto='$correoContacto', telefonoContacto='$telefonoContacto' where idadministrador=$id_administrador";

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
