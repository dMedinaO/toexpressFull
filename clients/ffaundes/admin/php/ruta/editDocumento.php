<?php

	include("../../../connection.php");#incluimos la base de datos

	$iddocumento = $_REQUEST['iddocumento'];
	$monto = $_REQUEST['monto'];
	$folio = $_REQUEST['folio'];
	$fechaEmision = $_REQUEST['fechaEmision'];

	$query = "update documento set folio = $folio, monto = $monto, fechaEmision = '$fechaEmision' where iddocumento = $iddocumento";
	$informacion["query1"] = $query;

	$resultado = mysqli_query($conexion, $query);

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
