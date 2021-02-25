<?php

	include ("../../../connection.php");

	#obtenemos el id del formulario

	$informacion = [];

	#hacemos la consulta
	$iddocumento = $_REQUEST['iddocumento'];

	$query = "delete from documento where documento.iddocumento=$iddocumento";
	$resultado = mysqli_query($conexion, $query);

	verificar_resultado( $resultado );
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
