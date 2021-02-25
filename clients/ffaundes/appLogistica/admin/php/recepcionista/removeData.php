<?php

	include ("../../../connection.php");

	#obtenemos el id del formulario

	$informacion = [];

	#hacemos la consulta
	$idbodeguero = $_REQUEST['iduser'];


	$query = "delete from receptoresProducto where receptoresProducto.idreceptoresProducto = $idbodeguero";
	$query2 = "delete from user where user.iduser = $idbodeguero";

	$resultado = mysqli_query($conexion, $query);
	$resultado = mysqli_query($conexion, $query2);

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
