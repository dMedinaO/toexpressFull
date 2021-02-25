<?php

  include("../../../connection.php");#incluimos la base de datos

  #recibimos la data de interes...
  $name = $_REQUEST['nameRuta'];
  $jornada = $_REQUEST['jornada'];
  $chofer = $_REQUEST['chofer'];

  $idruta = time();

  #consulta a la base de datos para realizar la insercion...
  $query = "insert into ruta values ($idruta, '$name', '$jornada', $chofer, NOW(), NOW(), 'INICIADO')";

  $resultado = mysqli_query($conexion, $query);
	$informacion = verificar_resultado( $resultado, $conexion, $query);
  $informacion['ruta'] = $idruta;
  $informacion['query'] = $query;

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
