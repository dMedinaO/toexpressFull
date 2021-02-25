<?php

	include("../../../connection.php");#incluimos la base de datos

	#hacemos la obtencion de los datos
	$folio = $_REQUEST['folio'];
	$fechaEmision = $_REQUEST['fechaEmision'];
	$rut = $_REQUEST['rut'];
	$monto = $_REQUEST['monto'];
	$tipoDoc = $_REQUEST['tipoDoc'];
	$ruta = $_REQUEST['ruta'];
	$iddocumento = time();

	$query = "insert into documento values ($iddocumento, $tipoDoc, $folio, '$fechaEmision', $monto, $rut)";
	$query2 = "insert into documento_en_ruta values ($iddocumento, $ruta, NULL)";
	$resultado = mysqli_query($conexion, $query);

	$informacion = verificar_resultado( $resultado, $conexion, $query2);

	echo json_encode($informacion);

	cerrar( $conexion );

	function verificar_resultado($resultado, $conexion, $query){

		if (!$resultado) $informacion["respuesta"] = "ERROR";
		else{

			#hacemos la consulta...
			$resultado2 = mysqli_query($conexion, $query);

			#evaluamos...
			if (!$resultado) $informacion["respuesta"] = "ERROR";
			else{
				$informacion["respuesta"] ="BIEN";
			}
		}
		return $informacion;
	}

	function cerrar($conexion){
		mysqli_close($conexion);
	}
?>
